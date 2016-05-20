//
//  VapeRowController.swift
//  VapeTest
//
//  Created by rbc mobile tech 5 on 2016-05-17.
//  Copyright © 2016 RBC. All rights reserved.
//

import Foundation
import WatchKit

class VapeRowController: NSObject {
    
    @IBOutlet var separator: NSObject!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var img: WKInterfaceImage!
    var vape: Vape?{
        didSet{
            if let vape = vape{
                nameLabel.setText(vape.name);
               
                //Change to UIImage when passed over correctly
               // img.setImage(vape.image);
            }
        }
    }
    func updateForCheckIn() -> Int{
      //  let color = UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)
        //nameLabel.setTextColor(color)
        if self.vape?.test == true{
            self.vape?.test = false;
        }
        return 1

     
    }
   
}

   
