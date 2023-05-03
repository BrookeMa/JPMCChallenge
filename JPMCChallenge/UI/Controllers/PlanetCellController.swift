//
//  PlanetCellController.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 03/05/2023.
//

import UIKit

final class PlanetCellController {
    private let viewModel: PlanetViewModel
    private var cell: UITableViewCell?
    public var selection: () -> Void
    
    init(viewModel: PlanetViewModel, selection: @escaping () -> Void) {
        self.viewModel = viewModel
        self.selection = selection
    }
    
    func view(in tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = binded(tableView.dequeueReusableCell())
        return cell
    }
    
    private func binded(_ cell: PlanetListViewTableViewCell) -> UITableViewCell {
        self.cell = cell
        
        cell.nameContentLabel.text = viewModel.name
        cell.rotationPeriodContentLabel.text = viewModel.rotationPeriod
        cell.orbitalPeriodContentLabel.text = viewModel.orbitalPeriod
        cell.diameterContentLabel.text = viewModel.diameter
        
        return cell
    }
}
