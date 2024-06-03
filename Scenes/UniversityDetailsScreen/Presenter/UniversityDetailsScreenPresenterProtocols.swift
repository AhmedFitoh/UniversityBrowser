//
//  UniversityDetailsScreenPresenterProtocols.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

// VIPER Protocol to the Module
protocol UniversityDetailsScreenDelegate: AnyObject {
    func refreshUniversityList()
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol UniversityDetailsScreenInteractorToPresenterProtocol: AnyObject {
    
}

// VIPER Protocol for communication from View -> Presenter
protocol UniversityDetailsScreenViewToPresenterProtocol: AnyObject {
    func didTapRefreshButton()
    func viewDidLoad()
}
