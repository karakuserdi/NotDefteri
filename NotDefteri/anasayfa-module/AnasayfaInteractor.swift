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
    
    func notlardaAra(kisi_ad: String) {
        var notListesi = [Notlar]()
        notListesi = Notlardao().notAra(not_basligi: kisi_ad)
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: notListesi)
    }
}
