//
//  EmojiViewController.swift
//  HelloEmojiTableView
//
//  Created by 胡靜諭 on 2018/1/16.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import UIKit

class EmojiViewController: UIViewController {

   var emojis = Emoji.all
    
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    


    
    @IBAction func saveButtonPress(_ sender: Any) {
        
        let emojiSymbol = emojiTextField.text
        let description = descriptionTextField.text
        
        if emoji != nil {
            //    表示要修改原本的表情符號
            var wantToBeModified = Emoji.all[indexPath!.row]
            wantToBeModified.symbol = emojiSymbol!
            wantToBeModified.description = description!
            
        }else {
            // 代表要新增表情符號 製作成emoji
            let aEmoji = Emoji(symbol:emojiSymbol!, description: description!)
            //    將emoji存入app
            Emoji.add(emoji:aEmoji)
            
        }
        
        
//        let aEmoji = Emoji(symbol:emojiSymbol!,description:description!)
//
//        Emoji.add(emoji:aEmoji)
//        
        navigationController?.popViewController(animated: true)
        
    
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emojiTextField.text = emoji?.symbol
        descriptionTextField.text = emoji?.description

        // Do any additional setup after loading the view.
    }
//    計算要在viewDidiload後面
    
    var emoji:Emoji?
    
    var indexPath: IndexPath?
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


