//
//  BreakfastModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-03.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

var jsonArray: [[String: Any]] = []
let semaphore = DispatchSemaphore (value: 0)

 var parameters1 = "{\r\n  \r\n \"Like\": true\r\n}"
var postData = parameters1.data(using: .utf8)

func getAllBreakfast(completion: @escaping ([[String: Any]]?) -> Void){
    
    //let semaphore = DispatchSemaphore (value: 0)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/getAllBreakfasts")!,timeoutInterval: Double.infinity)
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
            jsonArray = json as! [[String : Any]]
            completion(jsonArray)
          
        } catch {
         print("Error while parsing JSON: \(error)")
            completion(nil)
       }
        
    }

    task.resume()
    semaphore.wait()
}

func UpdateBreakfast(number: Int){


    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Breakfast/\(number)")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "PATCH"
    request.httpBody = postData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

    
}

func UpdateUnlikeBreakfast(number: Int){

    let para = "{\r\n  \r\n \"Like\": false\r\n}"
    let unlikeData = para.data(using: .utf8)

    var request = URLRequest(url: URL(string: "http://localhost:3000/api/Breakfast/\(number)")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "PATCH"
    request.httpBody = unlikeData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      print(String(data: data, encoding: .utf8)!)
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

    
}
