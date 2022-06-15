//
//  Icon.swift
//  Twitter
//
//  Created by kmjmarine on 2022/06/15.
//

import UIKit

enum Icon {
    case message
    case share
    case like
    case write
    
    var image: UIImage? {
        let systemName: String
        
        switch self {
        case .message: return UIImage(systemName: "message")
        case .share: return UIImage(systemName: "square.and.arrow.up")
        case .like: return UIImage(systemName: "heart")
        case .write: return UIImage(systemName: "square.and.pencil")
        }
        
        return UIImage(systemName: systemName)
    }
}
