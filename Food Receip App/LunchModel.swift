//
//  LunchModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-04.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

var lunchArray: [[String: Any]] = []

 var parameters2 = "{\r\n  \r\n \"Like\": true\r\n}"
let postData1 = parameters2.data(using: .utf8)

func getAllLunch(completion: @escaping ([[String: Any]]?) -> Void){
    
    let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/getAllLunch")!,timeoutInterval: Double.infinity)
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
            lunchArray = json as! [[String : Any]]
            completion(lunchArray)
          
        } catch {
         print("Error while parsing JSON: \(error)")
            completion(nil)
       }
        
    }
    task.resume()
    semaphore.wait()
}

func UpdateLunch(number: Int){


    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Lunch/\(number)")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "PATCH"
    request.httpBody = postData1

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

    
}

func UpdateUnlikeLunch(number: Int){

    let para = "{\r\n  \r\n \"Like\": false\r\n}"
    let unlikeData = para.data(using: .utf8)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Lunch/\(number)")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "PATCH"
    request.httpBody = unlikeData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

    
}
