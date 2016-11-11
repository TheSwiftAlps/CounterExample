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

        guard let namedAction = action as? NamedAction
            else { return state }

        var counter = state.counterIndex[namedAction.name] ?? Counter(name: namedAction.name)

        switch action {
        case is CounterActionIncrease:
            counter.value += 1
            state.counterIndex[counter.name] = counter
        case is CounterActionDecrease:
            counter.value -= 1
            state.counterIndex[counter.name] = counter
        case is CounterActionAdd:
            state.names.append(counter.name)
            state.counterIndex[counter.name] = counter
        case is CounterActionRemove:
            if let index = state.names.index(of: counter.name) {
                state.names.remove(at: index)
                state.counterIndex.removeValue(forKey: counter.name)
            }
        default:
            break
        }
        
        return state
    }
    
}
