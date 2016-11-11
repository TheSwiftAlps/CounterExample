//
//  CounterReducerTests.swift
//  CounterExampleTests
//
//  Created by Bohdan Orlov on 11/11/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import XCTest
import ReSwift
@testable import CounterExample

class CounterReducerTests: XCTestCase {
    let reducer = CounterReducer()
    
    func testIncreaseWithInputNilReturnsOne() {
        XCTAssertEqual(handle(nil, CounterActionIncrease(index: 0)), 1)
    }
    
    func testDecreaseWithInputNilReturnsMinusOne() {
        XCTAssertEqual(handle(nil, CounterActionDecrease(index: 0)), -1)
    }
    
    func testIncreaseWithZeroReturnsOne() {
        XCTAssertEqual(handle(0, CounterActionIncrease(index: 0)), 1)
    }
    
    func testDecreaseWithZeroReturnsMinusOne() {
        XCTAssertEqual(handle(0, CounterActionDecrease(index: 0)), -1)
    }
    
    func testIncreaseWithPositiveValueReturnsIncrementedByOne() {
        XCTAssertEqual(handle(5, CounterActionIncrease(index: 0)), 6)
    }
    
    func testDecreaseWithPostiveValueReturnsDecrementedByOne() {
        XCTAssertEqual(handle(8, CounterActionDecrease(index: 0)), 7)
    }
    
    func testIncreaseWithNegativeValueReturnsIncrementedByOne() {
        XCTAssertEqual(handle(-9, CounterActionIncrease(index: 0)), -8)
    }
    
    func testDecreaseWithNegativeValueReturnsDecrementedByOne() {
        XCTAssertEqual(handle(-4, CounterActionDecrease(index: 0)), -5)
    }

    func testAddCounterIncrementsCountersByOne() {
        let appState = reducer.handleAction(action: CounterActionAdd(), state: nil)
        XCTAssertEqual(appState.counters.count, 1)
    }

    func handle(_ inputValue: Int?, _ action: Action) -> Int {
        let appState = AppState(counters: [Counter(inputValue ?? 0)])
        return reducer.handleAction(action: action, state: appState).counters[0]
    }

}
