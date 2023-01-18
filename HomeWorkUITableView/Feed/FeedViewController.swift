//
//  FeedViewController.swift
//  HomeWorkUITableView
//
//  Created by Денис Шишкин on 15.01.2023.
//

import UIKit


class FeedViewController: UIViewController {
  
  private var postTitle: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.setupNavBar()
  }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard
      segue.identifier == "DetailDescripViewController",
      let detailDescripViewController = segue.destination as? DetailDescripViewController,
      let selectedCell = sender as? DescripViewCell
    else { return }
  }
  
  let postTitle: String
  if let selectedCellNumber = selectedCell.indexPath {
      postTitle = "Post number is \(selectedCellNumber)"
  } else {
      postTitle = "Some Post"
  }
  detailViewController.postTitle = postTitle

//private func setupNavBar() {
//    self.navigationController?.navigationBar.tintColor = .black
//  }
    func collectionView(_ collectionView: UITableViewCell, cellForItemAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCellId", for: indexPath) as? PostCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCellId", for: indexPath)
            return cell
        }
        
        cell.indexPath = indexPath
        return cell
    }
}

