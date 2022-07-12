//
//  NetworkManagers.swift
//  AppNoticias
//
//  Created by Diego Araújo Borges on 23/06/22.
//

import Foundation

enum resultNewsError: Error {
    case badURL, noData, invalidJSON
}

class NetWorkManager {
   
    static let shared = NetWorkManager()
    
    struct Constans {
        static let newsAPI = URL(string: "https://web-ebac-ios.herokuapp.com/home")
    }
    
    private init() { }

    func getNews(completion: @escaping (Result<[ResultNews], resultNewsError>) -> Void) {
        
        // setup the URL
        guard let url = Constans.newsAPI else {
            completion(.failure(.badURL))
            return
            
        }
        //create a configuration
        let configuration = URLSessionConfiguration.default
        
        configuration.allowsCellularAccess = true
        configuration.allowsExpensiveNetworkAccess = true
        configuration.allowsConstrainedNetworkAccess = true

        //create a session
        let session = URLSession(configuration: configuration)
        
        //create the task
        let task = session.dataTask(with: url) { ( data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ResponseElement.self, from: data)
                completion(.success(result.home.results))
            } catch {
                print ("Error info \(error.localizedDescription)")
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
    
}

