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

extension Counter {
    var dictionary: [String: Int] {
        return [
            "index": index,
            "value": value
        ]
    }
    
    init?(dictionary: [String: Int]) {
        guard
            let index = dictionary["index"],
            let value = dictionary["value"]
            else { return nil }
        self.index = index
        self.value = value
    }
}

class AppState: NSObject, StateType, NSCoding {
    var counters: [Counter] = []
    var previous: AppState? = nil
    var next: AppState? = nil
    
    init(counters: [Counter], previous: AppState?) {
        self.counters = counters
        self.previous = previous
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(counters.map { $0.dictionary },
                      forKey: "counters")
        aCoder.encode(previous, forKey: "previous")
        aCoder.encode(next, forKey: "next")
    }
    
    required init?(coder aDecoder: NSCoder) {
        let counters = aDecoder.decodeObject(forKey: "counters") as! [[String: Int]]
        self.counters = counters.flatMap { Counter(dictionary: $0) }
        
        previous = aDecoder.decodeObject(forKey: "previous") as? AppState
        next = aDecoder.decodeObject(forKey: "next") as? AppState
    }
}
