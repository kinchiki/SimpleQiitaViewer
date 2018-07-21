//
//  ArticleListViewController.swift
//  QiitaViewer
//
//  Created by 水野陽斗 on 2018/07/21.
//  Copyright © 2018 akitomizuno. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ArticleListViewController: UIViewController, UITableViewDataSource {
    let END_POINT: String = "https://qiita.com/api/v2/items"
    let table = UITableView()
    var articles: [[String: String?]] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let article = articles[indexPath.row]
        cell.textLabel?.text = article["title"]!
        cell.detailTextLabel?.text = article["userId"]!

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "new article"

        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self

        getArticles()
    }

    func getArticles() {
        Alamofire.request(END_POINT, method: .get).responseJSON { response in
            switch response.result {

            case .success(let value):
                self.appendJsonToArticle(json_value: JSON(value))
                self.table.reloadData()

            case .failure(let error):
                print(error)
            }
        }
    }

    func appendJsonToArticle(json_value: JSON) {
        json_value.forEach { (_, json) in
            let article: [String: String?] = [
                "title": json["title"].string,
                "userId": json["user"]["id"].string
            ]
            articles.append(article)
        }
    }
}
