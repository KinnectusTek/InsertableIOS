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
        var cancellables = Set<AnyCancellable>()
        switch operation {
        case .multiplyByInteger(let key, let multiple):
            if let value = state.value.state.first(where: {$0.id == key}) {
                
                switch value {
                case .double(let id, let double):
                    let updateValue = InjectedValue.double(id: id, value: double * Double(multiple))
                    Self.updateState(state, updateValue)
                case .integer(let id, let integer):
                    let updateValue = InjectedValue.integer(id: id, value: integer * multiple)
                    Self.updateState(state, updateValue)
                default:
                    break
                }
            
            }
        case .divideByInteger(let key, let quotient):
            if let value = state.value.state.first(where: {$0.id == key}) {
                switch value {
                case .double(let id, let double):
                    let updateValue = InjectedValue.double(id: id, value: double / Double(quotient))
                    Self.updateState(state, updateValue)
                case .integer(let id, let integer):
                    let updateValue = InjectedValue.integer(id: id, value: integer / quotient)
                    Self.updateState(state, updateValue)
                default:
                    break
                }
            }
        case .assign(_, let value):
            Self.updateState(state, value)
        case .noOperation:
            break
        case .async(let operation):
            Future<InjectedState, Never> { promise in
                performOperation(state: state, operation: operation)
                return promise(.success(state.value))
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

        }
    }
    
    static func updateState(_ state: CurrentValueSubject<InjectedState, Never>, _ updatedValue: InjectedValue) {
        state.value.state = state.value.state.map({ value in
            if value.id == updatedValue.id {
                return updatedValue
            } else {
                return value
            }
        })
    }
}

