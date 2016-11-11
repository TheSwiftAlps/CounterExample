//
//  ViewController.swift
//  CounterExample
//
//  Created by Colin Eberhardt on 04/08/2016.
//  Copyright © 2016 Colin Eberhardt. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
    
    typealias StoreSubscriberStateType = AppState
    var diffCalculator: TableViewDiffCalculator<Counter>?
    var filteredCounters: [Counter] = [] {
        didSet {
            self.diffCalculator?.rows = filteredCounters
        }
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStore.subscribe(self)

        self.diffCalculator = TableViewDiffCalculator(tableView: self.tableView, initialRows: self.filteredCounters)
    }

    func newState(state: AppState) {
        self.filteredCounters = state.counters
    }

    @IBAction func addCounter(_ sender: Any) {
        mainStore.dispatch(CounterActionAdd())
    }

}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainStore.state.counters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounterCell", for: indexPath) as! CounterCell
        cell.label.text = "\(mainStore.state.counters[indexPath.row].value)"
        cell.action = { actionType in
            
            switch actionType {
            case .increase:
                mainStore.dispatch(CounterActionIncrease(index: indexPath.row))
            case .decrease:
                mainStore.dispatch(CounterActionDecrease(index: indexPath.row))
            }
        }
        
        return cell
    }
}
