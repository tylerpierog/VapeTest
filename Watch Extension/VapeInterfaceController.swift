//
//  VapeInterfaceController.swift
//  VapeTest
//
//  Created by rbc mobile tech 5 on 2016-05-17.
//  Copyright © 2016 RBC. All rights reserved.
//

import WatchKit
import Foundation

class VapeInterfaceController: WKInterfaceController{
    var sIndex = 0
    var counter = 0
    var myCustomViewController: detailsViewController = detailsViewController()

    
    @IBOutlet var table: WKInterfaceTable!
    @IBOutlet var cartLabel: WKInterfaceGroup!
    @IBOutlet var cartContents: WKInterfaceLabel!
    
    var vape: Vape?{
        didSet{
           
        }
    }
    //store the index of the item selected
    //on display cart page call the vape array at the index when looping thru the array
    var vapes = Vape.allVapeProducts()
    
    override func awakeWithContext(context: AnyObject?) {
            super.awakeWithContext(context);
        table.setNumberOfRows(vapes.count, withRowType: "vapeRow")
        
        for index in 0..<table.numberOfRows{
            if let controller = table.rowControllerAtIndex(index) as? VapeRowController{
                controller.vape = vapes[index]
            }
        }
    }
    
    override func didAppear() {
        super.didAppear()

        if vapes[sIndex].test, let controller = table.rowControllerAtIndex(sIndex) as? VapeRowController {
            // 2
            animateWithDuration(0.35, animations: { () -> Void in
                // 3
                print("inside did appear")
                print(self.vape?.checkOut)
                
                controller.updateForCheckIn()
                if self.vape?.checkOut == true{
                    print("test")
                }else{
                self.counter = self.counter + controller.updateForCheckIn()
                self.cartLabel.setHidden(false)
                self.cartLabel.setHeight(35)
                self.cartContents.setText("Cart (\(self.counter))")
              // print( self.myCustomViewController.getArray().first!)
                }
            })
        }
      
       
    }
    func getCartArray()->Array<String>{
        return self.myCustomViewController.getArray()
    }
    
    @IBAction func cartClicked(){
        presentControllerWithName("cloud", context: vape)
    }
    
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        let vape = vapes[rowIndex];
        let controllers = vape.test ? ["Vape", "VapeDetails"] : ["Vape", "VapeDetails"]
        sIndex = rowIndex
       // let controllers = vape.isInStock ["vapeDetails", "purchase"]
        presentControllerWithNames(controllers, contexts:[vape, vape])
    }
  
   
}
