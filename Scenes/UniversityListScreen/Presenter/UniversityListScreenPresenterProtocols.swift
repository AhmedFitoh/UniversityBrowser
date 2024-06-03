//
//  UniversityListScreenPresenterProtocols.swift
//
//  Created by AhmedFitoh on 6/2/24.
//  
//

// VIPER Protocol to the Module
protocol UniversityListScreenDelegate: AnyObject {
    func updateUniversityList()
}

// VIPER Protocol for communication from Interactor -> Presenter
protocol UniversityListScreenInteractorToPresenterProtocol: AnyObject {
      func fetchUniversityListSuccess(list: [University])
      func fetchUniversityListError(error: Error)
}

// VIPER Protocol for communication from View -> Presenter
protocol UniversityListScreenViewToPresenterProtocol: AnyObject {
    var universityList: [University] {get}
    func viewDidLoad()
    func didSelectUniversity(at index: Int)
}
