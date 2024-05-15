import UIKit

class SecondAccountView: UIView {
    
    private let bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icn_profilesmall_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "햄통장"
        label.textColor = UIColor(named: "black2")
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        return label
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "304원"
        label.textColor = UIColor(named: "black2")
        label.font = UIFont(name: "Pretendard-SemiBold", size: 17)
        return label
    }()
    
    private let moreButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btn_more_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        backgroundColor = UIColor(named: "pink0")
        layer.cornerRadius = 15  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        
        addSubview(bankImageView)
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(moreButton)
        
        setupConstraints()
    }

        private func setupConstraints() {
                
            NSLayoutConstraint.activate([
                bankImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                bankImageView.topAnchor.constraint(equalTo: topAnchor, constant: 34),
                bankImageView.widthAnchor.constraint(equalToConstant: 40),
                bankImageView.heightAnchor.constraint(equalToConstant: 40),
                
                titleLabel.leadingAnchor.constraint(equalTo: bankImageView.trailingAnchor, constant: 8),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 29),
                
                balanceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                
                moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
                moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
                moreButton.widthAnchor.constraint(equalToConstant: 24),
                moreButton.heightAnchor.constraint(equalToConstant: 24),
                
            ])
            
            subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        }
    
}
