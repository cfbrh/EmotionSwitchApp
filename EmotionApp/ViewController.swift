//
//  ViewController.swift
//  EmotionApp
//
//  Created by 张 on 2024/8/2.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var pokerFaceImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named:"1"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private lazy var smileImageView: UIImageView = {
        let imageView = UIImageView(image:UIImage(named:"2"))
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        return imageView
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.backgroundColor = UIColor.lightGray
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // image
        self.pokerFaceImageView.frame = self.view.bounds
        self.smileImageView.frame = self.view.bounds
        
        self.view.addSubview(self.pokerFaceImageView)
        self.view.addSubview(self.smileImageView)
        
        // button
        let buttonHeight: CGFloat = 110
        self.button.frame = CGRect(x:0, y:self.view.frame.height-buttonHeight, width: self.view.frame.width, height: buttonHeight)
        
        self.button.setTitle("😐", for: UIControl.State.normal)
        self.button.setTitle("😀", for: UIControl.State.selected)
        
        self.button.addTarget(self, action: #selector(didClickButton(button: )), for: UIControl.Event.touchUpInside)
        
        self.view.addSubview(self.button)
        update(isSmiling: false)
        
    }
    private func update(isSmiling: Bool){
        if isSmiling {
            self.pokerFaceImageView.isHidden = true
            self.smileImageView.isHidden = false
            self.button.isSelected = true
        } else {
            self.pokerFaceImageView.isHidden = false
            self.smileImageView.isHidden = true
            self.button.isSelected = false
        }
    }
    
    
    @objc private func didClickButton(button: UIButton){
        update(isSmiling: !button.isSelected)
    }


}

