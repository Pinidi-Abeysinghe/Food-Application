//
//  ReceipyModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-04.
//

import Foundation
class ReceipyModel: Decodable {
    let Name: String
    let Details: String
    let Image: String
    let Video: String
    
    init(Name: String, Details: String, Image: String, Video: String) {
        self.Name = Name
        self.Details = Details
        self.Image = Image
        self.Video = Video
      }
    
}
