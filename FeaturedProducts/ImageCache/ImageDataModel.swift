//
//  ImageDataModel.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 23/11/23.
//

import Foundation
import RealmSwift

@MainActor final class ImageData: Object {
   @Persisted(primaryKey: true) var imageURL: String
   @Persisted var data: Data

   convenience init(imageURL: String, data: Data) {
       self.init()
       self.imageURL = imageURL
       self.data = data
   }
}
