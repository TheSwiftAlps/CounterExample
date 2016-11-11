import ReSwift

struct Counter: Equatable {
    let index: Int
    var value: Int = 0

    init(index: Int) {
        self.index = index
    }

    static func ==(lhs: Counter, rhs: Counter) -> Bool {
        return lhs.index == rhs.index
    }
}

struct AppState: StateType {
    var counters: [Counter] = []
}
