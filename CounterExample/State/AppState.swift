import ReSwift
import UIKit

struct Counter: Equatable {
    let index: Int
    var value: Int = 0
    
    var colorAlpha: Float = 0
    
    
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

extension AppState {
    
    func backgroundColor(forIndex index: Int) -> UIColor {
        
        let count = self.counters.count
        let cellAlpha = CGFloat(count - index) / CGFloat(count)
        print(cellAlpha)
        print(index)
        print(count)
        
        return UIColor.red.withAlphaComponent(cellAlpha)
    }
}
