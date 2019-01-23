//
//  Extensions.swift
//  APOCYogaKit
//
//  Created by Alejandro  Rodriguez on 1/23/19.
//  Copyright © 2019 Alejandro  Rodriguez. All rights reserved.
//

import Foundation
import UIKit

class Util {
    static let shared = Util()
    
    func isIphoneX() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
              return true
            case 2688:
                 return true
            case 1792:
                 return true
            default:
                  return false
            }
        }
        return false
    }
    
    
    func isIphone5s() -> Bool {
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 1136:
               return true
            default:
               return false
            }
        }
        return false
    }
}
