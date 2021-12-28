//
//  AnasayfaProtocols.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol? {get set}
    func tumNotlariGetir()
    func notlardaAra(kisi_ad:String)
}

protocol ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView: PresenterToViewAnasayfaProtocol? {get set}
    
    func getir()
    func ara(kisi_ad:String)
}

protocol InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(notlarListesi: Array<Notlar>)
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(notlarListesi: Array<Notlar>)
}

protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaViewController)
}
