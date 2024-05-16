import UIKit

struct TipsModel {
    let icon: UIImage
    let title: String
}

extension TipsModel {
    static func dummy() -> [TipsModel] {
        return [
            TipsModel(icon: UIImage(named: "icn_pig_ios")!, title: "매일\n용돈 받기"),
            TipsModel(icon: UIImage(named: "icn_scale_ios")!, title: "신용대출\n비교하기"),
            TipsModel(icon: UIImage(named: "icn_coupon_ios")!, title: "쿠폰\n사고팔기")
        ]
    }
}

