//
//  ConfigurationManager.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

class ConfigurationManager {
    static let shared = ConfigurationManager()
    
    private init(){ }
    private var configurations: [String:String]? {
        do {
            guard let url = Bundle.main.url(forResource: "Configuration", withExtension: "plist"),
                  let dictionary = try NSDictionary(contentsOf: url, error: errorHandler()) as? [String:String] else {
                return nil
            }
            return dictionary
        } catch {
            fatalError("Failed to initialize a dictionary that contails the dictionary at url")
        }
    }
    
    var bookSearchAPIRequestURL: String? {
        guard let configurations = configurations,
              let urlString = configurations["BookSearchAPIRequestURL"] else {
            return nil
        }
        return urlString
    }
    
    var clientID: String? {
        guard let configurations = configurations,
              let clientID = configurations["ClientID"] else {
            return nil
        }
        return clientID
    }
    
    var clientSecret: String? {
        guard let configurations = configurations,
              let clientSecret = configurations["ClientSecret"] else {
            return nil
        }
        return clientSecret
    }
}

extension ConfigurationManager {
    private func errorHandler() throws {
        // TODO: - error Handler 구현
        print("errorHandler")
    }
}
