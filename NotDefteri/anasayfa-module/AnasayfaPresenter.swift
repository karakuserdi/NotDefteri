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
    
    func ara(not_basligi: String) {
        anasayfaInteractor?.notlardaAra(not_basligi: not_basligi)
    }
    func turler(not_type: String) {
        anasayfaInteractor?.notTurleri(not_type: not_type)
    }
    
}

extension AnasayfaPresenter: InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(notlarListesi: Array<Notlar>) {
        anasayfaView?.vieweVeriGonder(notlarListesi: notlarListesi)
    }
}
