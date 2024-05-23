import UIKit

import SnapKit
import Then

class HeaderView: UIView {
    
    private var titleLabel = UILabel()
    private var accountButton = UIButton()
    private var profileButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setHierachy()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setHierachy()
        setLayout()
        setStyle()
    }
    
   
    
    private func setHierachy() {
        addSubviews(titleLabel, accountButton, profileButton)
    }
    
    private func setLayout() {

        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(75)
            $0.leading.equalToSuperview().offset(23)
        }
        
        accountButton.do {
            $0.snp.makeConstraints {
                $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
                $0.top.equalTo(titleLabel.snp.top)
                $0.height.equalTo(27)
                $0.width.equalTo(57)
            }
        }
        
        profileButton.do {
            $0.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-26)
                $0.top.equalTo(titleLabel.snp.top).offset(-5)
                $0.height.equalTo(36)
                $0.width.equalTo(36)
            }
        }
    }
    
    private func setStyle() {
        
       titleLabel.do {
           $0.textColor = UIColor(resource: .white)
           $0.textAlignment = .left
           let attributedText = UILabel.attributedText(for: .head4, withText: "김미정")
           $0.attributedText = attributedText
       }
       
       accountButton.do {
           $0.setImage(UIImage(named: "btn_myaccount_and"), for: .normal)
           $0.imageView?.contentMode = .scaleAspectFit
       }
       
       profileButton.do {
           $0.setImage(UIImage(named: "icn_profile_ios"), for: .normal)
       }
   }
}
