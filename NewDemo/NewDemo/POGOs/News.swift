//
//  News.swift
//  NewDemo
//
//  Created by Mahmoud on 9/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import Foundation



struct News:Decodable{
    
    let  status : String?
    let totalResults : Int?
    let  articles : [articles]
    
    
    private enum CodingKeys:String,CodingKey{
        
        case status = "status"
        case totalResults = "totalResults"
        case  articles = "articles"
        
    }
    
    
    
}



struct articles:Decodable {
    
    let source : source
    let author : String?
    let title :String?
    let description:String?
    let url:String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    
    private enum CodingKeys:String,CodingKey{
        
        case  source="source"
        case author = "author"
        case  title = "title"
        case  description="description"
        case url = "url"
        case  urlToImage = "urlToImage"
        case   publishedAt = "publishedAt"
        case content = "content"
        
    }
    
    
    
    
    
    
}


struct source:Decodable {
    
    
    let id : String?
    let name : String?
    private enum CodingKeys:String,CodingKey{
    
    case  id="id"
    case name="name"
    }
    
    
}
