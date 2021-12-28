//
//  YeniNotViewController.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import UIKit

class YeniNotViewController: UIViewController {
    
    var types = [String]()
    
    @IBOutlet weak var tarihTextField: UITextField!
    @IBOutlet weak var notTuruTextField: UITextField!
    @IBOutlet weak var notBaslikTextField: UITextField!
    @IBOutlet weak var notIcerikTextView: UITextView!
    @IBOutlet weak var kaydetButton: UIButton!
    
    var datePicker:UIDatePicker?
    var pickerView:UIPickerView?
    
    var yenikayitPresenterNesnesi: ViewToPresenterYeniNotProtocol?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        YeniNotRouter.createModule(ref: self)
        
        configurePickers()
        
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMethod))
        view.addGestureRecognizer(dokunmaAlgilama)
    }
    
    //MARK: - Helpers
    func configurePickers(){
        types = ["Tür Seçiniz","Yapılacaklar","Önemli","Önemsiz"]
        
        notTuruTextField.text = "Tür Seçiniz"
        
        pickerView = UIPickerView()
        notTuruTextField.inputView = pickerView
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tarihTextField.inputView = datePicker
        datePicker?.addTarget(self, action: #selector(tarihGoster), for: .valueChanged)
        
        let today = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let gunumuz = formatter.string(from: today)
        tarihTextField.text = gunumuz
    }
    
    
    @objc func dokunmaAlgilamaMethod(){
        view.endEditing(true)
    }
    
    @objc func tarihGoster(datePicker:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let alinanTarih = dateFormatter.string(from: datePicker.date)
        tarihTextField.text = alinanTarih
        
    }
    
    //MARK: - Actions
    @IBAction func kaydetButtonPressed(_ sender: Any) {
        if notTuruTextField.text == types[0]{
            alertTimer(title: "", mesaj: "Lütfen not türü seçiniz")
        }else{
            if !(notBaslikTextField.text!.isEmpty){
                if let tarih = tarihTextField.text, let tur = notTuruTextField.text, let baslik = notBaslikTextField.text, let icerik = notIcerikTextView.text {
                    yenikayitPresenterNesnesi?.ekle(not_basligi: baslik, not_icerik: icerik, not_date: tarih, not_type: tur)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}


//MARK: - UIPickerViewDelegate,UIPickerViewDataSource
extension YeniNotViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        notTuruTextField.text = types[row]
    }
}
