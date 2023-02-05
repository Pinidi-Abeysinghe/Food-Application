//
//  ObjectModel.swift
//  Food Receip App
//
//  Created by Sahan Ruwanga on 2023-02-04.
//

import Foundation
class ObjectModel: Decodable {
    let Like: Int
    let Code: Int
    let Breakfast: ReceipyModel
    let __v: Int
    let _id: String
    
    init(Like: Int, Code: Int, _v: Int, _id: String, Breakfast: ReceipyModel) {
        self.Like = Like
        self.Code = Code
        self.__v = _v
        self._id = _id
        self.Breakfast = Breakfast
      }
    
}
