//
//  ApiService.swift
//  NewDemo
//
//  Created by Mahmoud on 9/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import Foundation
//protocol MyProtocol {
//    func sendData(articles:[articles])
//}





class  ApiService {
    
   // var delegate : MyProtocol?
   
    
    
    func getNews(compeletion: @escaping ([articles]?,Error?)->Void){
        let urlString  = "https://newsapi.org/v2/everything?q=apple&from=2021-09-06&to=2021-09-06&sortBy=popularity&apiKey=28f1864b61b647a2812608243a38b439"
        
        let url = URL(string: urlString)!
        
        let session  = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else{return}
            
            do{
                let decoder  =   JSONDecoder()
              let decodedData =  try decoder.decode(News.self, from: data)
                
                print(decodedData.articles)
                compeletion(decodedData.articles,nil)
//                self.delegate?.sendData(articles: decodedData.articles)
                
                
            }catch let error {
                
                print(error)
                compeletion(nil,error)
             
                
            }
           
            
            
            //
        }
        task.resume()
        
        
        
        
    }
    
    
    
    
    
}


