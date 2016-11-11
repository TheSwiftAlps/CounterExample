import ReSwift

protocol CounterAction: Action {
    var uuid: UUID { get }
}

// all of the actions that can be applied to the state
struct CounterActionIncrease: CounterAction {
    let uuid: UUID
}
struct CounterActionDecrease: CounterAction {
    let uuid: UUID
}

struct CounterActionAdd: CounterAction {
    let name: String
    let uuid = UUID()
}

struct CounterActionRemove: CounterAction {
    let uuid: UUID
}
