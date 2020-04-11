//
//  HomeVC.swift
//  BLOCK OFF
//
//  Created by Qendrim Mjeku on 4/9/20.
//  Copyright © 2020 Qëndrim Mjeku. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
        
    var viewModel: HomeViewModel!
    var items: [HomeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        title = "Home"
        setupBarButtonItem()
        setupViewModel()
        setupTableView()
        items = viewModel.getData()
    }
    
    private func setupViewModel() {
        viewModel = HomeViewModel()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "BarricadeCell",
                                 bundle: nil),
                           forCellReuseIdentifier: "BarricadeCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupBarButtonItem() {
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout",
                                                  style: .done,
                                                  target: self,
                                                  action: #selector(logoutAction))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    
    @objc func logoutAction(){
        AuthToken.logOut()
    }
    
}
