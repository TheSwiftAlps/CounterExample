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

class AppState: StateType {
    var counters: [Counter] = []
    var previous: AppState? = nil
    var next: AppState? = nil
    
    init(counters: [Counter], previous: AppState?) {
        self.counters = counters
        self.previous = previous
    }
}
