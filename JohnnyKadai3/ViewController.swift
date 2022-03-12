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
        do {
            let firstValue = switchSignFirstValue()
            let secondValue = switchSignSecondValue()
            var totalValue = 0

            totalValue = try totalValue.addingReportingOverflowWithError(firstValue)
            totalValue = try totalValue.addingReportingOverflowWithError(secondValue)

            firstValueLabel.text = String(firstValue)
            secondValueLabel.text = String(secondValue)
            resultLabel.text = String(firstValue + secondValue)
        } catch {
            switch error {
            case is OverflowError:
                resultLabel.text = "値が大きすぎるため扱うことができません"
            default:
                resultLabel.text = "不明のエラーが発生しました"
            }
        }
    }

    private func switchSignFirstValue() -> Int {
        let firstValue = firstValueTextField.textToInt

        guard !firstValueSwitch.isOn else {
            return -firstValue
        }
        return firstValue
    }

    private func switchSignSecondValue() -> Int {
        let secondValue = secondValueTextField.textToInt

        guard !secondValueSwitch.isOn else {
            return -secondValue
        }
        return secondValue
    }
}
