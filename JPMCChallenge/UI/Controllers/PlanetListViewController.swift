//
//  PlanetListViewController.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import UIKit

public final class PlanetListViewController: UITableViewController, UITableViewDataSourcePrefetching {
    
    var viewModel: PlanetListViewModel? {
        didSet {
            bind()
        }
    }
    
    var tableModel = [PlanetCellController]() {
        didSet { tableView.reloadData() }
    }
    
    func bind() {
        viewModel?.onLoadingStateChange = { [weak self] isLoading in
            if isLoading {
                self?.refreshControl?.beginRefreshing()
            } else {
                self?.refreshControl?.endRefreshing()
            }
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
    }
    
    @objc private func refresh() {
        viewModel?.loadPlanets()
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableModel.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellController(forRowAt: indexPath).view(in: tableView, cellForRowAt: indexPath)
    }
    
//    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }

    private func cellController(forRowAt indexPath: IndexPath) -> PlanetCellController {
        return tableModel[indexPath.row]
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
}
