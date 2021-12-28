//
//  AnasayfaInteractor.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumNotlariGetir() {
        var notlarListesi = [Notlar]()
        notlarListesi = Notlardao().tumNotlariListele()
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: notlarListesi)
    }
    
    func notlardaAra(not_basligi: String) {
        var notListesi = [Notlar]()
        notListesi = Notlardao().notAra(not_basligi: not_basligi)
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: notListesi)
    }
    func notTurleri(not_type: String) {
        var notListesi = [Notlar]()
        notListesi = Notlardao().notTurleri(not_type: not_type)
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: notListesi)
    }
}
