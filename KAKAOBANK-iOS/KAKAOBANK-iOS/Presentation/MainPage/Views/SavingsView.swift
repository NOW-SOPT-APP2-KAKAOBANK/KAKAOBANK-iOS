import UIKit

import SnapKit
import Then

class SavingsView: UIView {
    
    private var bagImageView = UIImageView()
    private var messageLabel = UILabel()
    private var titleLabel = UILabel()
    
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
        bagImageView.image = UIImage(named: "icn_31image_ios")
        bagImageView.contentMode = .scaleAspectFit
        
        messageLabel.textColor = UIColor(resource: .gray8)
        messageLabel.attributedText = UILabel.attributedText(for: .body8, withText: "춘식이와 한달동안 매일매일 저금")

        titleLabel.textColor = UIColor(resource: .white)
        titleLabel.attributedText = UILabel.attributedText(for: .body1, withText: "한달적금 시작하기")

        backgroundColor = UIColor(resource: .darkgray0)
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    private func setHierarchy() {
        addSubviews(bagImageView, titleLabel, messageLabel)
    }
    
    private func setLayout() {
        bagImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(26)
            make.top.equalToSuperview().offset(31)
            make.width.equalTo(30)
            make.height.equalTo(27)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(bagImageView.snp.trailing).offset(13)
            make.top.equalToSuperview().offset(23)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(messageLabel.snp.leading)
            make.top.equalTo(messageLabel.snp.bottom).offset(7)
        }
    }
}
