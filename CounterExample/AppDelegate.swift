//
//  AppDelegate.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift

// The global application store, which is responsible for managing the appliction state.
let mainStore = Store<AppState>(
    reducer: CounterReducer(),
    state: nil,
    middleware: [loggingMiddleware]
)

// http://reswift.github.io/ReSwift/master/getting-started-guide.html#middleware
// Middleware allows you to intercept an action (potentially modifying it, before sending it on)
// You can add multiple middleware functions
let loggingMiddleware: Middleware = { dispatch, getState in
    return { next in
        return { action in
            
            // All we do in this middleware is log all the actions
            print(action)
            
            // You need to send the action / dispatch on
            // In theory this could be void, but then the state won't be instantiated (this is also an action)
            return next(action)
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

}

