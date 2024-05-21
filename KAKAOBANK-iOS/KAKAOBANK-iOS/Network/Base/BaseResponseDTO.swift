//
//  BaseResponseDTO.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/21/24.
//

import Foundation

struct BaseResponseDTO: Codable {
    let status: Int
    let message: String
    let data: Data?
}
