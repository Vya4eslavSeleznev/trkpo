//
//  EquipmentViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 14.12.2021.
//

import UIKit

class EquipmentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let equipment = ["Guitar", "Snare", "Guitar 2"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: EquipmentTableViewCell.identifier) as? EquipmentTableViewCell
            let equipment = Equipment(name: equipment[indexPath.row], image: nil, price: 0)
            cell?.configure(with: equipment)
            return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(EquipmentTableViewCell.self, forCellReuseIdentifier: EquipmentTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .link
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
