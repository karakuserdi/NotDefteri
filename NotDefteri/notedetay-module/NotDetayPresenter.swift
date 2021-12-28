//
//  NotDetayPresenter.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class NotDetayPresenter: ViewToPresenterNotDetayProtocol{
    var notDetayInteractor: PresenterToInteractorNotDetayProtocol?
    
    func guncelle(not_id: Int, not_basligi: String, not_icerik: String) {
        notDetayInteractor?.notGuncelle(not_id: not_id, not_basligi: not_basligi, not_icerik: not_icerik)
    }
    
    func sil(not_id: Int) {
        notDetayInteractor?.notSil(not_id: not_id)
    }
    
    
}
