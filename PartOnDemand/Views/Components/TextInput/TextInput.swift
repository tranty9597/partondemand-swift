//
//  TextInput.swift
//  PartOnDemand
//
//  Created by Ty on 3/10/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import UIKit

class TextInput: UIView {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var containInputView: UIView!
    @IBOutlet weak var textIp: UITextField!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        Bundle.main.loadNibNamed("TextInput", owner: self, options: nil)
        
        self.addSubview(containerView);
        containInputView.layer.cornerRadius = 7;
    }

}
