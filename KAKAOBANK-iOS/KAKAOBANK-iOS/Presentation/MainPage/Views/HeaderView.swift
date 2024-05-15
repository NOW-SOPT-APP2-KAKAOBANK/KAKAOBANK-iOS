import UIKit

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
        
        // Using SnapKit to set constraints for titleLabel
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(23)
            make.centerY.equalToSuperview()
        }
        
        // Using SnapKit to set constraints for accountButton
        accountButton.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(5)
            make.centerY.equalToSuperview()
            make.height.equalTo(27)
            make.width.equalTo(57)
        }
        
        // Using SnapKit to set constraints for profileButton
        profileButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-26)
            make.centerY.equalToSuperview()
            make.height.equalTo(36)
            make.width.equalTo(36)
        }
    }
    
    private func setStyle() {
        // Set the styles for titleLabel
        titleLabel.text = "김미정"
        titleLabel.textColor = UIColor(named: "white")
        titleLabel.font = UIFont.pretendard(.head4)
        titleLabel.textAlignment = .left
        
        // Set the styles for accountButton
        accountButton.setImage(UIImage(named: "btn_myaccount_and"), for: .normal)
        accountButton.imageView?.contentMode = .scaleAspectFit
        
        // Set the styles for profileButton
        profileButton.setImage(UIImage(named: "icn_profile_ios"), for: .normal)
    }
}
