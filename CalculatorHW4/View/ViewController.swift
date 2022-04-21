//
//  ViewController.swift
//  CalculatorHW4
//
//  Created by Fantom on 06.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var buttonDot: CustomButton = CustomButton(buttonTitle: ".")
    private lazy var button0: CustomButton = CustomButton(buttonTitle: "0")
    private lazy var buttonEqual: CustomButton = CustomButton(buttonTitle: "=")
    private lazy var button1: CustomButton = CustomButton(buttonTitle: "1")
    private lazy var button2: CustomButton = CustomButton(buttonTitle: "2")
    private lazy var button3: CustomButton = CustomButton(buttonTitle: "3")
    private lazy var button4: CustomButton = CustomButton(buttonTitle: "4")
    private lazy var button5: CustomButton = CustomButton(buttonTitle: "5")
    private lazy var button6: CustomButton = CustomButton(buttonTitle: "6")
    private lazy var buttonPlus: CustomButton = CustomButton(buttonTitle: "+")
    private lazy var buttonMinus: CustomButton = CustomButton(buttonTitle: "-")
    private lazy var button7: CustomButton = CustomButton(buttonTitle: "7")
    private lazy var button8: CustomButton = CustomButton(buttonTitle: "8")
    private lazy var button9: CustomButton = CustomButton(buttonTitle: "9")
    private lazy var buttonMultiply: CustomButton = CustomButton(buttonTitle: "*")
    private lazy var buttonClear: CustomButton = CustomButton(buttonTitle: "AC")
    private lazy var buttonBackspace: CustomButton = CustomButton(buttonTitle: "←")
    private lazy var buttonDegree: CustomButton = CustomButton(buttonTitle: "^")
    private lazy var buttonDivide: CustomButton = CustomButton(buttonTitle: "/")
    private lazy var buttonE: CustomButton = CustomButton(buttonTitle: "e")
    private lazy var buttonOpenBracket: CustomButton = CustomButton(buttonTitle: "(")
    private lazy var buttonClosedBracket: CustomButton = CustomButton(buttonTitle: ")")
    private lazy var buttonPi: CustomButton = CustomButton(buttonTitle: "π")
    private lazy var buttonDuplicateClear: CustomButton = CustomButton(buttonTitle: "AC")
    private lazy var buttonDuplicateBackspace: CustomButton = CustomButton(buttonTitle: "←")
    private lazy var buttonDuplicateDegree: CustomButton = CustomButton(buttonTitle: "^")
    private lazy var buttonDuplicateDivide: CustomButton = CustomButton(buttonTitle: "/")
    
    private lazy var inputLabel: UILabel = UILabel()
    private lazy var answerLabel: UILabel = UILabel()
    
    private lazy var firstHStackView: UIStackView = UIStackView()
    private lazy var secondHStackView: UIStackView = UIStackView()
    private lazy var thirdHStackView: UIStackView = UIStackView()
    private lazy var fourthHStackView: UIStackView = UIStackView()
    private lazy var fifthHStackView: UIStackView = UIStackView()
    private lazy var buttonsVerticalStackView: UIStackView = UIStackView()
    private lazy var labelsVerticalStackView: UIStackView = UIStackView()
    
    private lazy var noColorButtons: [CustomButton] = [
        button0,
        button1,
        button2,
        button3,
        button4,
        button5,
        button6,
        button7,
        button8,
        button9,
        buttonDot,
        buttonE,
        buttonPi,
        buttonOpenBracket,
        buttonClosedBracket,
    ]
    
    private lazy var withColorButtons: [CustomButton] = [
        buttonEqual,
        buttonPlus,
        buttonMinus,
        buttonMultiply,
        buttonClear,
        buttonBackspace,
        buttonDegree,
        buttonDivide,
        buttonDuplicateClear,
        buttonDuplicateDivide,
        buttonDuplicateDegree,
        buttonDuplicateBackspace,
    ]
    
    private lazy var allButtons: [CustomButton] = noColorButtons + withColorButtons
    
    private var sharedConstraints: [NSLayoutConstraint] = []
    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientLayer()
        addViews()
        setLabels()
        setStacks()
        setButtons()
        addConstrains()
        setStartingParameter()
#if DEBUG
        Singleton.shared.addTestData()
#endif
    }
    
    override func viewDidAppear(_ animated: Bool) {
        noColorButtons.setShadowsAndColor(color: .offWhite)
        withColorButtons.setShadowsAndColor(color: .customPurple)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.horizontalSizeClass == .compact && traitCollection.verticalSizeClass == .regular {
            if !portraitConstraints.isEmpty && landscapeConstraints[0].isActive {
                NSLayoutConstraint.deactivate(landscapeConstraints)
            }
            setPatametersToScreenOrientation(screenOrientation: .portrait)
        } else {
            if !landscapeConstraints.isEmpty && portraitConstraints[0].isActive {
                NSLayoutConstraint.deactivate(portraitConstraints)
            }
            setPatametersToScreenOrientation(screenOrientation: .landscape)
        }
    }
    
    private func setGradientLayer() {
        let gradientLayer = CAGradientLayer()
        
        if view.frame.height > view.frame.width {
            gradientLayer.frame.size.width = view.frame.height
            gradientLayer.frame.size.height = view.frame.height
        } else {
            gradientLayer.frame.size.width = view.frame.width
            gradientLayer.frame.size.height = view.frame.width
        }
        
        gradientLayer.colors = [UIColor.grabientBackgrounTopColor.cgColor, UIColor.grabientBackgrounButtomColor.cgColor]
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func addViews() {
        view.addSubview(buttonsVerticalStackView)
        view.addSubview(labelsVerticalStackView)
    }
    
    private func setLabels() {
        inputLabel.setLabel(numberOfLines: 2, text: "0")
        answerLabel.setLabel(numberOfLines: 1, text: "")
    }
    
    private func addConstrains() {
        buttonsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        labelsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let differentButtons = [button0, buttonClear]
        let sameButtons = allButtons.filter { !differentButtons.contains($0) }
        
        sameButtons.forEach { element in
            sharedConstraints.append(element.heightAnchor.constraint(equalTo: button1.heightAnchor))
            sharedConstraints.append(element.widthAnchor.constraint(equalTo: button1.widthAnchor))
        }
        
        sharedConstraints.append(contentsOf: [
            button0.heightAnchor.constraint(equalTo: button1.heightAnchor),
            buttonClear.heightAnchor.constraint(equalTo: button1.heightAnchor),
            buttonsVerticalStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelsVerticalStackView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelsVerticalStackView.widthAnchor.constraint(equalTo: buttonsVerticalStackView.widthAnchor)
        ])
        
        landscapeConstraints.append(contentsOf: [
            button0.widthAnchor.constraint(equalToConstant: (Constant.doubleButtonWidthInLandscape + Constant.stackSpacingInLandscape)),
            button1.heightAnchor.constraint(equalToConstant: Constant.buttonHeightInLandscape),
            button1.widthAnchor.constraint(equalToConstant: Constant.buttonWidthInLandscape),
            buttonClear.widthAnchor.constraint(equalTo: button0.widthAnchor),
            
            answerLabel.widthAnchor.constraint(equalTo: labelsVerticalStackView.widthAnchor),
            inputLabel.widthAnchor.constraint(equalTo: labelsVerticalStackView.widthAnchor),
            
            buttonsVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.stackSpacingInLandscape),
            labelsVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.labelsStackBottomAnchorInLandscape),
        ])
        
        portraitConstraints.append(contentsOf: [
            button0.widthAnchor.constraint(equalToConstant: (Constant.doubleButtonWidthInPortrait + Constant.stackSpacingInPortrait)),
            button1.heightAnchor.constraint(equalTo: button1.widthAnchor),
            button1.widthAnchor.constraint(equalToConstant: Constant.buttonWidthInPortrait),
            buttonClear.widthAnchor.constraint(equalTo: button1.widthAnchor),
            
            answerLabel.widthAnchor.constraint(equalTo: firstHStackView.widthAnchor),
            inputLabel.widthAnchor.constraint(equalTo: firstHStackView.widthAnchor),
            
            labelsVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.labelsStackBottomAnchorInPortrait),
            buttonsVerticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -Constant.stackSpacingInPortrait),
        ])
    }
    
    private func setStartingParameter() {
        hideLandscapeElement(hideElement: true)
        NSLayoutConstraint.activate(sharedConstraints)
        if view.frame.width < view.frame.height {
            setPatametersToScreenOrientation(screenOrientation: .portrait)
        } else {
            setPatametersToScreenOrientation(screenOrientation: .landscape)
        }
    }
    
    private func setPatametersToScreenOrientation(screenOrientation: ScreenOrientation){
        
        let stackArray: [UIStackView] = [
            fifthHStackView,
            fourthHStackView,
            thirdHStackView,
            secondHStackView,
            firstHStackView,
            buttonsVerticalStackView,
        ]
        
        switch screenOrientation {
        case .portrait:
            NSLayoutConstraint.activate(portraitConstraints)
            setFontSize(buttonsLabelSize: 30, inputLabelSize: 24, answerLabelSize: 36)
            hideLandscapeElement(hideElement: true)
            stackArray.setSpacingToArray(spacing: Constant.stackSpacingInPortrait)
        case .landscape:
            NSLayoutConstraint.activate(landscapeConstraints)
            setFontSize(buttonsLabelSize: 20, inputLabelSize: 30, answerLabelSize: 40)
            hideLandscapeElement(hideElement: false)
            stackArray.setSpacingToArray(spacing: Constant.stackSpacingInLandscape)
        }
        
        func setFontSize(buttonsLabelSize: CGFloat, inputLabelSize: CGFloat, answerLabelSize: CGFloat) {
            allButtons.setButtonLabelSizeToArray(labelSize: buttonsLabelSize)
            inputLabel.font = inputLabel.font.withSize(inputLabelSize)
            answerLabel.font = answerLabel.font.withSize(answerLabelSize)
        }
    }
    
    private func hideLandscapeElement(hideElement: Bool) {
        let hiddenButtonsInPortrait = [buttonE, buttonPi, buttonOpenBracket, buttonClosedBracket, buttonDuplicateClear, buttonDuplicateDegree, buttonDuplicateDivide, buttonDuplicateBackspace]
        let hiddenButtonsInLandscape = [buttonClear, buttonBackspace, buttonDegree, buttonDivide]
        
        hiddenButtonsInPortrait.forEach { element in
            element.isHidden = hideElement
        }
        hiddenButtonsInLandscape.forEach { element in
            element.isHidden = !hideElement
        }
    }
    
    private func setStacks() {
        firstHStackView.setStackView(viewArray: [
            buttonDuplicateDivide, buttonPi, button0, buttonDot, buttonEqual,
        ], axisHorizontal: true)
        secondHStackView.setStackView(viewArray: [
            buttonDuplicateDegree, buttonE,button1, button2, button3, buttonPlus
        ], axisHorizontal: true)
        thirdHStackView.setStackView(viewArray: [
            buttonDuplicateBackspace, buttonClosedBracket, button4, button5, button6, buttonMinus
        ], axisHorizontal: true)
        fourthHStackView.setStackView(viewArray: [
            buttonDuplicateClear, buttonOpenBracket, button7, button8, button9, buttonMultiply
        ], axisHorizontal: true)
        fifthHStackView.setStackView(viewArray: [
            buttonClear, buttonBackspace, buttonDegree, buttonDivide
        ], axisHorizontal: true)
        buttonsVerticalStackView.setStackView(viewArray: [
            fifthHStackView, fourthHStackView, thirdHStackView, secondHStackView, firstHStackView
        ], axisHorizontal: false)
        labelsVerticalStackView.setStackView(viewArray: [
            inputLabel, answerLabel,
        ], axisHorizontal: false)
    }
    
    private func setButtons() {
        allButtons.setCustomButtonsInArray(firstSelector: #selector(touchDownEvent(_:)), secondSelector: #selector(touchUpEvent(_:)))
        setButtonClear()
    }
    
    private func setButtonClear() {
        let clearButtons = [ buttonClear, buttonDuplicateClear]
        
        clearButtons.forEach { button in
            if  inputLabel.text == "0"{
                button.setTitle("AC", for: .normal)
                button.setTitleColor(.gray, for: .normal)
            } else {
                button.setTitle("C", for: .normal)
                button.setTitleColor(.red.withAlphaComponent(0.4), for: .normal)
            }
        }
    }
    
    @objc private func touchUpEvent(_ sender: CustomButton) {
        setButtonClear()
        if let text = sender.titleLabel?.text{
            if text == "AC" || text == "C"{
                inputLabel.text! = "0"
            }
        }
        sender.touchUpEvent()
    }
    
    @objc private func touchDownEvent(_ sender: CustomButton) {
        sender.touchDownEvent()
        
        guard let answer = answerLabel.text else { return }
        guard let symbol = sender.currentTitle else { return }
        guard let text = inputLabel.text else { return }
        guard let char = text.last else { return }
        
        let typingController = TypingController(symbol: symbol, text: text, char: String(char), lastAnswer: answer)
        
        inputLabel.text = typingController.runControll().input
        answerLabel.text = typingController.runControll().answer
        
        if symbol == "=" {
            safeAnswer()
            
        }
        
        func safeAnswer() {
            let answerForSafe = typingController.runControll().answer
            let fullAnswer = Answer(formula: inputLabel.text ?? "", answer: answerForSafe)
            
            Singleton.shared.answers.answersList.append(fullAnswer)
        }
    }
}
