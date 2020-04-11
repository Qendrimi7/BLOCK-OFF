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
    
    var coordinator: HomeCoordinatorProtocol!
    var viewModel: HomeViewModel!
    var items: [HomeModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDidLoad()
    }
    
    private func setupViewDidLoad() {
        title = "Home"
        setupViewModel()
        setupTableView()
        items = viewModel.getData()
        setupBarButtonItem()
        setupBackButton(title: "back")
        guard let navigationController = navigationController else { return }
        coordinator = HomeCoordinator(presenter: navigationController)
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
    
    // Logout button
    @objc func logoutAction(){
        let actionSheetController: UIAlertController = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "Yes",
                                        style: .default) { action -> Void in
                                            AuthToken.logOut()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel",
                                         style: .cancel) { action -> Void in }
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(cancelAction)
        present(actionSheetController, animated: true, completion: nil)
    }
}
