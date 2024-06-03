//
//  CustomError.swift
//  UniversityBrowser
//
//  Created by AhmedFitoh on 6/2/24.
//

import Foundation

final class CustomError: Error, LocalizedError {
    let errorCode: Int
    let localizedDescription: String?

    init(code: Int, description: String?){
        self.errorCode = code
        localizedDescription = description
    }
}

// Add general error
extension CustomError {
    static var generalError: CustomError {
        //TODO :- check error code
        return CustomError(code: 9999, description: "An error occurred\nPlease try again later.")
    }
}
