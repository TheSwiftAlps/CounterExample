//
//  Recorder.swift
//  CounterExample
//
//  Created by Bohdan Orlov on 11/11/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import Foundation
import ReSwift

class Recorder {
    var replayDelay: TimeInterval = 0.5
    var actions = [ReversableAction]()
    func record(_ action: ReversableAction) {
        actions.append(action)
    }

    func replay() {
        var tmpActions = [ReversableAction]()
        for (idx, action) in actions.reversed().enumerated() {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + TimeInterval(Float(replayDelay) * Float(idx)), execute: {
                mainStore.dispatch(action)

            })
            tmpActions.append(action.reversed())
        }
        actions = tmpActions
    }
}
