//
//  Notlar.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 27.12.2021.
//

import Foundation

class Notlar{
    var not_id:Int?
    var not_basligi:String?
    var not_icerik:String?
    var not_date:String?
    var not_type:String?
    
    init(){}
    
    init(not_id:Int,not_basligi:String,not_icerik:String,not_date:String,not_type:String){
        self.not_id = not_id
        self.not_basligi = not_basligi
        self.not_icerik = not_icerik
        self.not_date = not_date
        self.not_type = not_type
    }
}
