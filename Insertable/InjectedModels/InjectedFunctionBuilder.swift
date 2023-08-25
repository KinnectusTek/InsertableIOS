//
//  InjectedFunctionBuilder.swift
//  Insertable
//
//  Created by Blake Osonduagwueki on 8/19/23.
//

import Foundation
import Combine

@resultBuilder
struct InjectedFunctionBuilder {
    
    var state: CurrentValueSubject<InjectedState, Never>?
    var operation: InjectedOperation
    static var cancellables = Set<AnyCancellable>()
    
    static func buildBlock(_ components: InjectedFunctionBuilder...) -> InjectedFunctionBuilder {
        return components.reduce(InjectedFunctionBuilder(operation: .noOperation)) { partialResult, next in
            if let state = partialResult.state ?? next.state {
                performOperation(state: state, operation: next.operation)
                return InjectedFunctionBuilder(state: state, operation: next.operation)
            }
            return InjectedFunctionBuilder(state: nil, operation: next.operation)
        }
    }
    
    static func performOperation(state: CurrentValueSubject<InjectedState, Never>, operation: InjectedOperation) {
        switch operation {
        case .asyncAfter(let operation, let delay):
            Future<InjectedState, Never> { promise in
                promise(.success(provideStateTransformedByOperation(state: state.value, operation: operation)))
            }.delay(for: .seconds(delay), scheduler: RunLoop.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { futureState in
                state.value = futureState
            }.store(in: &cancellables)
        
        case .async(let operation):
            Future<InjectedState, Never> { promise in
                promise(.success(provideStateTransformedByOperation(state: state.value, operation: operation)))
            }.sink { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    break
                }
            } receiveValue: { futureState in
                state.value = futureState
            }.store(in: &cancellables)
        default:
            state.send(provideStateTransformedByOperation(state: state.value, operation: operation))
        }
    }
    
    static func provideStateUpdatedByValue(_ state: InjectedState, _ updatedValue: InjectedValue) -> InjectedState {
        state |> prop(\.state) ({
            $0.map { value in
                if value.id == updatedValue.id {
                    return updatedValue
                } else {
                    return value
                }
            }
        })
    }
    
    static func provideStateTransformedByOperation(state: InjectedState, operation: InjectedOperation) -> InjectedState {
        switch operation {
        case .multiplyByInteger(let key, let multiple):
            if let value = state.state.first(where: {$0.id == key}) {
                switch value {
                case .double(let id, let double):
                    let updateValue = InjectedValue.double(id: id, value: double * Double(multiple))
                    return provideStateUpdatedByValue(state, updateValue)
                case .integer(let id, let integer):
                    let updateValue = InjectedValue.integer(id: id, value: integer * multiple)
                    return provideStateUpdatedByValue(state, updateValue)
                default:
                    return state
                }
            }
        case .divideByInteger(let key, let quotient):
            if let value = state.state.first(where: {$0.id == key}) {
                switch value {
                case .double(let id, let double):
                    let updateValue = InjectedValue.double(id: id, value: double / Double(quotient))
                    return provideStateUpdatedByValue(state, updateValue)
                case .integer(let id, let integer):
                    let updateValue = InjectedValue.integer(id: id, value: integer / quotient)
                    return provideStateUpdatedByValue(state, updateValue)
                default:
                    return state
                }
            }
        case .assign(_, let value):
            return provideStateUpdatedByValue(state, value)
        case .noOperation:
            return state
        default:
            return state
        }
        return state
    }
}

