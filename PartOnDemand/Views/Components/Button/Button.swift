//
//  Button.swift
//  PartOnDemand
//
//  Created by Ty on 3/16/19.
//  Copyright © 2019 Ty. All rights reserved.
//

import UIKit

protocol ButtonDelegate {
    func onTapAction(_ btnTag: Int)
}

class Button: UIButton {

    var delegate: ButtonDelegate?
    var btnTag: Int?;
    @IBOutlet var container: UIView!

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        Bundle.main.loadNibNamed("Button", owner: self, options: nil);
        self.addSubview(container);
        container.layer.cornerRadius = 7;
        
        let getsture = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        
        self.addGestureRecognizer(getsture);
    }
    @objc func onTap(_ sender: UITapGestureRecognizer){
           delegate!.onTapAction(self.btnTag!)
    }
    

}
