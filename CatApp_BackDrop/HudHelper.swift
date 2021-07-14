//
//  HudHelper.swift
//  CatApp_BackDrop
//
//  Created by Decagon on 7/14/21.
//

import Foundation
import SVProgressHUD

final class HUD {
    class func show(status: String) {
        DispatchQueue.main.async {
            SVProgressHUD.setDefaultStyle(.custom)
            SVProgressHUD.setDefaultMaskType(.custom)
            SVProgressHUD.setForegroundColor(.black ?? .systemTeal)
            SVProgressHUD.setBackgroundColor(.black)
            SVProgressHUD.setBackgroundLayerColor(.clear)
            SVProgressHUD.show(withStatus: status)
        }
    }
    
    class func hide() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss(withDelay: 50)
        }
    }
}
