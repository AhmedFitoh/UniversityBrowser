//
//  UniversityListScreenWireframe.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import UIKit

class UniversityListScreenWireframe {
    
    // MARK: - Instance Variables
    private weak var viewController: UIViewController!
    
    // MARK: - Life cycle
    func buildModule(delegate: UniversityListScreenDelegate? = nil) -> UIViewController {
        let view = UniversityListScreenView()
        viewController = view
        let interactor = UniversityListScreenInteractor()
        let presenter = UniversityListScreenPresenter(wireframe: self,
                                                      view: view,
                                                      interactor: interactor,
                                                      delegate: delegate)
        view.presenter = presenter
        interactor.presenter = presenter
        return viewController
    }
}

// MARK: - Presenter to Wireframe Protocol
extension UniversityListScreenWireframe: UniversityListScreenPresenterToWireframeProtocol {
    func navigateToDetailsScreenWith(university: University,
                                     delegate: UniversityDetailsScreenDelegate) {
        let detailsViewController = UniversityDetailsScreenWireframe().buildModule(university: university, delegate: delegate)
        self.viewController.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}
