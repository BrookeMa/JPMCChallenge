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
    
    private func bind() {
        
    }
    
    public override func viewDidLoad() {
        
    }
    
    public func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
    }
}
