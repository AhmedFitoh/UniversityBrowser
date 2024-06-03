//
//  EndPoints.swift
//  UniversityBrowser
//
//  Created by AhmedFitoh on 6/2/24.
//

import Foundation

struct BaseUrls{
    static let defaultURL = "http://universities.hipolabs.com/"
}
//http://universities.hipolabs.com/search?country=United%20Arab%20Emirates

enum EndPoints{
    case searchIn(country: String)
}

extension EndPoints{
    fileprivate var path: String{
        switch self {
            case .searchIn(let country):
                return  "search?country=\(country)"
        }
    }
    
    var httpMethod: String{
        switch self {
            case .searchIn:
                return "GET"
        }
    }
    
    var url: String{
        switch self {
            case .searchIn:
                return BaseUrls.defaultURL + path
        }
    }
}


