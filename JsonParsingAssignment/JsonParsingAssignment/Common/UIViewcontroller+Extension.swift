//
//  UIViewcontroller+Extension.swift
//  JsonParsingAssignment

import UIKit

extension UIViewController {
    func showAlert() {
        let alert = UIAlertController(title: Constants.alertTitle,
                                      message: Constants.errorMsg,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.okTitle,
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

