//
//  ViewController.swift
//  tableView
//
//  Created by 이상진 on 2021/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    // section 을 몇개 할것인가 결정(number)
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // cell을 몇개 할것인가 결정(필수코드)(number)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    // cell을 어떻게 구성할 것인가 결정(필수코드)(cellfor)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let basicCell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        basicCell.textLabel?.text = "aBc"
        basicCell.detailTextLabel?.text = "AbC"
        
        
        
        return basicCell
        
        
    }
    
}

