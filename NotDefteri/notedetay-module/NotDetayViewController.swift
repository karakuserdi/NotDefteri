//
//  NotDetayViewController.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import UIKit

class NotDetayViewController: UIViewController {
    
    var not:Notlar?
    var notDetayPresenterNesnesi:ViewToPresenterNotDetayProtocol?
    
    @IBOutlet weak var tarihTextField: UITextField!
    @IBOutlet weak var notTuruTextField: UITextField!
    @IBOutlet weak var notBaslikTextField: UITextField!
    @IBOutlet weak var notIcerikTextView: UITextView!
    @IBOutlet weak var guncelleButton: UIButton!
    @IBOutlet weak var silButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotDetayRouter.createModule(ref: self)
        
        if let not = not {
            tarihTextField.text = not.not_date
            notBaslikTextField.text = not.not_basligi
            notIcerikTextView.text = not.not_icerik
            notTuruTextField.text = not.not_type ?? "Boş"
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func guncelleButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Notunuz güncellendi", preferredStyle: .alert)
        
        if !(notBaslikTextField.text!.isEmpty){
            if let baslik = notBaslikTextField.text, let icerik = notIcerikTextView.text ,let not = not{
                self.notDetayPresenterNesnesi?.guncelle(not_id: not.not_id!, not_basligi: baslik, not_icerik: icerik)
                
                self.present(alert, animated: true, completion: nil)
                //aler will dismiss in 1 secons
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                  alert.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func silButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "", message: "Notu silmek istediğinize emin misiniz?", preferredStyle: .alert)
        
        let actionEvet = UIAlertAction(title: "Evet", style: .destructive) { action in
            if let not = self.not{
                self.notDetayPresenterNesnesi?.sil(not_id: not.not_id!)
                self.navigationController?.popViewController(animated: true)
            }
        }
        let actionHayir = UIAlertAction(title: "Hayır", style: .cancel, handler: nil)
        
        alert.addAction(actionEvet)
        alert.addAction(actionHayir)
        
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
}
