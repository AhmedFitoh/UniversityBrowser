//
//  UniversityDetailsScreenInteractor.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

import Foundation

class UniversityDetailsScreenInteractor {
    
    // MARK: - VIPER Stack
    weak var presenter: UniversityDetailsScreenInteractorToPresenterProtocol!
    
}

// MARK: - Presenter To Interactor Protocol
extension UniversityDetailsScreenInteractor: UniversityDetailsScreenPresenterToInteractorProtocol {
    
}
