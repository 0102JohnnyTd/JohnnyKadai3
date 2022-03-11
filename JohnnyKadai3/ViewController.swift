//
//  ViewController.swift
//  JohnnyKadai3
//
//  Created by Johnny Toda on 2022/03/10.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var firstValueTextField: UITextField!

    @IBOutlet private weak var secondValueTextField: UITextField!

    @IBOutlet private weak var firstValueSwitch: UISwitch!

    @IBOutlet private weak var secondValueSwitch: UISwitch!

    @IBOutlet private weak var firstValueLabel: UILabel!

    @IBOutlet private weak var secondValueLabel: UILabel!

    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        let firstValue = switchSignFirstValue()
        let secondValue = switchSignSecondValue()

        firstValueLabel.text = String(firstValue)
        secondValueLabel.text = String(secondValue)
        resultLabel.text = String(firstValue + secondValue)
    }

    private func switchSignFirstValue() -> Int  {
        var firstValue = firstValueTextField.textToInt

        guard !firstValueSwitch.isOn else {
            firstValue *= -1
            return firstValue
        }
        return firstValue
    }

    private func switchSignSecondValue() -> Int {
        var secondValue = secondValueTextField.textToInt

        guard !secondValueSwitch.isOn else {
            secondValue *= -1
            return secondValue
        }
        return secondValue
    }
}


