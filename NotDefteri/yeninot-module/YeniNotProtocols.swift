//
//  YeniNotProtocols.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

protocol PresenterToInteractorYeniNoteProtocol{
    func notEkle(not_basligi: String, not_icerik: String, not_date: String, not_type: String)
}

protocol ViewToPresenterYeniNotProtocol{
    var notKayitInteractor:PresenterToInteractorYeniNoteProtocol? {get set}
    func ekle(not_basligi: String, not_icerik: String, not_date: String, not_type: String)
}

protocol PresenterToRouterYeniNotProtocol{
    static func createModule(ref: YeniNotViewController)
}
