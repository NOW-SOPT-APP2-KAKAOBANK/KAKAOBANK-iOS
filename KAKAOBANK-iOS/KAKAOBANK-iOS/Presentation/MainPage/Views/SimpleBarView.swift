import UIKit

import SnapKit
import Then

class SimpleBarView: UIView {
    private var easyHomeLabel = UILabel()
    private var screenEditLabel = UILabel()
    private var lineIcon = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setHierarchy()
        setLayout()
    }

    private func setStyle() {
        easyHomeLabel.do {
            $0.textColor = UIColor(named: "gray10")
//            $0.font = UIFont.pretendard(.body8)
//            $0.text = "간편 홈"
            $0.attributedText = UILabel.attributedText(for: .body8, withText: "간편 홈")

        }
        
        screenEditLabel.do {
            $0.textColor = UIColor(named: "gray10")
//            $0.font = UIFont.pretendard(.body8)
//            $0.text = "화면 편집"
            $0.attributedText = UILabel.attributedText(for: .body8, withText: "화면 편집")

        }
        
        lineIcon.do {
            $0.image = UIImage(named: "icn_line_ios")
        }
    }

    private func setHierarchy() {
        addSubviews(easyHomeLabel, screenEditLabel, lineIcon)
    }

    private func setLayout() {
        screenEditLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(30)
            make.centerY.equalToSuperview()
        }

        lineIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        easyHomeLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(30)
            make.centerY.equalToSuperview()
        }
    }
}
