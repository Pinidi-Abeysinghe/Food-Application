//
//  FavouriteModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-05.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

var FavbreakArray: [[String: Any]] = []
var FavlunArray: [[String: Any]] = []
var FavdinnerArray: [[String: Any]] = []
var InputrecipArray: [[String: Any]] = []

func getAllFavBreakfast(completion: @escaping ([[String: Any]]?) -> Void){
    
    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Breakfasts/Liked")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        completion(nil)
        return
      }
      semaphore.signal()

      
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) //as! [String : Any]
            FavbreakArray = json as! [[String : Any]]
            completion(FavbreakArray)
          
        } catch {
         print("Error while parsing JSON: \(error)")
            completion(nil)
       }
        
    }

    task.resume()
    semaphore.wait()
}

func getAllFavLunch(completion: @escaping ([[String: Any]]?) -> Void){
    
    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Lunches/Liked")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        completion(nil)
        return
      }
      semaphore.signal()

      
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) //as! [String : Any]
            FavlunArray = json as! [[String : Any]]
            completion(FavlunArray)
          
        } catch {
         print("Error while parsing JSON: \(error)")
            completion(nil)
       }
        
    }

    task.resume()
    semaphore.wait()
}

func getAllFavDinner(completion: @escaping ([[String: Any]]?) -> Void){
    
    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Dinners/Liked")!,timeoutInterval: Double.infinity)
    request.httpMethod = "GET"

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        completion(nil)
        return
      }
      semaphore.signal()

      
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: []) //as! [String : Any]
            FavdinnerArray = json as! [[String : Any]]
            completion(FavdinnerArray)
          
        } catch {
         print("Error while parsing JSON: \(error)")
            completion(nil)
       }
        
    }

    task.resume()
    semaphore.wait()
}
