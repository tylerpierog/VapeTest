//
//  detailsViewController.swift
//  VapeTest
//
//  Created by rbc mobile tech 5 on 2016-05-18.
//  Copyright © 2016 RBC. All rights reserved.
//
import WatchKit
import Foundation
import UIKit
var vapeinterfaceref: VapeInterfaceController = VapeInterfaceController()

var cartArray = [String]()
class detailsViewController: WKInterfaceController{
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var priceLabel: WKInterfaceLabel!
    @IBOutlet var ratingLabel: WKInterfaceLabel!
    @IBOutlet var stockLabel: WKInterfaceLabel!
    @IBOutlet var pic: WKInterfaceImage!
    @IBOutlet var backgroundGroup: WKInterfaceGroup!
    @IBOutlet var cart: WKInterfaceLabel!
    var vape: Vape?{
        
        didSet{
            if let vape = vape{
                if vape.stock == "0"{
                nameLabel.setText(vape.name)
                priceLabel.setText(vape.price)
                stockLabel.setText("Sold Out")
                //ratingLabel.setText(vape.rating)
                
                }else{
                    nameLabel.setText(vape.name)
                    priceLabel.setText(vape.price)
                    stockLabel.setText("\(vape.stock) In Stock")
                //    ratingLabel.setText(vape.rating)

                }
            }
        }
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        if let vape = context as? Vape { self.vape = vape }
    }
    
    @IBAction func checkInButtonTapped() {
            let duration = 0.75
       cartArray.append((self.vape?.name)!)
        
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64((duration + 0.15) * Double(NSEC_PER_SEC)))
            backgroundGroup.setBackgroundImageNamed("smoke")
            backgroundGroup.setHeight(100)
            backgroundGroup.startAnimatingWithImagesInRange(NSRange(location: 0, length: 10), duration: duration, repeatCount: 1)
            dispatch_after(delay, dispatch_get_main_queue()) { () -> Void in
               // let controller = Vape
                self.vape?.test = true
                self.vape?.checkOut = false
                //self.vape?.cart.append("Test")
                    self.dismissController()
        }
    }
    func getArray()->Array<String>{
        return cartArray
    }
}