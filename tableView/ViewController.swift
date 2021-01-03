//
//  ViewController.swift
//  tableView
//
//  Created by 이상진 on 2021/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
        
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
        
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    
    
    
    
    
    
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
        return restaurantNames.count
    }
    // cell을 어떻게 구성할 것인가 결정(필수코드)(cellfor)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let basicCell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        
        basicCell.textLabel?.text = restaurantNames[indexPath.row]
        basicCell.detailTextLabel?.text = restaurantLocations[indexPath.row]
        basicCell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
        
        
        return basicCell
        
    }
    
    
    //delegate 부분
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alretContrller = UIAlertController(title: restaurantNames[indexPath.row], message: restaurantLocations[indexPath.row] + "에 위치해 있습니다.", preferredStyle: .actionSheet)
        
        let okBtn = UIAlertAction(title: "ok", style: .default, handler: nil)
        let closeBtn = UIAlertAction(title: "close", style: .cancel, handler: nil)
        
        alretContrller.addAction(okBtn)
        alretContrller.addAction(closeBtn)
        
        
        present(alretContrller, animated: true, completion: nil)
    }
    
    
}

