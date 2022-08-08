//
//  NetworkManager.swift
//  HomeWorkFor3.02Lesson
//
//  Created by Федор Еронин on 08.08.2022.
//

import Foundation

class NetworkManager {
    
    static func getHeroes(completion: @escaping (_ heroes: [Hero]) -> Void) {
        
        var heroes: [Hero] = []
        
        guard let url = URL(string: "https://api.opendota.com/api/constants/heroes")
        else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                let heroesDict = try decoder.decode([String: Hero].self, from: data)
                for (_, hero) in heroesDict {
                    heroes.append(hero)
                }
                heroes.sort { $0.localizedName < $1.localizedName }
                DispatchQueue.main.async {
                    completion(heroes)
                }
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}
