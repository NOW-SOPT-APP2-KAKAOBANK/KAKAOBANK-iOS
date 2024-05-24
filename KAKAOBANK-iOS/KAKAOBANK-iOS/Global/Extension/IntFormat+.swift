//
//  IntFormat+.swift
//  KAKAOBANK-iOS
//
//  Created by 김민서 on 5/24/24.
//

import Foundation

extension Int {
    var formattedWithSeparator: String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self)) ?? ""
    }
}

