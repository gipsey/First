//
//  RatingControl.swift
//  First
//
//  Created by David Debre on 12/6/17.
//  Copyright © 2017 David Debre. All rights reserved.
//

import UIKit

@IBDesignable
class RatingControl: UIStackView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    // MARK: Properties
    private var ratinButtons = [UIButton]()
    var rating = 0
    @IBInspectable var startSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            extractedFunc()
        }
    }
    @IBInspectable var startCount: Int = 5 {
        didSet {
            extractedFunc()
        }
    }
    
    // MARK: initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        extractedFunc()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        extractedFunc()
    }
    
    fileprivate func extractedFunc() {
        for b in ratinButtons {
            removeArrangedSubview(b)
            b.removeFromSuperview()
        }
        
        ratinButtons.removeAll()
        
        for _ in 0..<startCount {
            let b1 = UIButton()
            
            b1.backgroundColor = UIColor.red
            b1.translatesAutoresizingMaskIntoConstraints = false
            b1.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            b1.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            b1.addTarget(self, action: #selector(RatingControl.onButtonPressed(button:)), for: .touchUpInside)
            addArrangedSubview(b1)
            
            ratinButtons.append(b1)
        }
    }
    
    // MARK: Button Action
    @objc
    func onButtonPressed(button: UIButton) {
        print("ddd button pressed")
    }
}
