//
//  UserModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-05.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

var token: [[String:Any]] = []
var nsArray:NSArray = []
var jsonString: String = ""

func getLogin(username: String, password: String){
    let param = "{\r\n    \"email\": \"\(username)\",\r\n    \"password\": \"\(password)\"\r\n}"
    let postData = param.data(using: .utf8)

    var request = URLRequest(url: URL(string: "http://localhost:3000/user/login")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = postData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
      jsonString = String(data: data, encoding: .utf8)!
      semaphore.signal()
    }
    task.resume()
    semaphore.wait()
}

func getEnroll(email: String, username: String, password: String){
    let body = "{\r\n    \"username\": \"\(username)\",\r\n    \"email\": \"\(email)\",\r\n    \"password\": \"\(password)\"\r\n}"
    let reqData = body.data(using: .utf8)

    var request = URLRequest(url: URL(string: "http://localhost:3000/user/signup")!,timeoutInterval: Double.infinity)
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")

    request.httpMethod = "POST"
    request.httpBody = reqData

    let task = URLSession.shared.dataTask(with: request) { data, response, error in
      guard let data = data else {
        print(String(describing: error))
        semaphore.signal()
        return
      }
        jsonString = String(data: data, encoding: .utf8)!
      //print(String(data: data, encoding: .utf8)!)
       
      semaphore.signal()
    }

    task.resume()
    semaphore.wait()

}
