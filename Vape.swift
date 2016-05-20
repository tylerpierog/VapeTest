//
//  File.swift
//  VapeTest
//
//  Created by rbc mobile tech 5 on 2016-05-17.
//  Copyright © 2016 RBC. All rights reserved.
//

import WatchKit

class Vape {
    let price: String;
    let name: String;
    let image: String;
    let catagory: String;
    let rating: String;
    let stock: String;
    var inStock = false
    var test = false
    var checkOut = false
    var cart: [String] = []

    
    
    
    //Sending over all vape products
    class func allVapeProducts() -> [Vape]{
        var vapes = [Vape]()
        if let path = NSBundle.mainBundle().pathForResource("Vape", ofType: "json"), let data = NSData(contentsOfFile: path){
            do{
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments) as! [Dictionary<String, String>]
                for dict in json{
                    let vape = Vape(dictionary: dict)
                    vapes.append(vape)
                }
            }catch{
                print(error)
            }
        }
        return vapes
    }
    init(price: String, name: String, image: String, catagory: String, rating: String, stock: String){
        
        self.price = price;
        self.name = name;
        self.image = image;
        self.catagory = catagory;
        self.rating = rating;
        self.stock = stock;
        
    }
    convenience init(dictionary: [String: String]) {
        let price = dictionary["price"]!
        let name = dictionary["name"]!
        let image = dictionary["image"]!
        let catagory = dictionary["catagory"]!
        let rating = dictionary["rating"]!
        let stock = dictionary["stock"]!
        self.init(price: price, name: name, image: image, catagory: catagory, rating: rating, stock: stock)
    }
}