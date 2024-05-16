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
            $0.leading.equalToSuperview().offset(23)
            $0.centerY.equalToSuperview()
        }
        
        accountButton.do {
            $0.snp.makeConstraints {
                $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
                $0.centerY.equalToSuperview()
                $0.height.equalTo(27)
                $0.width.equalTo(57)
            }
        }
        
        profileButton.do {
            $0.snp.makeConstraints {
                $0.trailing.equalToSuperview().offset(-26)
                $0.centerY.equalToSuperview()
                $0.height.equalTo(36)
                $0.width.equalTo(36)
            }
        }
    }
    
    private func setStyle() {
        
        // Styling titleLabel
       titleLabel.do {
           $0.text = "김미정"
           $0.textColor = UIColor(named: "white") ?? .white  // Fallback to .white if the color is not found
           $0.textAlignment = .left
       }
       
       // Styling accountButton
       accountButton.do {
           $0.setImage(UIImage(named: "btn_myaccount_and"), for: .normal)
           $0.imageView?.contentMode = .scaleAspectFit
       }
       
       // Styling profileButton
       profileButton.do {
           $0.setImage(UIImage(named: "icn_profile_ios"), for: .normal)
       }
   }
}
