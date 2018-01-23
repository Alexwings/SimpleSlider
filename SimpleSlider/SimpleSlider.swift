//
//  SimpleSlider.swift
//  SimpleSlider
//
//  Created by Xinyuan Wang on 1/22/18.
//  Copyright © 2018 XinyuanWings. All rights reserved.
//

import UIKit

enum LayoutContraintType: String {
    case top, bottom, leading, trailing, left, right, centerX, centerY, height, width, unknown
    init(rawValue: String) {
        switch rawValue {
        case "top":
            self = .top
            break
        case "bottom":
            self = .bottom
            break
        case "leading":
            self = .leading
            break
        case "trailing":
            self = .trailing
            break
        case "left":
            self = .left
            break
        case "right":
            self = .right
            break
        case "centerX":
            self = .centerX
            break
        case "centerY":
            self = .centerY
            break
        case "height":
            self = .height
            break
        case "width":
            self = .width
            break
        default:
            self = .unknown
        }
    }
}

class SimpleSlider: UIView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews(with: self.frame)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews(with: frame)
    }
    
    var progress: Double = 0 {
        didSet {
            guard progress <= 1.0 else {
                progress = 1.0
                return
            }
            guard progress >= 0 else {
                progress = 0
                return
            }
        }
    }
    var thumbView: UIImageView = UIImageView(frame: .zero)
    var trackView: UIView = UIView(frame: .zero)
    var progressColor: UIColor? = UIColor.green
    var remainColor: UIColor? = UIColor.gray
    
    private func setupViews(with frame: CGRect) {
        addSubview(trackView)
        let top = trackView.topAnchor.constraint(equalTo: topAnchor, constant: 0)//constant should be configurable
        top.type = .top
        top.isActive = true
        let leading = trackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0) //constant should be configurable
        leading.type = .leading
        leading.isActive = true
        let trailing = trackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)//constant should be configurable
        trailing.type = .trailing
        trailing.isActive = true
        let bottom = trackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)//constant should be configurable
        bottom.type = .bottom
        bottom.isActive = true
        
        addSubview(thumbView)
        let tHeight = thumbView.heightAnchor.constraint(equalToConstant: bounds.size.height)
        tHeight.type = .height
        tHeight.isActive = true
        let tWidth = thumbView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        tWidth.type = .width
        tWidth.isActive = true
    }
}

extension NSLayoutConstraint {
    var type: LayoutContraintType {
        get {
            guard let id = identifier else {
                return .unknown
            }
            return LayoutContraintType(rawValue: id)
        }
        set {
            identifier = newValue.rawValue
        }
    }
}
