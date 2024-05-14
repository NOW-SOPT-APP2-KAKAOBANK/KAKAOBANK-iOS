//
//  UIFont+.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

enum FontName {
    case head1, head3
    case head4, head5, head6, head7, body1, body6, subTitle1, subTitle2, caption2, ad1
    case body2
    case body4, number2, body7, body8, caption1
    
    var rawValue: String {
        switch self {
        case .head1, .head3:
            return "Pretendard-Bold"
        case .head4, .head5, .head6, .head7, .body1, .body6, .subTitle1, .subTitle2, .caption2, .ad1:
            return "Pretendard-SemiBold"
        case .body2:
            return "Pretendard-Medium"
        case .body4, .number2,.body7, .body8, .caption1:
            return "Pretendard-Regular"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .head1:
            return 33
        case .head3:
            return 26
        case .head4:
            return 21
        case .head6:
            return 20
        case .head5:
            return 17
        case .head7:
            return 16
        case .body1, .body2, .body4:
            return 15
        case .body6:
            return 14
        case .subTitle1, .number2, .body7:
            return 13
        case .subTitle2, .body8:
            return 12
        case .caption1:
            return 11
        case .caption2:
            return 9
        case .ad1:
            return 5
        }
    }
    
}

extension UIFont {
    
    static func pretendard(_ style: FontName) -> UIFont {
        return UIFont(name: style.rawValue, size: style.size)!
    }
}
