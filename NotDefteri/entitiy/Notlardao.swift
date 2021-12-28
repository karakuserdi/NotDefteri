//
//  Notlardao.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class Notlardao{
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("notlarim.db")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    //Tüm notları getirme
    func tumNotlariListele() -> [Notlar]{
        var liste = [Notlar]()
        db?.open()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM notlar", values: nil)
            
            while rs.next(){
                let not = Notlar(
                    not_id: Int(rs.string(forColumn: "not_id"))!,
                    not_basligi: rs.string(forColumn: "not_basligi")!,
                    not_icerik: rs.string(forColumn: "not_icerik")!,
                    not_date: rs.string(forColumn: "not_date")!,
                    not_type: rs.string(forColumn: "not_type")!)
                
                liste.append(not)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
    
    //Not ekleme
    func notEkle(not_basligi:String,not_icerik:String,not_date:String,not_type:String){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO notlar (not_basligi,not_icerik,not_date,not_type) VALUES (?,?,?,?)", values: [not_basligi,not_icerik,not_date,not_type])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    //Not silme
    func notSilme(not_id:Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM notlar WHERE not_id = ?", values: [not_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    //Not güncelle
    func notGuncelle(not_id:Int,not_basligi:String,not_icerik:String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE notlar SET not_basligi = ?,not_icerik = ? WHERE not_id = ?", values: [not_basligi,not_icerik,not_id])
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    //Not Arama
    func notAra(not_basligi:String) -> [Notlar] {
        var liste = [Notlar]()
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM notlar WHERE not_basligi like '%\(not_basligi)%'", values: nil)
            
            while rs.next(){
                let not = Notlar(
                    not_id: Int(rs.string(forColumn: "not_id"))!,
                    not_basligi: rs.string(forColumn: "not_basligi")!,
                    not_icerik: rs.string(forColumn: "not_icerik")!,
                    not_date: rs.string(forColumn: "not_date")!,
                    not_type: rs.string(forColumn: "not_type")!)
                
                liste.append(not)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
    
    
    func notTurleri(not_basligi:String) -> [Notlar] {
        var liste = [Notlar]()
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM notlar WHERE not_basligi like '%\(not_basligi)%'", values: nil)
            
            while rs.next(){
                let not = Notlar(
                    not_id: Int(rs.string(forColumn: "not_id"))!,
                    not_basligi: rs.string(forColumn: "not_basligi")!,
                    not_icerik: rs.string(forColumn: "not_icerik")!,
                    not_date: rs.string(forColumn: "not_date")!,
                    not_type: rs.string(forColumn: "not_type")!)
                
                liste.append(not)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        db?.close()
        
        return liste
    }
    
}
