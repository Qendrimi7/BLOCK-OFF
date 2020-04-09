//
//  Decodable+.swift
//  FoursquareApp
//
//  Created by Qendrim Mjeku on 12/1/19.
//  Copyright © 2019 Qëndrim Mjeku. All rights reserved.
//

import Foundation

extension Decodable {

    static func fromJSON<T:Decodable>(_ fileName: String, fileExtension: String = "json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }

        let data = try Data(contentsOf: url)

        return try JSONDecoder().decode(T.self, from: data)
    }
}
