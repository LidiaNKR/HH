//
//  APIURL.swift
//  hh
//
//  Created by Лидия Некрасова on 15.03.2024.
//

import Foundation

enum APIConstant {
    static let baseURL: String = "https://run.mocky.io/v3/"
    static let accessKey: String = "ed41d10e-0c1f-4439-94fa-9702c9d95c14"
}

/// Ссылка моки JSON API
enum APIURL {
    static var url: URL? {
        let baseURL = APIConstant.baseURL
        let asccessKey = APIConstant.accessKey
        
        let url = baseURL + asccessKey
        
        return URL(string: url)
    }
}
