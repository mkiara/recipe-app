//
//  Extension.swift
//  RecipeApp
//
//  Created by administrator on 13/08/2023.
//

import UIKit



extension UIViewController {
  public func displayError(_ error: Error?, from function: StaticString = #function) {
    guard let error = error else { return }
    print("ⓧ Error in \(function): \(error.localizedDescription)")
    let message = "\(error.localizedDescription)\n\n Ocurred in \(function)"
    let errorAlertController = UIAlertController(
      title: "Error",
      message: message,
      preferredStyle: .alert
    )
    errorAlertController.addAction(UIAlertAction(title: "OK", style: .default))
    present(errorAlertController, animated: true, completion: nil)
  }
}

protocol NavigationBarSetUpProtocol: AnyObject {
    func setNavBar(with title: String)
}

extension NavigationBarSetUpProtocol where Self: UIViewController {
    func setNavBar(with title:String) {
        //    let imgNavBarBg = UIImage(named: "bg")
        self.navigationItem.title = title
        
        
//        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width/5, height: view.frame.height))
//        titleLabel.text = title
//        titleLabel.textColor = UIColor.white
//        titleLabel.font = UIFont.systemFont(ofSize: 18)
//        navigationItem.titleView = titleLabel
//        
//        
//        navigationController?.navigationBar.tintColor = UIColor.white;
//        navigationController?.navigationBar.barTintColor = UIColor(red:0.2431, green:0.2314, blue:0.9333, alpha:1.00000)
//        //UIColor(red: 0.32, green: 0.10, blue: 0.96, alpha: 1.00)
//        navigationController?.navigationBar.isTranslucent = false //supaya color bar tint clear dan buang opacity
//        //    navigationController?.navigationBar.setBackgroundImage(imgNavBarBg, for: .default)
    }
}

