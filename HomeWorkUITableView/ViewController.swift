//
//  ViewController.swift
//  HomeWorkUITableView
//
//  Created by Денис Шишкин on 12.01.2023.
////Создать список пользователей с помощью табличного представления (с динамичной подгрузкой данных и своим классом ячейки)
//В приложении добавить переход от короткой информации о пользователе в ячейке - к экрану подробной информации из предыдущего ДЗ
//Для отображения создать 3-4 объекта пользователя и передавать данные о них на следующий экран подробно информации


import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
    private var profession = Professions.ProffDiscrip()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard
      segue.identifier == "DetailDescripViewController",
      let detailDescripViewController = segue.destination as? DetailDescripViewController,
      let selectedCell = sender as? TableViewCell
    else { return }
    
    if selectedCell.indexPath != nil {
          detailDescripViewController.userSurname = selectedCell.userSurname
          detailDescripViewController.userProf = selectedCell.userProf
          detailDescripViewController.userDescrip = selectedCell.userDescrip
        } else {
          detailDescripViewController.userSurname = "Empty"
        }
  }
}
  extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
      2
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      if section == 0 {
        return 1
      }
      
      return self.profession.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
        cell.textLabel?.text = "Section: \(indexPath.section). Row: \(indexPath.row)"
        return cell
      }
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellId", for: indexPath) as? TableViewCell else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath)
        return cell
      }
      let prof = self.profession[indexPath.row]
      cell.setup(indexPath: indexPath, userSurname: prof.userName, userProf: prof.prof, userDescrip: prof.discrip)
      cell.accessoryType = .disclosureIndicator
      return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      self.tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      if indexPath.section == 0 {
        return 20
      }
      
      return UITableView.automaticDimension
      
    }
    
  }

