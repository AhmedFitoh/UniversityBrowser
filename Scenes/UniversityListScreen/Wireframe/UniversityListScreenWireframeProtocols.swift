//
//  UniversityListScreenWireframeProtocols.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

// VIPER Protocol for communication from Presenter -> Wireframe
protocol UniversityListScreenPresenterToWireframeProtocol: AnyObject {
    func navigateToDetailsScreenWith(university: University, delegate: UniversityDetailsScreenDelegate)
}
