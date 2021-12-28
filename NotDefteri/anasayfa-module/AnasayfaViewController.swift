//
//  AnasayfaViewController.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 27.12.2021.
//

import UIKit

class AnasayfaViewController: UIViewController {

    var notlarListesi = [Notlar]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addNewNoteButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        configureUI()
        
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.getir()
    }
    
    //sayfa tekrar çağırıldığında veriler tekrar yükleniyor ve tablo yenileniyor
    override func viewWillAppear(_ animated: Bool) {
        segmentedControl.selectedSegmentIndex = 0
        anasayfaPresenterNesnesi?.getir()
        tableView.reloadData()
    }

    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "notlarim", ofType: ".db")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("notlarim.db")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı zaten var. Kopyalamaya gerek yok")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{
                print(error)
            }
        }
    }
    
    func configureUI(){
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Ara", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        addNewNoteButton.layer.cornerRadius = 30
    }
    
    //MARK: - SegmentedControlAction
    @IBAction func segmentedControlAction(_ sender: Any) {
        switch (segmentedControl.selectedSegmentIndex) {
        case 0:
            anasayfaPresenterNesnesi?.getir()
        case 1:
            anasayfaPresenterNesnesi?.turler(not_type: "Yapılacaklar")
        case 2:
            anasayfaPresenterNesnesi?.turler(not_type: "Önemli")
        default:
            anasayfaPresenterNesnesi?.turler(not_type: "Önemsiz")
        }
        tableView.reloadData()
    }
    
}

//MARK: - PresenterToViewAnasayfaProtocol
extension AnasayfaViewController: PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(notlarListesi: Array<Notlar>) {
        self.notlarListesi = notlarListesi
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension AnasayfaViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlarListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notCell", for: indexPath) as! NotTableViewCell
        
        let not = notlarListesi[indexPath.row]
        
        cell.notTypeLabel.text = not.not_type
        cell.notBasligiLabel.text = not.not_basligi
        cell.notTarihLabel.text = not.not_date
        cell.notIcerikLabel.text = not.not_icerik
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let not = notlarListesi[indexPath.row]
        performSegue(withIdentifier: "toNotum", sender: not)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNotum"{
            let gidilecekVC = segue.destination as! NotDetayViewController
            let not = sender as? Notlar
            gidilecekVC.not = not
        }
    }
}

//MARK: - UISearchBarDelegate
extension AnasayfaViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(not_basligi: searchText.lowercased())
    }
}
