//
//  ViewController.swift
//  HelloEmojiTableView
//
//  Created by 胡靜諭 on 2018/1/16.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var emojiTableView: UITableView!
    
    @IBAction func loadAllEmojis(_ sender: UIBarButtonItem) {
        
        
//        生成路徑
        // 準備file manager
        
        let fileManager = FileManager.default
        //        準備文件資料夾
        
        let documentURL = fileManager.urls(for:.documentDirectory,in:.userDomainMask).first!
        
        //        準備存檔名 並添於文件資料夾
        
        let fileURL =
            documentURL.appendingPathComponent("emoji").appendingPathExtension("plist")
        
        //        將所有的emoji編碼
        
//        準備解碼器
        let decoder = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf:fileURL){
            
            let decodedEmojis = try? decoder.decode([Emoji].self, from: retrievedData)
//            [Emoji]當初設就是一個陣列
            if decodedEmojis != nil {
                Emoji.all = decodedEmojis!
                emojis = Emoji.all
                emojiTableView.reloadData()
            }
        }
        
        
    }
    @IBAction func saveAllEmojis(_ sender: UIBarButtonItem) {
//        生成路徑
//        準備file manager
        
        let fileManager = FileManager.default
//        準備文件資料夾
        
        let documentURL = fileManager.urls(for:.documentDirectory,in:.userDomainMask).first!
        
//        準備存檔名 並添於文件資料夾
        
        let fileURL =
        documentURL.appendingPathComponent("emoji").appendingPathExtension("plist")
        
//        將所有的emoji編碼
//        準備編碼器
        
        let encoder = PropertyListEncoder()
        if let encodedEmojis = try?encoder.encode(Emoji.all) {
            
//            為了debug方便 把路徑印出來
            print ("存檔於：" + fileURL.absoluteString)
            // 將編碼後的emoji存入路徑
            try? encodedEmojis.write(to:fileURL,options:.noFileProtection)
//            noFileProtection ->就去在一次就會被取帶掉
        }
//        將編碼後的emoji存入路徑
        
        
        
    }
    
    var emojis = Emoji.all
    
//    let emojis = ["🍊","🍏","🍒","🍞"]
//    let emojiDescription = ["這是麵包也可能是金牛角","這是花椰菜也可能是雨傘","這是櫻桃也可能是玩具","這是橘子也可能是水果"]
//
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        tableView會問ＶＣ有幾列
        return emojis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        哪一個index需要畫面
//        準備cell
        //  第一列畫面是什麼？ 第二列畫片是什麼？ TableViewCell是個畫面
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
  
//        最好的方法如下 就是上面先擺好陣列 然後在下面呼叫是第幾個位置indexPath.row
        
        cell.textLabel?.text = emojis [indexPath.row].symbol
        cell.detailTextLabel?.text = emojis[indexPath.row].description
//
//        第二種方法
//
//        switch indexPath.row {
//        case 0:
//          cell.textLabel?.text = "🥐"
//          cell.detailTextLabel?.text = "這是麵包也可能是金牛角"
//        case 1:
//            cell.textLabel?.text = "🥦"
//            cell.detailTextLabel?.text = "這是花椰菜也可能是雨傘"
//        case 2:
//            cell.textLabel?.text = "🍒"
//            cell.detailTextLabel?.text = "這是櫻桃也可能是玩具"
//        default:
//            cell.textLabel?.text = "🍊"
//            cell.detailTextLabel?.text = "這是橘子也可能是水果"
//
//        }
        
//        cell.textLabel?.text = "🥐"
//        cell.detailTextLabel?.text = "這是麵包也可能是金牛角"
        return cell
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let 🥦 = Emoji (symbol:"🥦", description:"這是花椰菜也可能是雨傘")
//        let 🍒 = Emoji (symbol:"🍒", description:"這是櫻桃也可能是玩具")
//        let 🍊 = Emoji (symbol:"🍊", description:"這是橘子也可能是水果")
//        emojis = [🥦,🍒, 🍊]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emojis = Emoji.all
        emojiTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
//            砍資料
            Emoji.removeEmoji(at: indexPath.row)
            emojis = Emoji.all
//            砍畫面
            tableView.deleteRows(at:[indexPath],with:.automatic)
}
}
    
//    override func prepare(for segue:UIStoryboardSegue,sender: Any?){
//        if segue.identifier == "modify" {
////            得知使用者點選了哪一個indexPath
//            if let indexPath = emojiTableView.indexPathForSelectedRow {
////             得知使用者點了哪一個ＥＭＯＪＩ
//
//                let emoji = emojis[indexPath.row]
////                準備傳給下一頁
//
//                let nextVC = segue.destination as! EmojiViewController
//                nextVC.emoji = emoji
//                nextVC.indexPath = indexPath
//
//            }
//        }
//}

}



