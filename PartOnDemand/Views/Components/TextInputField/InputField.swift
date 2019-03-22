//
//  TextInputFieldController.swift
//  PartOnDemand
//
//  Created by Ty on 2/22/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import Foundation

import UIKit

class InputField: UIView {
    let kCONTENT_XIB_NAME = "InputField"
    @IBOutlet var contentView: UIView!
    @IBOutlet var lblFirstName: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
      Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
//        self.contentView.frame = bounds;
        self.addSubview(contentView);
    }
}
extension UIView
{
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
