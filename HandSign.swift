//
//  File.swift
//  
//
//  Created by Darren Thiores on 19/02/24.
//

import Foundation
import SwiftUI

enum HandSign: String {
    case A = "Managing Pressure"
    case B = "Responding to Criticism"
    case C = "Processing Rejection"
    
    static let allValues = [A, B, C]
}

extension HandSign {
    func getImage() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}
