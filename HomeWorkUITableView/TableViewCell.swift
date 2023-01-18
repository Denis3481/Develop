//
//  TableViewCell.swift
//  HomeWorkUITableView
//
//  Created by Денис Шишкин on 12.01.2023.
//

import UIKit
class TableViewCell: UITableViewCell {
  
  @IBOutlet weak var userDescripProf: UILabel!
  @IBOutlet weak var userName: UILabel!
  
  var indexPath: IndexPath?
  var userSurname: String?
  var userProf: String?
  var userDescrip: String?
  
  override func prepareForReuse() {
      super.prepareForReuse()
      self.userName.text = nil
      self.userDescripProf.text = nil
      self.indexPath = nil
  }

  func setup(indexPath IndexPath: IndexPath, userSurname: String, userProf: String, userDescrip: String) {
    self.indexPath = IndexPath
    self.userSurname = userSurname
    self.userProf = userProf
    self.userDescrip = userDescrip
    self.userName.text = self.userSurname
    self.userDescripProf.text = self.userProf
  }
}
