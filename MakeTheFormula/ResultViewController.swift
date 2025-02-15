//
//  ResultViewController.swift
//  MakeTheFormula
//
//  Created by 大塚大樹 on 2025/02/15.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    var point = 0
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 得点ラベル
        resultLabel.text = "得点 : \(point)P."
        // リザルトラベル
        if point > 10 {
            resultLabel.text = "Congracration!"
        }else if point > 5 {
            resultLabel.text = "Good!"
        }else {
            resultLabel.text = "Missed..."
        }
        //　最高得点ラベル
    }
    // 戻るボタン
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
