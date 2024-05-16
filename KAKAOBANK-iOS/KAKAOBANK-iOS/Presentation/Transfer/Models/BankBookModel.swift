//
//  BankBookModel.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/15/24.
//

import UIKit

struct BankBookModel {
    let bankImg: UIImage
    let bankName: String
}

extension BankBookModel {
    static let bankBookData: [BankBookModel] = [
        BankBookModel(bankImg: UIImage(resource: .btnKakaoBankIos), bankName: "카카오뱅크"),
        BankBookModel(bankImg: UIImage(resource: .btnKbankBankIos), bankName: "국민은행"),
        BankBookModel(bankImg: UIImage(resource: .btnIbkBankIos), bankName: "기업은행"),
        BankBookModel(bankImg: UIImage(resource: .btnNonghupBankIos), bankName: "농협은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSinhanBankIos), bankName: "신한은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSanupBankIos), bankName: "산업은행"),
        BankBookModel(bankImg: UIImage(resource: .btnUriBankIos), bankName: "우리은행"),
        BankBookModel(bankImg: UIImage(resource: .btnHankukcitiBankIos), bankName: "한국시티은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSccheilBankIos), bankName: "SC제일은행"),
        BankBookModel(bankImg: UIImage(resource: .btnKyungnamBankIos), bankName: "경남은행"),
        BankBookModel(bankImg: UIImage(resource: .btnGwangjuBankIos), bankName: "광주은행"),
        BankBookModel(bankImg: UIImage(resource: .btnDaeguBankIos), bankName: "대구은행"),
        BankBookModel(bankImg: UIImage(resource: .btnDoichiBankIos), bankName: "도이치은행"),
        BankBookModel(bankImg: UIImage(resource: .btnBankofBankIos), bankName: "뱅크오브아메리카"),
        BankBookModel(bankImg: UIImage(resource: .btnBnkBankIos), bankName: "부산은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSanlimBankIos), bankName: "산림조합중앙회"),
        BankBookModel(bankImg: UIImage(resource: .btnSbBankIos), bankName: "저축은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSaemaeulBankIos), bankName: "새마을금고"),
        BankBookModel(bankImg: UIImage(resource: .btnSuhupBankIos), bankName: "수협은행"),
        BankBookModel(bankImg: UIImage(resource: .btnSinhupBankIos), bankName: "신협중앙회"),
        BankBookModel(bankImg: UIImage(resource: .btnUchegukBankIos), bankName: "우체국"),
        BankBookModel(bankImg: UIImage(resource: .btnZeonbukBankIos), bankName: "전북은행"),
        BankBookModel(bankImg: UIImage(resource: .btnJejuBankIos), bankName: "제주은행"),
        BankBookModel(bankImg: UIImage(resource: .btnChinageonseolBankIos), bankName: "중국건설은행"),
        BankBookModel(bankImg: UIImage(resource: .btnChinagongsangBankIos), bankName: "중국공상은행"),
        BankBookModel(bankImg: UIImage(resource: .btnChinaBankIos), bankName: "중국은행"),
        BankBookModel(bankImg: UIImage(resource: .btnBnpBankIos), bankName: "BNP파리바은행"),
        BankBookModel(bankImg: UIImage(resource: .btnHsbcBankIos), bankName: "HSBC은행"),
        BankBookModel(bankImg: UIImage(resource: .btnJpmoganBankIos), bankName: "JP모간체이스은행"),
        BankBookModel(bankImg: UIImage(resource: .btnKbankBankIos), bankName: "케이뱅크"),
        BankBookModel(bankImg: UIImage(resource: .btnTossBankIos), bankName: "토스뱅크")
    ]
    
    static let stockData: [BankBookModel] = [
        BankBookModel(bankImg: UIImage(resource: .btnKyoboStockIos), bankName: "교보증권"),
        BankBookModel(bankImg: UIImage(resource: .btnDaesinStockIos), bankName: "대신증권"),
        BankBookModel(bankImg: UIImage(resource: .btnDbStockIos), bankName: "DB금융투자"),
        BankBookModel(bankImg: UIImage(resource: .btnMeritzStockIos), bankName: "메리츠증권"),
        BankBookModel(bankImg: UIImage(resource: .btnMiraeStockIos), bankName: "미레에셋증권"),
        BankBookModel(bankImg: UIImage(resource: .btnBukukStockIos), bankName: "부국증권"),
        BankBookModel(bankImg: UIImage(resource: .btnSamsungStockIos), bankName: "삼성증권"),
        BankBookModel(bankImg: UIImage(resource: .btnSinyoungStockIos), bankName: "신영증권"),
        BankBookModel(bankImg: UIImage(resource: .btnSinhanStockIos), bankName: "신한투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnSkStockIos), bankName: "에스케이증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHyundaeStockIos), bankName: "현대차증권"),
        BankBookModel(bankImg: UIImage(resource: .btnUantaStockIos), bankName: "유안타증권"),
        BankBookModel(bankImg: UIImage(resource: .btnUzinStockIos), bankName: "유진투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnEbestStockIos), bankName: "이베스트투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnCapeStockIos), bankName: "케이프투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnKiumStockIos), bankName: "키움증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHankukStockIos), bankName: "한국포스증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHanaStockIos), bankName: "하나증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHituzaStockIos), bankName: "하이투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHankuktuzaStockIos), bankName: "한국투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnSangsangStockIos), bankName: "상상인증권"),
        BankBookModel(bankImg: UIImage(resource: .btnHanhwaStockIos), bankName: "한화투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnKbStockIos), bankName: "KB증권"),
        BankBookModel(bankImg: UIImage(resource: .btnDaolStockIos), bankName: "다올투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnBnkStockIos), bankName: "BNK투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnNhStockIos), bankName: "NH투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnKakaopayStockIos), bankName: "카카오페이증권"),
        BankBookModel(bankImg: UIImage(resource: .btnIbkStockIos), bankName: "IBK투자증권"),
        BankBookModel(bankImg: UIImage(resource: .btnTossStockIos), bankName: "토스증권")
    ]
}
