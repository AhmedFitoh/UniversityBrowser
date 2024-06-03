//
//  UniversityDetailsScreenViewProtocols.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol UniversityDetailsScreenPresenterToViewProtocol: AnyObject {
    func populateUniversityInformation(_ university: University)
}
