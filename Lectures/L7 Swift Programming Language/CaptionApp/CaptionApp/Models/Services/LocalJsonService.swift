//
//  LocalJsonService.swift
//  CaptionApp-Lecture-06
//
//  Created by Rebecca  Slatkin on 1/29/20.
//  Copyright © 2020 Syracuse University. All rights reserved.
//

import Foundation

class LocalJsonService {
    static func readJSON(from fileName: String) throws -> [Caption] {
        let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Object does not exist"])

        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
//            let fileUrl = URL(fileURLWithPath: path)
                // Getting data from JSON file using the file URL
//            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            
            guard  let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: []) else {
                throw error
                
            }


            do {
                let officeCodable = try JSONDecoder().decode(TheOfficeCodable.self, from: data)
                print(officeCodable)
                return officeCodable.captions
            } catch let error{
                debugPrint(error)
//                print(error.localizedDescription)
            }
            
//            guard let theOfficeCodable = try? JSONDecoder().decode(TheOfficeCodable.self, from: data) else {
//                throw error
//            }
//            return theOfficeCodable.captions
        }
        throw error
    
    }
}
