//
//  Image+Extension.swift
//  Backdrop
//
//  Created by Joe Blau on 7/1/21.
//

import CoreImage
import CoreML
import UIKit
import CoreMLHelpers

enum RemoveBackroundResult {
    case background
    case finalImage
}

extension UIImage {

    func removeBackground(returnResult: RemoveBackroundResult) -> UIImage? {
        guard let model = getDeepLabV3Model() else { return nil }
        let width: CGFloat = 513
        let height: CGFloat = 513
        let resizedImage = resized(to: CGSize(width: height, height: height), scale: 1)
        guard let pixelBuffer = resizedImage.pixelBuffer(width: Int(width), height: Int(height)),
        let outputPredictionImage = try? model.prediction(image: pixelBuffer),
        let outputImage = outputPredictionImage.semanticPredictions.image(min: 0, max: 1, axes: (0, 0, 1)),
        let outputCIImage = CIImage(image: outputImage),
        let maskImage = outputCIImage.removeWhitePixels(),
        let maskBlurImage = maskImage.applyBlurEffect() else { return nil }

        switch returnResult {
        case .finalImage:
            guard let resizedCIImage = CIImage(image: resizedImage),
                  let compositedImage = resizedCIImage.composite(with: maskBlurImage) else { return nil }
            let finalImage = UIImage(ciImage: compositedImage)
                .resized(to: CGSize(width: size.width, height: size.height))
            return finalImage
        case .background:
            let finalImage = UIImage(
                ciImage: maskBlurImage,
                scale: scale,
                orientation: self.imageOrientation
            ).resized(to: CGSize(width: size.width, height: size.height))
            return finalImage
        }
    }

    private func getDeepLabV3Model() -> DeepLabV3? {
        do {
            let config = MLModelConfiguration()
            return try DeepLabV3(configuration: config)
        } catch {
//            log("Error loading model: \(error)")
            return nil
        }
    }
    
//    func isEqualToImage(image: UIImage) -> Bool {
//        let data1 = NSData(data: self.pngData()!)
//        let data2 = NSData(data: image.pngData()!)
//        return data1.isEqual(data2)
//    }

}