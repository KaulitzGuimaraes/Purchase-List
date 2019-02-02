//
//  Item.swift
//  Purchase List
//
//  Created by Kaulitz Guimarães on 02/02/19.
//  Copyright © 2019 Kaulitz Guimarães. All rights reserved.
//

import UIKit

class  Item {
    private var name:String
    private var price:Double
    
  public  init(_ name: String, _ price: Double) {
        self.name = name
        self.price = price
    }
    
   public func getName()-> String  {
        return  self.name
    }
    public func setName(_ name: String)  {
          self.name = name
    }
    public func getPrice()-> String  {
        return String(self.price)
    }
    public func setPrice(_ price: Double)  {
        self.price = price
    }
}

class Items {
    private var items:Array<Item>
    init(){
        self.items = Array<Item>()
    }
    
    func addItem(_ name:String, _ price: Double )  {
         let item = Item(name, price)
         self.items.append(item)
    }
    
    func removeItem(_ name:String, _ price: Double )  {
        //let item = Item(name, price)
        var numberItem  = 0
        for item in self.items {
            if item.getName().elementsEqual(name){
                self.items.remove(at: numberItem)
                break
            }else{
                numberItem+=1
            }
        }
    }
}
