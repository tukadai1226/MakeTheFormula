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
    
    let userDefoultKey = "highScore"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 得点ラベル
        pointLabel.text = "得点 : \(point)P."
        //　最高得点の保存
        if point > highScore {
            UserDefaults.standard.set(point, forKey: userDefoultKey)
        }
        // 最高得点の取り出し
        UserDefaults.standard.register(defaults: [userDefoultKey: 0]) // 初期化
        highScore = UserDefaults.standard.integer(forKey: userDefoultKey)
        highScoreLabel.text = "最高得点 : \(highScore)P"
        // リザルトラベル
        if point > highScore {
            resultLabel.text = "Congracration!"
        }else if point > 5 {
            resultLabel.text = "Good!"
        }else {
            resultLabel.text = "Missed..."
        }
    }
    // 戻るボタン
    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
