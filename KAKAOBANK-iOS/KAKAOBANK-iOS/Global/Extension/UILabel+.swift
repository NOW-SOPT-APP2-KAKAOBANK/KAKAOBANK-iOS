//
//  UILabel+.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/13/24.
//

import UIKit

extension UILabel {
    
    static func attributedText(for fontName: FontName, withText text: String) -> NSAttributedString? {
        let tracking: CGFloat
        
        switch fontName {
        case .head1, .head3, .head4, .head5, .body2, .number2, .subTitle2, .caption1, .caption2, .ad1:
            tracking = 0
        case .body1, .body4, .subTitle1, .body6,.body7, .body8:
            tracking = 0.03 * fontName.size
        }
        
        let font = UIFont.pretendard(fontName)
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .kern: tracking
        ]
        
        return NSAttributedString(string: text, attributes: attributes)
    }
}
