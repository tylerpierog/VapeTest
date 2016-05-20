//
//  CloudViewController.swift
//  VapeTest
//
//  Created by rbc mobile tech 5 on 2016-05-18.
//  Copyright © 2016 RBC. All rights reserved.
//
import WatchKit
import Foundation
import WatchConnectivity
extension CloudViewController: WCSessionDelegate{
    private func showCart(){
        
    }
}
class CloudViewController: WKInterfaceController{
    var viewRef: VapeInterfaceController = VapeInterfaceController()
    @IBOutlet var tableCart: WKInterfaceTable!
    @IBOutlet var itemLabel: WKInterfaceLabel!
    var tempArray = [String]()
    var vape: Vape?{
        didSet{
            
        }
    }
    override func willActivate() {
        
        super.willActivate()
       // itemLabel.setText(viewRef.getCartArray().first!)
    }
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context);
        tableCart.setNumberOfRows(viewRef.getCartArray().count, withRowType: "cartRow")
        for index in 0..<tableCart.numberOfRows{
            let row = tableCart.rowControllerAtIndex(index) as! CloudRowController // Get a single row object for the current item
            row.cartItemLabel.setText(viewRef.getCartArray()[index]) // S
        }
    }
    func getArray()->Array<String>{
        return viewRef.getCartArray()
    }
    @IBAction func checkOut(){
        //viewRef.cartContents.setText("Cart")
        self.vape?.checkOut = true
        print(vape?.checkOut)
            self.dismissController()
        }


        
    

   }

