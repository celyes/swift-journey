//
//  Bundle.swift
//  MoonShot
//
//  Created by Ilyes Chouia on 11/1/2022.
//

import Foundation

extension Bundle {
    
    func decode<T: Codable>(_ file: String) -> T  {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("couldn't locate file \(file)")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("couldn't load data from file \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("couldn't decode data")
        }
        
        return loaded
    }
}
