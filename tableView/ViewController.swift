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
        return 2
    }
    
    // cell을 몇개 할것인가 결정(필수코드)(number)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }
        return restaurantNames.count
    }
    // cell을 어떻게 구성할 것인가 결정(필수코드)(cellfor)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.section == 0 {
            let secondCell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            secondCell.textLabel?.text = "test"
            
            return secondCell
            
        }
        
        
        let basicCell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath) as? BasicTableViewCell


//        basicCell.textLabel?.text = restaurantNames[indexPath.row]
//        basicCell.detailTextLabel?.text = restaurantLocations[indexPath.row]
//        basicCell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])

        basicCell?.nameLabel.text = restaurantNames[indexPath.row]
        basicCell?.locationLabel.text = restaurantLocations[indexPath.row]
        basicCell?.typeLabel.text = restaurantTypes[indexPath.row]
        basicCell?.imgView.image = UIImage(named: restaurantImages[indexPath.row])
        
        
        return basicCell!

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

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 10
        }
        else {
            return 30
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "testSection"
        }
        return "restaurantSecion"
    }
 
    
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
        if (section == 0) {
            headerView.backgroundColor = .red
            headerView.tintColor = .black
        }
        else {
            headerView.backgroundColor = .purple
        }
        return headerView
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 45
        }
        return 220
    }
}

