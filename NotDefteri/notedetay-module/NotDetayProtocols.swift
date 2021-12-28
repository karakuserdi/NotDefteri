//
//  NotDetayProtocols.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

protocol PresenterToInteractorNotDetayProtocol{
    func notGuncelle(not_id:Int, not_basligi:String, not_icerik:String)
    func notSil(not_id:Int)
}

protocol ViewToPresenterNotDetayProtocol{
    var notDetayInteractor: PresenterToInteractorNotDetayProtocol? {get set}
    
    func guncelle(not_id:Int, not_basligi:String, not_icerik:String)
    func sil(not_id:Int)
}

protocol PresenterToRouterNotDetayProtocol{
    static func createModule(ref: NotDetayViewController)
}
