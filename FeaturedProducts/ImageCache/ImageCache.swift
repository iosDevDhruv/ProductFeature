//
//  ImageCache.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 22/11/23.
//

 import Foundation

public protocol ImageCache{
     func getImage(for url: String) -> Data?
     func setImage(_ data: Data, for url: String)
}
