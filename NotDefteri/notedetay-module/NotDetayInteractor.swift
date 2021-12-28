//
//  NotDetayInteractor.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class NotDetayInteractor: PresenterToInteractorNotDetayProtocol{
    func notGuncelle(not_id: Int, not_basligi: String, not_icerik: String) {
        Notlardao().notGuncelle(not_id: not_id, not_basligi: not_basligi, not_icerik: not_icerik)
    }
    
    func notSil(not_id: Int) {
        Notlardao().notSilme(not_id: not_id)
    }
}
