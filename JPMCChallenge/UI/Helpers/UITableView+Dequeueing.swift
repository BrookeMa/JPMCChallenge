//
//  UITableView+Dequeueing.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 03/05/2023.
//

import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        let identifier = String(describing: T.self)
        return dequeueReusableCell(withIdentifier: identifier) as! T
    }
}
