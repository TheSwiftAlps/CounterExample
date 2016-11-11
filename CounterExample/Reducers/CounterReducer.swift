import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
struct CounterReducer: Reducer {
    typealias ReducerStateType = AppState

    
    func handleAction(action: Action, state: AppState?) -> AppState {
        // if no state has been provided, create the default state
        // otherwise the state is recreated every time, i.e. the
        // current state is copied, modified and returned as the new state
        var state = state ?? AppState()
        
        switch action {
        case let increaseAction as CounterActionIncrease:
            var counter = state.counters[increaseAction.index]
            counter.value += 1
            state.counters[increaseAction.index] = counter
        case let decreaseAction as CounterActionDecrease:
            var counter = state.counters[decreaseAction.index]
            counter.value -= 1
            state.counters[decreaseAction.index] = counter
        case is CounterActionAdd:
            state.counters.append(Counter(index: state.counters.count))
        case let removeAction as CounterActionRemove:
            state.counters.remove(at: removeAction.index)
        default:
            break
        }
        
        return state
    }
    
}
