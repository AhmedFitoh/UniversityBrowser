//
//  University.swift
//
//  Created by AhmedFitoh on 6/2/24.
//

import RealmSwift

class University: Object, Codable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var name: String = ""
    @Persisted var country: String = ""
    @Persisted var stateProvince: String?
    @Persisted var alphaTwoCode: String = ""
    @Persisted var webPages: List<String> = List<String>()
    @Persisted var domains: List<String> = List<String>()
    
    enum CodingKeys: String, CodingKey {
        case name
        case country
        case stateProvince = "state-province"
        case domains
        case webPages = "web_pages"
        case alphaTwoCode = "alpha_two_code"
    }
}

