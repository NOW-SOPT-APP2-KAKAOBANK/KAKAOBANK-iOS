import UIKit

import SnapKit
import Then

class MeetingAccountView: UIView {
    
    private var titleLabel = UILabel()
    private var leadingImageView = UIImageView()
    
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
        backgroundColor = UIColor(resource: .darkgray0)  // Assets에서 배경색 설정
        layer.cornerRadius = 15  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        
        // Style for titleLabel
        titleLabel.do {
//            $0.text = "모임통장"
            $0.textColor = UIColor(resource: .white)
//            $0.font = UIFont.pretendard(.body1)
            $0.attributedText = UILabel.attributedText(for: .body1, withText: "모임통장")

        }
        
        // Style for leadingImageView
        leadingImageView.do {
            $0.image = UIImage(named: "btn_leading_ios")
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func setHierarchy() {
        addSubviews(titleLabel, leadingImageView)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.top.equalToSuperview().offset(22.5)
        }
        
        leadingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(293)
            make.top.equalToSuperview().offset(19.5)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
    }
}
