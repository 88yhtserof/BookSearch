//
//  ImageLoader.swift
//  SearchBook
//
//  Created by 임윤휘 on 8/5/24.
//

import Foundation
import UIKit

struct ImageLoader {
    
    /// Load a Image from URL and return a UIImage.
    func loadImage(from url: URL) async throws -> UIImage {
        let (data, reponse) = try await URLSession.shared.data(from: url)
        guard let httpResponse = reponse as? HTTPURLResponse,
                httpResponse.statusCode == 200 else {
            throw ImageLoadError.invalidURL
        }
        
        guard let image = UIImage(data: data) else {
            throw ImageLoadError.imageLoadFailed
        }
        return image
    }
}

enum ImageLoadError: Error {
    case invalidURL
    case imageLoadFailed
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "the URL is invalid"
        case .imageLoadFailed:
            return "Failed to load image"
        }
    }
}

