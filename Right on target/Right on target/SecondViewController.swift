//
//  SecondViewController.swift
//  Right on target
//
//  Created by IOS - Developer  on 17.06.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: -  override func loadView()
    override func loadView() {
        super.loadView()
        print("loadView SecondViewController")
    }
    
    // MARK: -  override func viewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad SecondViewController")
    }
    
    // MARK: - override func viewWillAppear(_ animated: Bool)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear SecondViewController")
    }
    
    // MARK: -  override func viewDidAppear(_ animated: Bool)
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear SecondViewController")
    }
    
    // MARK: -   override func viewWillDisappear(_ animated: Bool)
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear SecondViewController")
    }
    
    // MARK: -
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear SecondViewController")
    }
    // MARK: - BugFix
    func myButton() {
        let button = UIButton(frame: CGRect(x: 300, y: 300, width: 50, height: 10))
        view.addSubview(button)
        button.setTitle("Back", for: .normal)
        button.center = view.center
    }
}
