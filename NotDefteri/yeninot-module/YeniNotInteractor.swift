//
//  YeniNotInteractor.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class YeniNotInteractor: PresenterToInteractorYeniNoteProtocol{
    func notEkle(not_basligi: String, not_icerik: String, not_date: String, not_type: String) {
        Notlardao().notEkle(not_basligi: not_basligi, not_icerik: not_icerik, not_date: not_date, not_type: not_type)
    }
}
