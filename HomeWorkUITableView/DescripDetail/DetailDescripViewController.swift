//
//  DetailDescripViewController.swift
//  HomeWorkUITableView
//
//  Created by Денис Шишкин on 15.01.2023.
//

import UIKit

class DetailDescripViewController: UIViewController {
    
  @IBOutlet weak var userProfLabel: UILabel!
  @IBOutlet weak var userSurnameLabel: UILabel!
  @IBOutlet weak var userDescripLabel: UILabel!
  
  var userSurname: String?
  var userProf: String?
  var userDescrip: String?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView() {
      self.userSurnameLabel.text = self.userSurname
      self.userProfLabel.text = self.userProf
      self.userDescripLabel.text = self.userDescrip
      
    }
}
