//
//  Extension.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import UIKit

extension UIViewController{
    func alertTimer(title:String?,mesaj:String?){
        let alert = UIAlertController(title: "", message: mesaj, preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
          alert.dismiss(animated: true, completion: nil)
        }
    }
}



