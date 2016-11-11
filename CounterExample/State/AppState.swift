import ReSwift
import UIKit

struct Counter: Equatable {
    let uuid: UUID
    let name: String
    var value: Int = 0
    var colorAlpha: Float = 0

    init(uuid: UUID, name: String) {
        self.name = name
        self.uuid = uuid
    }

    static func ==(lhs: Counter, rhs: Counter) -> Bool {
        return lhs.uuid == rhs.uuid
    }
}

struct AppState: StateType {
    var uuids: [UUID] = []
    var counterIndex: [UUID: Counter] = [:]

    func counter(at index: Int) -> Counter? {
        let uuid = uuids[index]
        return counterIndex[uuid]
    }
}

extension AppState {
    
    func backgroundColor(forIndex index: Int) -> UIColor {
        
        let count = self.uuids.count
        let cellAlpha = CGFloat(count - index) / CGFloat(count)
        print(cellAlpha)
        print(index)
        print(count)
        
        return UIColor.red.withAlphaComponent(cellAlpha)
    }
}
