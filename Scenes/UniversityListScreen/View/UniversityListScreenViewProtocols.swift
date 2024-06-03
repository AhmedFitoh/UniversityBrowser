//
//  UniversityListScreenViewProtocols.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

// VIPER Protocol for communication from Presenter -> View
protocol UniversityListScreenPresenterToViewProtocol: AnyObject {
    func updateUniversityList()
    func displayAlertWith(error: Error)
    func startLoadingIndicator()
    func stopLoadingIndicator()
}
