//
//  PickerViewController.swift
//  HelloEmojiTableView
//
//  Created by 胡靜諭 on 2018/1/18.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    var label:UILabel?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        需要幾欄
      
        return 1
        
   }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
//        需要幾列
        
        return Emoji.all.count
    }
    
   // 如果要放上文字列的話
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Emoji.all[row].symbol
    }
    
//    選擇到某一個row
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let emoji = Emoji.all [row]
        label?.text = emoji.description
    }
    
    
//    如果放上圖片的話
//    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
//        <#code#>
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x:50, y:50, width:200, height: 100)
        label = UILabel(frame:frame)
        
        view.addSubview(label!)
//        加入至畫面上
        // Do any additional setup after loading the view.
    }


    
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//
//        let frame = CGRect(x:50, y:50, width:200, height: 100)
//        let label = UILabel(frame:frame)
//        label.translatesAutoresizingMaskIntoConstraints = false
////       他會自動幫你加contraint 但可能會和autolayout衝突
//        label.topAnchor.constraint(equalTo:view.topAnchor)
    
//        找到正確被點選的emoji
    
//    let emoji = Emoji.all[row]
//    label.text = emoji.description
    
    
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
