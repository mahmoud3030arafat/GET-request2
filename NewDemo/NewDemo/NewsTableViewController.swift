//
//  NewsTableViewController.swift
//  NewDemo
//
//  Created by Mahmoud on 9/7/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
   var arr   = [articles]()
    let apiservice = ApiService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //apiservice.delegate=self
        apiservice.getNews { (articles, error) in
            guard let articles  = articles else {return}
            self.arr=articles
            DispatchQueue.main.async {
                  self.tableView.reloadData()
            }
            
          
        }
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return arr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NewsTableViewCell

        // Configure the cell...
        cell.updateUI(title: arr[indexPath.row].author, urlImage: arr[indexPath.row].urlToImage)
        

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

//extension NewsTableViewController:MyProtocol{
//    func sendData(articles: [articles]) {
//        self.arr=articles
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//
//
//
//
//}
