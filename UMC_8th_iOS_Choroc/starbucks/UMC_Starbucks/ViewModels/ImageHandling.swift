//
//  ImageHandling.swift
//  UMC_Starbucks
//
//  Created by 이채은 on 4/29/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
