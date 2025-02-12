//
//  CalcViewController.swift
//  MakeTheFormula
//
//  Created by 大塚大樹 on 2025/02/12.
//

import UIKit

class CalcViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var pulsButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var hangButton: UIButton!
    @IBOutlet weak var devideButton: UIButton!
    
    
    
    var resultIndex:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func makeNewQuestion() {
        let num1 = Int.random(in: 1...9)
        let num2 = Int.random(in: 1...9)
        resultIndex = Int.random(in: 0...3)
        
        switch resultIndex {
        case 0:
            questionLabel.text = "\(num1) ? \(num2) = \(num1 + num2)"
        case 1:
            questionLabel.text = "\(num1) ? \(num2) = \(num1 - num2)"
        case 2:
            questionLabel.text = "\(num1) ? \(num2) = \(num1 * num2)"
        default:
            questionLabel.text = "\(num1) ? \(num2) = \(num1 / num2)"
        }
    }
}
