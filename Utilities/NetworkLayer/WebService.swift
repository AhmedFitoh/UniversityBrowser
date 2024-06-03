//
//  WebService.swift
//  UniversityBrowser
//
//  Created by AhmedFitoh on 6/2/24.
//

import Foundation

protocol NetworkingProtocol: AnyObject {
    func request(_ api: EndPoints,
                 completion: @escaping (Data?)-> Void,
                 failure: @escaping (Error?)-> Void)
}

class WebService: NetworkingProtocol {

    // TODO:- add support to http body when needed
    func request(_ api: EndPoints,
                 completion: @escaping (Data?)-> Void,
                 failure: @escaping (Error?)-> Void){
        guard let url = URL(string: api.url) else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.httpMethod
        URLSession.shared.dataTask(with: urlRequest) { (data, urlResponse, error) in
            // Return to the main thread
            DispatchQueue.main.async {
                if let error = error{
                    failure(error)
                } else if let data = data{
                    completion(data)
                }
            }
        }.resume()
    }
}
