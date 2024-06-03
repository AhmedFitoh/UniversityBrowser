//
//  UniversityDetailsScreenWireframe.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import UIKit

class UniversityDetailsScreenWireframe {
    
    // MARK: - Instance Variables
    private weak var viewController: UIViewController!

    // MARK: - Life cycle
    func buildModule(university: University,
                     delegate: UniversityDetailsScreenDelegate? = nil) -> UIViewController {
        let view = UniversityDetailsScreenView()
        viewController = view
        let interactor = UniversityDetailsScreenInteractor()
        let presenter = UniversityDetailsScreenPresenter(university: university,
                                                         wireframe: self,
                                                         view: view,
                                                         interactor: interactor,
                                                         delegate: delegate)
        view.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}

// MARK: - Presenter to Wireframe Protocol
extension UniversityDetailsScreenWireframe: UniversityDetailsScreenPresenterToWireframeProtocol {
    func dismiss() {
        viewController.navigationController?.popViewController(animated: true)
    }
}
