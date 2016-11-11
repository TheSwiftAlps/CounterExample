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

        guard let namedAction = action as? CounterAction
            else { return state }

        if let counter = state.counterIndex[namedAction.uuid] {
            var counter = counter
            switch action {
            case is CounterActionIncrease:
                counter.value += 1
                state.counterIndex[counter.uuid] = counter
            case is CounterActionDecrease:
                counter.value -= 1
                state.counterIndex[counter.uuid] = counter
            case is CounterActionRemove:
                if let index = state.uuids.index(of: counter.uuid) {
                    state.uuids.remove(at: index)
                    state.counterIndex.removeValue(forKey: counter.uuid)
                }
            default:
                break
            }
        } else if let addAction = namedAction as? CounterActionAdd {
            let counter = Counter(uuid: addAction.uuid, name: addAction.name)
            state.uuids.append(counter.uuid)
            state.counterIndex[counter.uuid] = counter
        }
        return state
    }
    
}
