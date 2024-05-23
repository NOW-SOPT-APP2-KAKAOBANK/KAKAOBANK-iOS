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
        backgroundColor = UIColor(resource: .darkgray0)  
        layer.cornerRadius = 15
        layer.masksToBounds = true
        
        titleLabel.do {
            $0.textColor = UIColor(resource: .white)
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
            make.trailing.equalToSuperview().offset(-18.5)
            make.top.equalToSuperview().offset(19.5)
        }
    }
}
