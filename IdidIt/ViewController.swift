//
//  ViewController.swift
//  IdidIt
//
//  Created by Roy Kim on 2017/12/12.
//  Copyright © 2017年 NC Design & Consulting Co., Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if UserDefaults.standard.string(forKey: "CURRENT_TIME") != nil {
            self.button.setTitle(UserDefaults.standard.string(forKey: "CURRENT_TIME"), for: UIControl.State.normal)
        }
    }

    @IBAction func changeLagel(_ sender: Any) {
        UserDefaults.standard.set(self.button.currentTitle, forKey: "PREVIOUS_TIME")
        self.button.setTitle(stringFromDate(format: "MM/dd HH:mm:ss", date: Date()), for: UIControl.State.normal)
        UserDefaults.standard.set(self.button.currentTitle, forKey: "CURRENT_TIME")
        self.cancelButton.isEnabled = true
    }
 
    @IBAction func cancelTheAction(_ sender: Any) {
        self.button.setTitle(UserDefaults.standard.string(forKey:  "PREVIOUS_TIME"), for: UIControl.State.normal)
        UserDefaults.standard.set(self.button.currentTitle, forKey: "CURRENT_TIME")
        self.cancelButton.isEnabled = false
    }
    // 日付と文字列のフォーマット変換
    func stringFromDate(format: String, date: Date) -> String {
        let dateFormatter = DateFormatter()
        // 下記のリンクの情報を参考。以下の１行がないと、２４時間表示をオフにした場合にアプリが落ちる。
        // http://qiita.com/motokiee/items/4304361dfa8b43deba03
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

