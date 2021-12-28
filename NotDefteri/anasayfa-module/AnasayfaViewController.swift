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
    
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
        
        configureUI()
        
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.getir()
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
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        addNewNoteButton.layer.cornerRadius = 30
    }
    
}

extension AnasayfaViewController: PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(notlarListesi: Array<Notlar>) {
        self.notlarListesi = notlarListesi
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        notlarListesi = Notlardao().tumNotlariListele()
        tableView.reloadData()
    }
}

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

extension AnasayfaViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(kisi_ad: searchText)
    }
}
