import ReSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: ReversableAction {
    let index: Int
    func reversed() -> ReversableAction {
        return CounterActionDecrease(index: index)
    }
}

struct CounterActionDecrease: ReversableAction {
    let index: Int
    func reversed() -> ReversableAction {
        return CounterActionIncrease(index: index)
    }
}

protocol ReversableAction: Action {
    func reversed() -> ReversableAction
}
