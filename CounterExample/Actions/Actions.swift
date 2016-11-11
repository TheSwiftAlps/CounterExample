import ReSwift

protocol NamedAction: Action {
    var name: String { get }
}

// all of the actions that can be applied to the state
struct CounterActionIncrease: NamedAction {
    let name: String
}
struct CounterActionDecrease: NamedAction {
    let name: String
}

struct CounterActionAdd: NamedAction {
    let name: String
}

struct CounterActionRemove: NamedAction {
    let name: String
}
