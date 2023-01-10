//
//  NetworkManager.swift
//  The Sports App
//
//  Created by Richa Kalani on 09/01/23.
//

import Foundation

class SportsManagerNetwork {
    
    let url = "https://demo.sportz.io/nzin01312019187360.json"
       
    func getData(completion: @escaping(TopLevel) -> ()) {
        guard let url = URL(string: url) else {
            fatalError()
        }
        
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard let data = data else {return}
            
            do {
                let team = try JSONDecoder().decode(TopLevel.self, from: data)
                completion(team)
            } catch {
                print(error)
            }
        }).resume()
    }
}
