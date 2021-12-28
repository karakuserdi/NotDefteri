//
//  AnasayfaPresenter.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class AnasayfaPresenter:ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func getir() {
        anasayfaInteractor?.tumNotlariGetir()
    }
    
    func ara(kisi_ad: String) {
        anasayfaInteractor?.notlardaAra(kisi_ad: kisi_ad)
    }
    
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(notlarListesi: Array<Notlar>) {
        anasayfaView?.vieweVeriGonder(notlarListesi: notlarListesi)
    }
}
