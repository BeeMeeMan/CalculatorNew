//
//  Constant.swift
//  CalculatorHW4
//
//  Created by Fantom on 06.02.2022.
//

import UIKit

enum Constant {
    static let buttonWidthInPortrait: CGFloat = UIScreen.fixedSmallSize / 5
    static let buttonWidthInLandscape: CGFloat = UIScreen.fixedBigSize / 7
    static let doubleButtonWidthInPortrait: CGFloat = buttonWidthInPortrait * 2
    static let doubleButtonWidthInLandscape: CGFloat = buttonWidthInLandscape * 2
    static let buttonHeightInLandscape: CGFloat = UIScreen.fixedSmallSize / 8
    static let stackSpacingInPortrait: CGFloat = UIScreen.fixedSmallSize / 40
    static let stackSpacingInLandscape: CGFloat = UIScreen.fixedSmallSize / 60
    static let labelsStackBottomAnchorInLandscape: CGFloat = buttonHeightInLandscape * 4.6
    static let labelsStackBottomAnchorInPortrait: CGFloat = buttonWidthInPortrait * 5.8
    static let trailingSpace: CGFloat = -50
    static let secondScreenButtonWidth: CGFloat = 200
    static let secondScreenButtonHeidth : CGFloat = 80
    static let secondScreenImageWidth: CGFloat = 120
    static let secondScreenImageButtomAnchor: CGFloat = 20
    static let answerScreenLabelHeightAnchor: CGFloat = 500
    static let pageControlWidth: CGFloat = 50
    static let pageControlButtonAnchor: CGFloat = 100
    static let secondRadius: CGFloat = UIScreen.fixedSmallSize * 0.3
    static let clockRadius: CGFloat = UIScreen.fixedSmallSize * 0.35
    static let smallCircleRadius: CGFloat = UIScreen.fixedSmallSize * 0.025
    static let smallCircleDiametr: CGFloat = smallCircleRadius * 2
    static let clockOffset: CGFloat = (UIScreen.fixedSmallSize - clockRadius * 2) / 2
    static let circleOffset: CGFloat = clockRadius - secondRadius
    static let clockNumberWidht: CGFloat = 50
    static let flipClockWidth: CGFloat =  UIScreen.fixedSmallSize * 0.7
    static let flipClockHeight: CGFloat =  UIScreen.fixedSmallSize * 0.3
    static let flipClockCornerRadius: CGFloat =  15
    static let flipClockButtomAnchor: CGFloat =  UIScreen.fixedSmallSize * 0.35
    static let flipClockNumberWidth: CGFloat =  flipClockWidth / 4.2
    static let flipClockNumberOffset: CGFloat =  flipClockNumberWidth * 0.1
    static let secondArrowWidth: CGFloat =  2
    static let secondArrowHeight: CGFloat =  Constant.secondRadius * 0.9
    static let minuteArrowWidth: CGFloat =  4
    static let minuteArrowHeight: CGFloat =  Constant.secondRadius * 0.8
    static let hourArrowWidth: CGFloat =  8
    static let hourArrowHeight: CGFloat =  Constant.secondRadius * 0.55
   
}

enum ScreenOrientation {
    case portrait
    case landscape
}
