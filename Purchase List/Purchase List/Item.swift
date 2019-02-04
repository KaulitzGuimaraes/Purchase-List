//
//  Item.swift
//  Purchase List
//
//  Created by Kaulitz Guimarães on 02/02/19.
//  Copyright © 2019 Kaulitz Guimarães. All rights reserved.
//

import UIKit

class  Item: CustomStringConvertible {
    private var name:String
    private var price:Double
    private var amount:Int
    public  init(_ name: String, _ price: Double, _ amount: Int) {
        self.name = name
        self.price = price
        self.amount = amount
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
    public func getAmount()-> String  {
        return String(self.amount)
    }
    public func setAmount(_ amount: Int)  {
        self.amount = amount
    }
    public func getTotal () -> String{
        return String(format: "%.2f",(self.price * Double(self.amount)))
    }
    public var description: String{
        return "\(self.getName()) - \(self.getPrice()) - \(self.getAmount()) - \(self.getTotal())"
    }
    
}

class Items {
    private var items:Array<Item>
    init(){
        self.items = Array<Item>()
    }
    
   public func addItem(_ name:String, _ price: Double,_ amount: Int )  {
         let item = Item(name, price,amount)
         self.items.append(item)
    }
    
   public func removeItem(_ name:String )  {
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
    public func updateItem(_ name:String, _ price : Double,_ amount: Int )  {
        //let item = Item(name, price)
        var numberItem  = 0
        for item in self.items {
            if item.getName().elementsEqual(name){
                self.items[numberItem].setPrice(price)
                self.items[numberItem].setAmount(amount)
                break
            }else{
                numberItem+=1
            }
        }
    }
    
   public func getItems() ->  Array<String> {
    var newItems:Array<String> = []
    for item in self.items {
        newItems.append(item.description)
    }
        return newItems
    }
    public func getTotalValues() ->  String {
        var total:Double = 0
        
            for item in self.items {
                total += Double(item.getTotal()) ?? 0
            }
        
        
        return String(format: "%.2f",total)
    }
   public func getTotalItems() -> Int {
       return self.items.count
    }
}
