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
    let recorder = Recorder()
    typealias StoreSubscriberStateType = AppState
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func didTwoFingersTap(_ sender: Any) {
        recorder.replay()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainStore.subscribe(self)
    }
    
    func newState(state: AppState) {
        tableView.reloadData()
    }
    
    @IBAction func addCounter(_ sender: Any) {
        mainStore.state.counters.append(Counter())
        tableView.reloadData()
    }
}

extension ViewController : UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainStore.state.counters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CounterCell", for: indexPath) as! CounterCell
        cell.label.text = "\(mainStore.state.counters[indexPath.row])"
        cell.action = { actionType in
            let action: ReversableAction
            switch actionType {
            case .increase:
                action = CounterActionIncrease(index: indexPath.row)
            case .decrease:
                action = CounterActionDecrease(index: indexPath.row)
            }
            mainStore.dispatch(action)
            self.recorder.record(action.reversed())
        }
        
        return cell
    }
}
