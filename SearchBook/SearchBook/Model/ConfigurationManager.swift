//
//  ConfigurationManager.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/12/24.
//

import Foundation

final class ConfigurationManager {
    
    static let shared = ConfigurationManager()
    
    private var configurations: [String:String]?
    
    private init(){
        loadConfigurations()
    }
    
    //MARK: - Public Properties
    
    public var bookSearchAPIRequestURL: String? {
        guard let configurations = configurations,
              let urlString = configurations["BookSearchAPIRequestURL"] else {
            return nil
        }
        return urlString
    }
    
    public var clientID: String? {
        guard let configurations = configurations,
              let clientID = configurations["ClientID"] else {
            return nil
        }
        return clientID
    }
    
    public var clientSecret: String? {
        guard let configurations = configurations,
              let clientSecret = configurations["ClientSecret"] else {
            return nil
        }
        return clientSecret
    }
}

//MARK: - Private Method
extension ConfigurationManager {
    
    private func loadConfigurations() {
        do {
            guard let url = Bundle.main.url(forResource: "Configuration", withExtension: "plist") else { return }
            configurations = try NSDictionary(contentsOf: url, error: errorHandler()) as? [String: String]
        } catch {
            fatalError("Failed to initialize a dictionary that contails the dictionary at url")
        }
    }
    
    private func errorHandler() throws {
        // TODO: - error Handler 구현
        print("errorHandler")
    }
}
