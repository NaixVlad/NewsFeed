//
//  ViewController.swift
//  NewsFeed
//
//  Created by Vladislav Andreev on 01.11.2017.
//  Copyright © 2017 Vladislav Andreev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiService = ApiService()
        apiService.fetchCellModel(page: 1, userId: 1) { (model) in
            print(model)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

