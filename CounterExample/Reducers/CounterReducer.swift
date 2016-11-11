import ReSwift

// the reducer is responsible for evolving the application state based
// on the actions it receives
struct CounterReducer: Reducer {
    typealias ReducerStateType = AppState

    
    func handleAction(action: Action, state: AppState?) -> AppState {
        // if no state has been provided, create the default state
        // otherwise the state is recreated every time, i.e. the
        // current state is copied, modified and returned as the new state
        var newState: AppState
        
        if state == nil {
            newState = AppState(counters: [], previous: nil)
        }
        else {
            newState = AppState(counters: state!.counters,
                                previous: state!)
        }
        
        switch action {
        case let increaseAction as CounterActionIncrease:
            var counter = newState.counters[increaseAction.index]
            counter.value += 1
            newState.counters[increaseAction.index] = counter
        case let decreaseAction as CounterActionDecrease:
            var counter = newState.counters[decreaseAction.index]
            counter.value -= 1
            newState.counters[decreaseAction.index] = counter
        case is CounterActionAdd:
            newState.counters.append(Counter(index: newState.counters.count))
        case let removeAction as CounterActionRemove:
            newState.counters.remove(at: removeAction.index)
        case is UndoAction:
            newState = state?.previous ?? AppState(counters: [], previous: nil)
            newState.next = state
        case is RedoAction:
            newState = state!.next!
        default:
            break
        }
        
        return newState
    }
    
}
