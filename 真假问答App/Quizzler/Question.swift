//
//  Question.swift
//  Quizzler
//
//  Created by 谷浩维 on 2021/1/13.
//  Copyright © 2021 rongcosme. All rights reserved.
//

import Foundation

class Question{
    
    let questionText:String
    let answer:Bool
    
    init(text:String,correctAnswer:Bool){
        questionText = text
        answer = correctAnswer
    }
    
}
//初始化类
//Question(text:"马云是中国首富吗？",correctAnswer:true)
