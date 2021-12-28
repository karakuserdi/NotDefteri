//
//  YeniNotRouter.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class YeniNotRouter: PresenterToRouterYeniNotProtocol{
    static func createModule(ref: YeniNotViewController) {
        ref.yenikayitPresenterNesnesi = YeniNotPresenter()
        ref.yenikayitPresenterNesnesi?.notKayitInteractor = YeniNotInteractor()
    }
}
