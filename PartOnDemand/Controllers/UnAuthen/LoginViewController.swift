//
//  LoginViewController.swift
//  PartOnDemand
//
//  Created by Ty on 2/22/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import Foundation
import UIKit
import ActiveLabel

struct LOGIN_CONSTANT {
    static var LOGIN_BTN_TAG = 10
}

class LoginViewController: KeyboardViewController, ButtonDelegate {


    @IBOutlet weak var usernameIp: TextInput!
    @IBOutlet weak var passwordIp: TextInput!
    @IBOutlet weak var loginBtn: Button!
    @IBOutlet weak var registerText: ActiveLabel!
    override func viewDidLoad() {
        initView();
       
        super.viewDidLoad();
//        self.navigateToNextView(idendtifer: CommonConstants.NAV_ROUTER.DASHBOARD)
    }
    
    func initView() -> Void {
        usernameIp.label.text = "Username";
        passwordIp.label.text="Password";
        let ipSize =  usernameIp.frame.size;
        let btnSize = loginBtn.frame.size;
        usernameIp.containerView.frame.size = ipSize;
        passwordIp.containerView.frame.size = ipSize;
        loginBtn.container.frame.size = btnSize;
        passwordIp.textIp.isSecureTextEntry = true
        let customType = ActiveType.custom(pattern: "\\sRegister Now!")
        registerText.enabledTypes = [customType];
        registerText.customColor = [customType: .blue]
        registerText.text = "Don't have a account? - Register Now!"
        registerText.customSelectedColor[customType] = UIColor.purple;
        registerText.handleCustomTap(for: customType) { element in
            self.navigateToNextView(idendtifer: CommonConstants.NAV_ROUTER.REGISTER)
        }
        loginBtn.btnTag = LOGIN_CONSTANT.LOGIN_BTN_TAG;
        loginBtn.delegate = self;
    
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.toggleNavBar();
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.toggleNavBar();
    }
    
    func onTapAction(_ btnTag: Int) {
        self.navigateToNextView(idendtifer: CommonConstants.NAV_ROUTER.DASHBOARD)
    }
    
    func navigateToNextView(idendtifer: String){
        let nextViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: idendtifer) as? UIViewController
        self.navigationController?.pushViewController(nextViewController!, animated: true)
    }
    
}
