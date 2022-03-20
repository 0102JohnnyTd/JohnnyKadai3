//
//  ViewController.swift
//  JohnnyKadai3
//
//  Created by Johnny Toda on 2022/03/10.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var valueTextFields: [UITextField]!

    @IBOutlet private var valueSwitches: [UISwitch]!

    @IBOutlet weak private var firstValueLabel: UILabel!

    @IBOutlet private weak var secondValueLabel: UILabel!

    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        do {
            // textFieldの入力値をInt型に変換する
            let values = valueTextFields.map { $0.textToInt }
            // zipメソッドで配列をペアにしたタプルを作る。mapメソッドで各配列の要素にアクセスし三項演算子で符号の切り替えを実装
            let signNums = zip(valueSwitches, values).map { $0.isOn ? -$1 : $1 }
            // reduceメソッドで合計値を算出し、OverflowErrorハンドリングも実装。
            let totalValues = try values.reduce(0) { try $0.addingReportingOverflowWithError($1) }

            firstValueLabel.text = String(signNums[0])
            secondValueLabel.text = String(signNums[1])
            resultLabel.text = String(totalValues)
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
