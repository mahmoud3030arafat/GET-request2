//
//  NewsTableViewCell.swift
//  NewDemo
//
//  Created by Mahmoud on 9/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    //
     func updateUI(title: String?,urlImage:String?) {
          
        self.newsLabel.text=title
         
                 var urlString : String?
                 guard let urlImage = urlImage else {return}
                 urlString = urlImage
          
          guard let posterImageURL = URL(string: urlString!) else {
              self.newsImage.image = UIImage(named: "noImageAvailable")
              return
          }
          
          // Before we download the image we clear out the old one
          self.newsImage.image = nil
          
          getImageDataFrom(url: posterImageURL)
          
      }
    //
    
     func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle Error
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                // Handle Empty Data
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.newsImage.image = image
                }
            }
        }.resume()
    }

}
