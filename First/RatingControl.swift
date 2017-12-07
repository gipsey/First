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
    var rating = 0 {
        didSet {
            updateButtonsOnTap()
        }
    }
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
        
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledstar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptystar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedstar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<startCount {
            let b1 = UIButton()
            
            b1.setImage(emptyStar, for: .normal)
            b1.setImage(filledStar, for: .selected)
            b1.setImage(highlightedStar, for: .highlighted)
            b1.setImage(highlightedStar, for: [.selected, .highlighted])
            
            b1.translatesAutoresizingMaskIntoConstraints = false
            b1.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            b1.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            b1.addTarget(self, action: #selector(RatingControl.onButtonPressed(button:)), for: .touchUpInside)
            
            b1.accessibilityLabel = "label"
            b1.accessibilityHint = "hiont"
            b1.accessibilityValue = "value"
            
            addArrangedSubview(b1)
            
            ratinButtons.append(b1)
        }
    }
    
    private func updateButtonsOnTap() {
        for (index, button) in ratinButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    // MARK: Button Action
    @objc
    func onButtonPressed(button: UIButton) {
        print("ddd button pressed")
        
        let selectedIndex = ratinButtons.index(of: button)!
        let selectedRating = selectedIndex + 1
        
        if (selectedRating == rating) {
            rating = 0
        } else {
            rating = selectedRating
        }
    }
}
