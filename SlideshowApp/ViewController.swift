//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Mizuki on 2017/06/21.
//  Copyright © 2017年 nutsinshell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backButtonEnabled: UIButton!
    
    @IBOutlet weak var forwardButtonEnabled: UIButton!
    
    @IBAction func playView(_ sender: Any) {
        toggleSlideshow(isEnabled: timer == nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!    //画像を送る処理を書く
    
    @IBOutlet weak var playButton: UIButton!
    
    var timer:Timer?
    var dispImageNo = 0  // 表示している画像の番号
    
    func displayImage() {   // 表示している画像の番号を元に画像を表示する
        let imageNameArray = [
            "image1.jpeg",
            "image2.jpeg",
            "image3.jpg",
            ]
        
        if dispImageNo < 0 {     // 範囲より下なら最後の画像を表示
            dispImageNo = 2
        }
        if dispImageNo > 2 {    // 範囲より上なら最初の画像を表示
            dispImageNo = 0
        }
        let name = imageNameArray[dispImageNo]  // 表示している画像の番号から名前を取り出し
        let image = UIImage(named: name)     // 画像を読み込み
        imageView.image = image // Image Viewに読み込んだ画像をセット
    }
    
    func toggleSlideshow(isEnabled:Bool) {
        if isEnabled { // 2秒ごとに動作するタイマーを作る
            playButton.setTitle("停止",for: .normal)
            
            self.timer = Timer.scheduledTimer(
                timeInterval: 2.0,
                target: self,
                selector: #selector(onTimer),
                userInfo: nil,
                repeats: true
            )
        } else {
            playButton.setTitle("再生",for: .normal)
            
            if (timer != nil) {
                timer?.invalidate()
                timer = nil
            }
        }
        
        self.backButtonEnabled.isEnabled = !isEnabled
        self.forwardButtonEnabled.isEnabled = !isEnabled
    }
    

    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "image1.jpeg")
        imageView.image = image
    }
    
    func onTimer(timer: Timer?) {  // 関数が呼ばれていることを確認
        print("onTimer")
        dispImageNo += 1    // 表示している画像の番号を1増やす
        displayImage()  // 表示している画像の番号を元に画像を表示する
    }
    
    @IBAction func backButton(_ sender: Any) {
        dispImageNo -= 1    // 表示している画像の番号を1増やす
        displayImage()
        }
    
    @IBAction func forwardButton(_ sender: Any) {
        dispImageNo += 1    // 表示している画像の番号を1増やす
        displayImage()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //拡大画面のための関数
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        toggleSlideshow(isEnabled: false)
        
        // segueから遷移先のResultViewControllerを取得する
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        // 遷移先のSecondViewControllerで宣言しているdispImageNoに値を代入して渡す
        secondViewController.dispImageNo = dispImageNo
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }

}
