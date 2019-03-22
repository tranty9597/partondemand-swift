//
//  RightSideMenuBaseVC.swift
//  PartOnDemand
//
//  Created by Ty on 3/17/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import UIKit
import SideMenu

class RightSideMenuBaseVC: CustomNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
//
        // UISideMenuNavigationController is a subclass of UINavigationController, so do any additional configuration
        // of it here like setting its viewControllers. If you're using storyboards, you'll want to do something like:
        let root = storyboard!.instantiateViewController(withIdentifier: CommonConstants.NAV_ROUTER.RIGHT_SIDE_MENU) as! UISideMenuNavigationController;
        SideMenuManager.default.menuRightNavigationController = root
        
        // (Optional) Enable gestures. The left and/or right menus must be set up above for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        
        // (Optional) Prevent status bar area from turning black when menu appears:
        SideMenuManager.default.menuFadeStatusBar = false
        present(SideMenuManager.default.menuRightNavigationController!, animated: true) {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
