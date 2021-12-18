//
//  ReserveViewController.swift
//  MusicalRoom
//
//  Created by Алена Захарова on 18.12.2021.
//

import UIKit
import DropDown

class ReserveViewController: UIViewController {
    
    let rooms = ["Room 1", "Room 2", "Room 3", "Room 4", "Room 5"]
    
    private let roomLabel: UILabel = {
        let label = UILabel()
        label.text = "Room"
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roomView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let selectRoomButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Room", for: .normal)
        button.addTarget(self,action: #selector(selectRoomButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //fixme
    private let instrumentsLabel: UILabel = {
        let label = UILabel()
        label.text = "Instruments"
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.font =  UIFont(name: "Sacramento-Regular", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let reserveButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: "FasterOne-Regular", size: 25)
        button.setTitle("Reserve", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self,action: #selector(reserveButtonTapped),for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let dropDown = DropDown()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        setUI()
        
        dropDown.anchorView = roomView
        dropDown.dataSource = rooms
        
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .bottom
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
          print("Selected item: \(item) at index: \(index)")
            self.selectRoomButton.setTitle(rooms[index], for: .normal)
        }
    }
    
    func setBackground(){
        let background = UIImage(named: "reserve-bg")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    func setUI() {
        view.addSubview(roomLabel)
        roomLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        roomLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        
        roomView.addSubview(selectRoomButton)
        
        view.addSubview(roomView)
        roomView.topAnchor.constraint(equalTo: roomLabel.bottomAnchor, constant: 10).isActive = true
        roomView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        roomView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30).isActive = true
        roomView.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        selectRoomButton.topAnchor.constraint(equalTo: roomView.topAnchor, constant: 0).isActive = true
        selectRoomButton.bottomAnchor.constraint(equalTo: roomView.bottomAnchor, constant: 0).isActive = true
        selectRoomButton.leftAnchor.constraint(equalTo: roomView.leftAnchor, constant: 0).isActive = true
        selectRoomButton.rightAnchor.constraint(equalTo: roomView.rightAnchor, constant: 0).isActive = true

        view.addSubview(reserveButton)
        reserveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        view.addConstraint(NSLayoutConstraint(item: reserveButton,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.85,
                                              constant: 0))
        reserveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reserveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

    }
    
    @objc private func reserveButtonTapped() {
        //todo
    }
    
    @objc private func selectRoomButtonTapped() {
        dropDown.show()
    }

}
