import UIKit

import SnapKit
import Then

class SecondAccountView: UIView {
    
    // Simple instantiation of UI components
    private var bankImageView = UIImageView()
    private var titleLabel = UILabel()
    private var balanceLabel = UILabel()
    private var moreButton = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierarchy()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setHierarchy()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        // Styling for bankImageView
        bankImageView.image = UIImage(named: "icn_profilesmall_ios")
        bankImageView.contentMode = .scaleAspectFit
        
        // Styling for titleLabel
//        titleLabel.text = "햄통장"
        titleLabel.textColor = UIColor(resource: .black2)
//        titleLabel.font = UIFont.pretendard(.body8)
        titleLabel.attributedText = UILabel.attributedText(for: .body8, withText: "햄통장")
        
        // Styling for balanceLabel
//        balanceLabel.text = "304원"
        balanceLabel.textColor = UIColor(resource: .black2)
//        balanceLabel.font = UIFont.pretendard(.head5)
        balanceLabel.attributedText = UILabel.attributedText(for: .head5, withText: "304원")
        
        // Styling for moreButton
        moreButton.image = UIImage(named: "btn_more_ios")
        moreButton.contentMode = .scaleAspectFit
        
        // Styling for the background of the view itself
        backgroundColor = UIColor(named: "pink0")
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    private func setHierarchy() {
        addSubviews(bankImageView, titleLabel, balanceLabel, moreButton)
    }
    
    private func setLayout() {
        bankImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(34)
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bankImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(29)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
    }
}
