import ReSwift

// all of the actions that can be applied to the state
struct CounterActionIncrease: Action {
    let index: Int
}
struct CounterActionDecrease: Action {
    let index: Int
}

struct CounterActionAdd: Action {

}

struct CounterActionRemove: Action {
    let index: Int
}
