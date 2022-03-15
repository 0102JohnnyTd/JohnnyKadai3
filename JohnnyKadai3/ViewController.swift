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
            // 三項演算子で処理をコンパクトに実装
            let firstValue = firstValueTextField.textToInt * (firstValueSwitch.isOn ? -1 : 1)
            let secondValue = secondValueTextField.textToInt * (secondValueSwitch.isOn ? -1 : 1)

            // reduceを使って冗長なコードをコンパクトに実装
            let totalValue = try [firstValue, secondValue].reduce(0, {
                try $0.addingReportingOverflowWithError($1)
            })

            firstValueLabel.text = String(firstValue)
            secondValueLabel.text = String(secondValue)
            resultLabel.text = String(totalValue)
        } catch {
            switch error {
            case is OverflowError:
                resultLabel.text = "値が大きすぎるため扱うことができません"
            default:
                resultLabel.text = "不明のエラーが発生しました"
            }
        }
    }
}
