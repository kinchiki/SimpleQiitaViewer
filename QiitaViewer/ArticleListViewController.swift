//
//  ArticleListViewController.swift
//  QiitaViewer
//
//  Created by 水野陽斗 on 2018/07/21.
//  Copyright © 2018 akitomizuno. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController {
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "new article"

        table.frame = view.frame
        view.addSubview(table)
    }
}
