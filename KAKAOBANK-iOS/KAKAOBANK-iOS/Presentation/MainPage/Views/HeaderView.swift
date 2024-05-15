import UIKit

class HeaderView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "김미정"
        label.textColor = UIColor(named: "white")
        label.font = UIFont(name: "Pretendard-SemiBold", size: 21)
        label.textAlignment = .left
        return label
    }()
    
    private let accountButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_myaccount_and"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let profileButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icn_profile_ios"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
//        backgroundColor = UIColor(hex: "#282A31")
        
        addSubview(titleLabel)
        addSubview(accountButton)
        addSubview(profileButton)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        accountButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // titleLabel을 뷰의 왼쪽 가장자리와 맞추기
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            // accountButton을 titleLabel의 오른쪽에 배치
            accountButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            accountButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            accountButton.heightAnchor.constraint(equalToConstant: 27),
            accountButton.widthAnchor.constraint(equalToConstant: 57),
            
            // profileButton을 뷰의 오른쪽 가장자리와 맞추기
            profileButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26),
            profileButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 36),
            profileButton.widthAnchor.constraint(equalToConstant: 36)
        ])
    }
}