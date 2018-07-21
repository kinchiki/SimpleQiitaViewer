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

class ArticleListViewController: UIViewController {
    let END_POINT: String = "https://qiita.com/api/v2/items"
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "new article"

        table.frame = view.frame
        view.addSubview(table)
        getArticles()
    }

    func getArticles() {
        Alamofire.request(END_POINT, method: .get).responseJSON { response in
            switch response.result {

            case .success(let value):
                let json_value = JSON(value)
                json_value.forEach { (_, json) in
                    print(json["title"])
                    print(json["user"]["id"])
                }

            case .failure(let error):
                print(error)
            }
        }
    }
}
