//
//  Extensions.swift
//  CalculatorHW4
//
//  Created by Fantom on 06.02.2022.
//

import UIKit

extension UIColor {
    static let offWhite = UIColor.init(red: 225/255, green: 225/255, blue: 235/255, alpha: 1)
    static let grabientBackgrounTopColor = UIColor.init(red: 229/255, green: 238/255, blue: 239/255, alpha: 1)
    static let grabientBackgrounButtomColor = UIColor.init(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
    static let customPurple = UIColor.init(red: 196/255, green: 179/255, blue: 208/255, alpha: 1)
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
    static var fixedSmallSize: CGFloat {
        if UIScreen.main.bounds.size.width > UIScreen.main.bounds.size.height{
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }
    static var fixedBigSize: CGFloat {
        if UIScreen.main.bounds.size.width < UIScreen.main.bounds.size.height{
            return UIScreen.main.bounds.size.height
        } else {
            return UIScreen.main.bounds.size.width
        }
    }
}

extension UIStackView {
    func setStackView(viewArray: [UIView], axisHorizontal: Bool ) {
        for view in viewArray{
            self.addArrangedSubview(view)
        }
        self.axis = axisHorizontal ? .horizontal : .vertical
        self.alignment = .center
    }
}

extension Array where Element: CustomButton {
    func setShadowsAndColor(color: UIColor) {
        forEach { element in
            element.setShadowsAndColor(color: color)
        }
    }
    func setButtonLabelSizeToArray(labelSize: CGFloat) {
        forEach { element in
            element.titleLabel?.font = UIFont.systemFont(ofSize: labelSize)
        }
    }
    func setCustomButtonsInArray(firstSelector: Selector, secondSelector: Selector) {
        forEach { element in
            let allButtonTextSize: CGFloat = 30
            element.setTitleColor(.gray, for: .normal)
            element.addTarget(firstSelector, action: firstSelector, for: .touchDown)
            element.addTarget(secondSelector, action: secondSelector, for: [.touchUpInside, .touchUpOutside])
            element.titleLabel?.font = UIFont.systemFont(ofSize:  allButtonTextSize)
        }
    }
}

extension UILabel {
    func setLabel(numberOfLines: Int, text: String) {
        self.textAlignment = .right
        self.textColor = .gray
        self.minimumScaleFactor = 0.7
        self.adjustsFontSizeToFitWidth = true
        self.sizeToFit()
        self.numberOfLines = numberOfLines
        self.text = text
    }
}

extension Array where Element: UIStackView {
    func setSpacingToArray(spacing: CGFloat) {
        forEach { element in
            element.spacing = spacing
        }
    }
}

extension UIView {
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor),
            bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}
