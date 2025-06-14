//
//  ApiNetwork.swift
//  CursoiOS
//
//  Created by PABLO MATEOS on 13/6/25.
//

import Foundation

class ApiNetwork {
    
    struct ApiResponseParser: Codable {
        let response: String
        let results: [SuperheroProps]
    }
    struct SuperheroProps: Codable, Identifiable {
        let id: String
        let name: String
        let image: SuperheroImage
    }
    struct SuperheroImage: Codable {
        let url: String
    }

    func getHeroeByName(name: String) async throws -> ApiResponseParser {
        let url = URL(string:"https://superheroapi.com/api/c7ee1967872600c8c4504a4312f746a2/search/\(name)")!
        var request = URLRequest(url: url)  // URL
        request.httpMethod = "GET"  // HTTPMethod
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
//            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            let apiResponse = try JSONDecoder().decode(ApiResponseParser.self, from: data)
            return apiResponse
        } catch {
            print("ERROR getting data from url \(error)")
            throw error
        }
    }
    
    struct SuperheroDetail: Codable {
        let id: String
        let name: String
        let image: SuperheroImage
        let powerstats: Powerstats
        let biography: Biography
    }
    
    struct Powerstats: Codable {
        let intelligence: String
        let strength: String
        let speed: String
        let durability: String
        let power: String
        let combat: String
    }
    
    struct Biography: Codable {
        let alignment: String
        let publisher: String
        let aliases: [String]
        let fullName: String
        
        enum CodingKeys: String, CodingKey {
            case fullName = "full-name"
            case alignment
            case publisher
            case aliases
        }
    }
    
    func getHeroById(id: String) async throws -> SuperheroDetail {
        let url = URL(string:"https://superheroapi.com/api/c7ee1967872600c8c4504a4312f746a2/\(id)")!
        var request = URLRequest(url: url)  // URL
        request.httpMethod = "GET"  // HTTPMethod
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let apiResponse = try JSONDecoder().decode(SuperheroDetail.self, from: data)
            return apiResponse
        } catch {
            print("ERROR getting data from url \(error)")
            throw error
        }
    }
}
