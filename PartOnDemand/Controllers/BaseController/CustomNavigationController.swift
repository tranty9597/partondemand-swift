//
//  CustomNavigationController.swift
//  PartOnDemand
//
//  Created by Ty on 3/9/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import Foundation
import UIKit

class CustomNavigationController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //You need to process the image beforehand, to make a centered and stretched image.
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "bg")?.draw(in: self.view.bounds)
        let bg: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        view.backgroundColor = UIColor(patternImage: bg);
        //
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        navigationItem.titleView = imageView
    }
    
    private func imageView(imageName: String) -> UIImageView {
        let logo = UIImage(named: imageName)
        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        logoImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        return logoImageView
    }
    
    func barImageView(imageName: String) -> UIBarButtonItem {
        return UIBarButtonItem(customView: imageView(imageName: imageName))
    }
    
    func barButton(imageName: String, selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        button.widthAnchor.constraint(equalToConstant: 35).isActive = true
        button.heightAnchor.constraint(equalToConstant: 35).isActive = true
        button.addTarget(self, action: selector, for: .touchUpInside)
        return UIBarButtonItem(customView: button)
    }
    func toggleNavBar(){
        let navigationBarState = (navigationController?.isNavigationBarHidden)!
        self.navigationController?.setNavigationBarHidden(!navigationBarState, animated: true)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}
