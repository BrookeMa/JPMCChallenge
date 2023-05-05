//
//  PlanetListViewTableViewCell.swift
//  JPMCChallenge
//
//  Created by Ye Ma on 01/05/2023.
//

import UIKit

public final class PlanetListViewTableViewCell: UITableViewCell {
    
    public lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Planet Name"
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 140),
        ])
        
        return label
    } ()
    
    public lazy var nameContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        contentView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: nameLabel.rightAnchor, constant: 10),
        ])
        
        return label
    } ()
    
    public lazy var rotationPeriodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Rotation Period"
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 140),
        ])

        return label
    } ()

    public lazy var rotationPeriodContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: rotationPeriodLabel.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: rotationPeriodLabel.rightAnchor, constant: 10),
        ])

        return label
    } ()

    public lazy var orbitalPeriodLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Orbital Period"
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: rotationPeriodLabel.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 140),
        ])

        return label
    } ()

    public lazy var orbitalPeriodContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: orbitalPeriodLabel.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: orbitalPeriodLabel.rightAnchor, constant: 10),
        ])

        return label
    } ()

    public lazy var diameterLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.text = "Diameter"
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: orbitalPeriodLabel.bottomAnchor, constant: 10),
            label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 18),
            label.widthAnchor.constraint(equalToConstant: 140),
            
        ])

        return label
    } ()

    public lazy var diameterContentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        contentView.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: diameterLabel.topAnchor),
            label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            label.leftAnchor.constraint(equalTo: diameterLabel.rightAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -18)
        ])

        return label
    } ()
}

