//
//  ViewController.swift
//  Purchase List
//
//  Created by Kaulitz Guimarães on 02/02/19.
//  Copyright © 2019 Kaulitz Guimarães. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
  
    static var items = Items()
   
   
  
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var listItemsTableView: UITableView!
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listItemsTableView.delegate = self
        listItemsTableView.dataSource = self
        
        self.uploadTotalLabel()
        // Do any additional setup after loading the view, typically from a nib.
      
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewController.items.getTotalItems()
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = ViewController.items.getItems()[indexPath.row]
        cell.textLabel?.textAlignment = .center
        return(cell)
    }
    func uploadTotalLabel()  {
        let total =  ViewController.items.getTotalValues()
        self.totalLabel.text = "TOTAL : \(total)"
    }
    
    @objc func loadList(){
        //load data here
        
        self.listItemsTableView.reloadData()
        self.uploadTotalLabel()
    }

}
