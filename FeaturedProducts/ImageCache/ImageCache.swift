//
//  ImageCache.swift
//  ProductFeature
//
//  Created by Dhruv Jaiswal on 22/11/23.
//

 import Foundation

 public final class ImageCache {

    private var cache: [String: Data] = [:]
    private var store: ProductStore

     public init(store: ProductStore) async {
        self.store = store
        await loadImages()
    }

    private func loadImages() async {
            let images: [ImageData] = await store.get()
            for image in images {
                await cache[image.imageURL] = image.data
            }
        }

   public func getImage(for url: String) -> Data? {
        return cache[url]
    }

   public func setImage(_ data: Data, for url: String) {
        cache[url] = data
        Task {
           await store.save(object: ImageData(imageURL: url, data: data))
        }
    }
 }
