import ReSwift

struct Counter: Equatable {
    let name: String
    var value: Int = 0

    init(name: String) {
        self.name = name
    }

    static func ==(lhs: Counter, rhs: Counter) -> Bool {
        return lhs.name == rhs.name
    }
}

struct AppState: StateType {
    var names: [String] = []
    var counterIndex: [String: Counter] = [:]

    func counter(at index: Int) -> Counter? {
        let name = names[index]
        return counterIndex[name]
    }
}
