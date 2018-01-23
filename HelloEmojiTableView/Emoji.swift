//
//  Emoji.swift
//  HelloEmojiTableView
//
//  Created by 胡靜諭 on 2018/1/16.
//  Copyright © 2018年 胡靜諭. All rights reserved.
//

import Foundation
//Foundation 技術框架

struct Emoji: Codable{
    
    static var all: [Emoji] = []
    //static var all: [Emoji]()
    
    var symbol: String
    var description:String
    
//    加入 emoji 到資料中
//    static 這裡和生命週期無關 純粹是資料可以共享
    static func add(emoji:Emoji) {
        
        all.append(emoji)
    }
//    移除第n個emoji
    static func removeEmoji(at index:Int){
        all.remove(at:index)
    }
///存擋路徑
    
   static var fileURL: URL {
    let fileManager = FileManager.default
    //        準備文件資料夾
    
    let documentURL = fileManager.urls(for:.documentDirectory,in:.userDomainMask).first!
    
    //        準備存檔名 並添於文件資料夾
    
    let fileURL =
        documentURL.appendingPathComponent("emoji").appendingPathExtension("plist")
    
    return fileURL
    
    }
///    存擋
    static func save() {
        
        let encoder = PropertyListEncoder()
        if let encodedEmojis = try?encoder.encode(Emoji.all) {
            
            //            為了debug方便 把路徑印出來
            print ("存檔於：" + fileURL.absoluteString)
            // 將編碼後的emoji存入路徑
            try? encodedEmojis.write(to:fileURL,options:.noFileProtection)
            //            noFileProtection ->就去在一次就會被取帶掉
        
        }
    }
    
    static func load() {
        
        let decoder = PropertyListDecoder()
        if let retrievedData = try? Data(contentsOf:fileURL){
            
            let decodedEmojis = try? decoder.decode([Emoji].self, from: retrievedData)
            //            [Emoji]當初設就是一個陣列
            if decodedEmojis != nil {
                Emoji.all = decodedEmojis!
            }
    }
    
//    static func allEmojis()-> [Emoji]{
//        let 🥦 = Emoji (symbol:"🥦", description:"這是花椰菜也可能是雨傘")
//        let 🍒 = Emoji (symbol:"🍒", description:"這是櫻桃也可能是玩具")
//        let 🍊 = Emoji (symbol:"🍊", description:"這是橘子也可能是水果")
//        return  [🥦,🍒,🍊]
//    }
}

}
