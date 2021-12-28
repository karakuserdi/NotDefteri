//
//  YeniNotPresenter.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class YeniNotPresenter:ViewToPresenterYeniNotProtocol{
    var notKayitInteractor: PresenterToInteractorYeniNoteProtocol?
    
    func ekle(not_basligi: String, not_icerik: String, not_date: String, not_type: String) {
        notKayitInteractor?.notEkle(not_basligi: not_basligi, not_icerik: not_icerik, not_date: not_date, not_type: not_type)
    }
}
