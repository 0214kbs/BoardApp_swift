//
//  Model.swift
//  BoardApp_swift
//
//  Created by 곽보선 on 2022/03/08.
//

import Foundation

class Memo{
    var content: String
    var insertDate: Date
    
    init(content: String){
        self.content = content
        insertDate = Date()
    }
    
    //Dummy data 저장하는 배열
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "Dolar Amet")
    ]
}
