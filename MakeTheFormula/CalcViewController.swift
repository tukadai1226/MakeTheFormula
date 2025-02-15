//
//  CalcViewController.swift
//  MakeTheFormula
//
//  Created by 大塚大樹 on 2025/02/12.
//

import UIKit
import AVFoundation

class CalcViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!

    var resultIndex: Int = 0
    var result = 0 // 答え
    var answer = 0 // 答えのボタン番号
    var point = 0
    
    enum Answer: Int {
        case plus = 0
        case minus = 1
        case multiply = 2
        case divide = 3
    }
    
    var timer: Timer?
    var time = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNewQuestion()
    }

    func makeNewQuestion() {
        pointLabel.text = "現在の得点: \(point)P"
        let num1 = Int.random(in: 1...9)
        let num2 = Int.random(in: 1...9)
        resultIndex = Int.random(in: 0...3)
        
        switch resultIndex {
        case 0: // 足し算
            questionLabel.text = "\(num1) ? \(num2) = \(num1 + num2)"
            answer = Answer.plus.rawValue
        case 1: // 引き算
            questionLabel.text = "\(num1) ? \(num2) = \(num1 - num2)"
            answer = Answer.minus.rawValue
        case 2: // 掛け算
            questionLabel.text = "\(num1) ? \(num2) = \(num1 * num2)"
            answer = Answer.multiply.rawValue
        case 3: // 割り算（整数になるように調整）
            let validNum1 = num1 * num2
            questionLabel.text = "\(validNum1) ? \(num2) = \(validNum1 / num2)"
            answer = Answer.divide.rawValue
        default:
            break
        }
    }

    @IBAction func buttonTapped(sender: UIButton) {
        let answerIndex = sender.tag
        print(String(answer))
        if answerIndex == answer {
            point += 10
        }
        makeNewQuestion()
    }
    // タイマー処理
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
    }
    @objc func tick() {
        time -= 1
        timerLabel.text = "残り時間: \(time)秒"
        if time <= 0 {
            timer?.invalidate()
            
        }
    }
}
