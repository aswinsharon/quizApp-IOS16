//
//  Question.swift
//  qizzApp
//
//  Created by Aswin Sharon on 12/08/23.
//

import Foundation

struct Question{
    
    let question:String
    
    let answer:String
    
    init(q:String, a:String){
        self.answer = a
        self.question = q
    }
}
