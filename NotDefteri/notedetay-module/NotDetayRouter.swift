//
//  NotDetayRouter.swift
//  NotDefteri
//
//  Created by Riza Erdi Karakus on 28.12.2021.
//

import Foundation

class NotDetayRouter: PresenterToRouterNotDetayProtocol{
    static func createModule(ref: NotDetayViewController) {
        ref.notDetayPresenterNesnesi = NotDetayPresenter()
        ref.notDetayPresenterNesnesi?.notDetayInteractor = NotDetayInteractor()
    }
}
