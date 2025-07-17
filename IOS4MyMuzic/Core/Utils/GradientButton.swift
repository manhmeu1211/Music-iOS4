//
//  RandomGradientView.swift
//  IOS4MyMuzic
//
//  Created by Tran Viet Anh on 12/7/25.
//
import UIKit

class GradientButton: UIButton {

    private var gradientLayer: CAGradientLayer?

    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradient()
    }

    private func setupGradient() {
        gradientLayer?.removeFromSuperlayer()

        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = [
            UIColor.random().cgColor,
            UIColor.random().cgColor
        ]
        layer.startPoint = CGPoint(x: 0.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        layer.cornerRadius = 8 

        self.layer.insertSublayer(layer, at: 0)
        self.gradientLayer = layer
    }

    func refreshGradient() {
        setupGradient()
    }
}

