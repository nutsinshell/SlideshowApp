//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by Mizuki on 2017/06/21.
//  Copyright © 2017年 nutsinshell. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

// 2画面目のViewを、StoryboardでこのViewControllerにIBOutletとして接続しておく
    @IBOutlet weak var imageView: UIImageView!
    
    // 受け取るためのプロパティ（変数）を宣言しておく
    var dispImageNo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1画面目のViewControllerから遷移するときにprepareForSegueで
        // dispImageNoの値を新たに代入されたので値が入っている
       
        let imageNameArray = [
            "image1.jpeg",
            "image2.jpeg",
            "image3.jpg",
            ]
        if dispImageNo == 0 {     // 0なら0の画像を表示
            dispImageNo = 0
        }
        if dispImageNo == 1 {    
            dispImageNo = 1
        }
        if dispImageNo == 2 {
            dispImageNo = 2
        }
        
        let name = imageNameArray[dispImageNo]  // 表示している画像の番号から名前を取り出し
        let image = UIImage(named: name)     // 画像を読み込み
        imageView.image = image // Image Viewに読み込んだ画像をセット
    }
    

    @IBOutlet weak var secondLabel: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    }
