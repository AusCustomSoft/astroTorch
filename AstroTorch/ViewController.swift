//
//  ViewController.swift
//  AstroTorch
//
//  Created by Tony on 30/1/18.
//  Copyright © 2018 ThinkSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   let torchOn: String = "AstroTorch On"
   let torchOff: String = "AstroTorch Off"

   var currentBackgroundColor: UIColor = UIColor.clear
   var screenIsRed: Bool = false

   @IBOutlet weak var onOffSwitch: UIButton!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view, typically from a nib.
      self.view.backgroundColor = UIColor.clear
      currentBackgroundColor = self.view.backgroundColor ?? UIColor.clear
      screenIsRed = ( currentBackgroundColor == UIColor.red )

      // relative referencing similar to the VB6 With...EndWith approach - great when changing name of object
      [self.onOffSwitch].forEach{
         $0?.backgroundColor = UIColor.white
         $0?.setTitleColor(UIColor.blue, for: UIControlState.normal)
         $0?.setTitle("Astro Torch On", for: UIControlState.normal)
         $0?.layer.cornerRadius = 8
         $0?.layer.masksToBounds = true
      }
      /*  or it could be done like this...
      // single line - absolute referencing.
      self.onOffSwitch.backgroundColor = UIColor.white
      self.onOffSwitch.setTitleColor(UIColor.blue, for: UIControlState.normal)
      self.onOffSwitch.setTitle("Astro Torch On", for: UIControlState.normal)
      self.onOffSwitch.layer.cornerRadius = 8
      self.onOffSwitch.layer.masksToBounds = true
      */
   }

   @IBAction func buttonClick(_ sender: Any) {

      var title: String
      var titleColor: UIColor
      var buttonColor: UIColor

      //version 1
      /*
      if currentBackgroundColor == UIColor.red {
         currentBackgroundColor = UIColor.clear
         buttonColor = UIColor.white
         titleColor = UIColor.blue
         title = torchOn
      } else {
         currentBackgroundColor = UIColor.red
         buttonColor = UIColor.clear
         titleColor = UIColor.white
         title = torchOff
      }
       */

      /*
      // IF Statement approach - great for boolean but not trillian
      if screenIsRed {
         currentBackgroundColor = UIColor.blue
         buttonColor = UIColor.white
         titleColor = UIColor.blue
         title = torchOn
         //screenIsRed = false     // this is an assertion - it may not actually be correct
      } else {
         currentBackgroundColor = UIColor.red
         buttonColor = UIColor.clear
         titleColor = UIColor.white
         title = torchOff
         //screenIsRed = true         // this is an assertion - it may not be correct
      }
      //screenIsRed = !screenIsRed    // this toggle assumes that the previous code always runs
      */

      /* SWITCH STATEMENT for future flexibility  */
      switch screenIsRed {
      case true:
         currentBackgroundColor = UIColor.blue
         buttonColor = UIColor.white
         titleColor = UIColor.blue
         title = torchOn
      case false:
         currentBackgroundColor = UIColor.red
         buttonColor = UIColor.clear
         titleColor = UIColor.white
         title = torchOff

      default:
         // always - JUST IN CASE
         currentBackgroundColor = UIColor.clear
         buttonColor = UIColor.white
         titleColor = UIColor.blue
         title = torchOn

      }

/*
      self.onOffSwitch.backgroundColor = buttonColor
      self.onOffSwitch.setTitleColor(titleColor, for: UIControlState.normal)
      self.onOffSwitch.setTitle(title, for: UIControlState.normal)
*/

      // code below replaces code above - 2 extra lines of code BUT allows for multiple buttons in an array later on.
      // also much easier to change the name if the 
      [self.onOffSwitch].forEach{
         $0?.backgroundColor = buttonColor
         $0?.setTitleColor(titleColor, for: UIControlState.normal)
         $0?.setTitle(title, for: UIControlState.normal)
      }

      self.view.backgroundColor = currentBackgroundColor;

      // this section of code is actually checking what the background color is.
      // this is the equivalent of an if statement but much more succinct
      screenIsRed = ( currentBackgroundColor == UIColor.red )


   }


}

