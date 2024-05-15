import UIKit

class ThirdAccountView: UIView {
    
    private let bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icn_bankimg2_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "김미정의 통장"
        label.textColor = UIColor(named: "black2")
//        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        label.font = UIFont.pretendard(.body8)
        return label
    }()
    
    private let emerFund: UIButton = {
        let button = UIButton()
        button.setTitle("비상금", for: .normal)
        button.setTitleColor(UIColor(named: "white0"), for: .normal)
        button.backgroundColor = UIColor(named: "blue3")
        button.layer.cornerRadius = 10
//        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 9)
        button.titleLabel?.font = UIFont.pretendard(.caption2)
        return button
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "41원"
        label.textColor = UIColor(named: "black2")
//        label.font = UIFont(name: "Pretendard-SemiBold", size: 17)
        label.font = UIFont.pretendard(.head5)
        return label
    }()
    
    private let withdrawLabel: UILabel = {
        let label = UILabel()
        label.text = "출금가능 3,000,041원"
        label.textColor = UIColor(named: "blue4")
//        label.font = UIFont(name: "Pretendard-Regular", size: 11)
        label.font = UIFont.pretendard(.caption1)
        return label
    }()
    
    private let moreButton: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btn_more_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let cardButton: UIButton = {
        let button = UIButton()
        button.setTitle("카드", for: .normal)
        button.setTitleColor(UIColor(named: "black2"), for: .normal)
        button.backgroundColor = UIColor(named: "blue1")
        button.layer.cornerRadius = 15
//        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        button.titleLabel?.font = UIFont.pretendard(.subTitle2)
        return button
    }()
    
    private let transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("이체", for: .normal)
        button.setTitleColor(UIColor(named: "black2"), for: .normal)
        button.backgroundColor = UIColor(named: "blue1")
        button.layer.cornerRadius = 15
//        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        button.titleLabel?.font = UIFont.pretendard(.subTitle2)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
    }
    
    private func setViews() {
        backgroundColor = UIColor(named: "blue0")
        layer.cornerRadius = 15  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        
        addSubviews(bankImageView, titleLabel, balanceLabel, emerFund,
                    withdrawLabel, moreButton, cardButton, transferButton)
        
        setConstraints()
    }

        private func setConstraints() {
                
            NSLayoutConstraint.activate([
                bankImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                bankImageView.topAnchor.constraint(equalTo: topAnchor, constant: 34),
                bankImageView.widthAnchor.constraint(equalToConstant: 40),
                bankImageView.heightAnchor.constraint(equalToConstant: 40),
                
                titleLabel.leadingAnchor.constraint(equalTo: bankImageView.trailingAnchor, constant: 8),
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 29),
                
                balanceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                
                emerFund.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
                emerFund.topAnchor.constraint(equalTo: topAnchor, constant: 29),
                emerFund.heightAnchor.constraint(equalToConstant: 16),
                emerFund.widthAnchor.constraint(equalToConstant: 33),
                
                withdrawLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                withdrawLabel.topAnchor.constraint(equalTo: topAnchor, constant: 78),
                
                moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
                moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
                moreButton.widthAnchor.constraint(equalToConstant: 24),
                moreButton.heightAnchor.constraint(equalToConstant: 24),
                
                cardButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -77), //216
                cardButton.topAnchor.constraint(equalTo: topAnchor, constant: 90),
                cardButton.heightAnchor.constraint(equalToConstant: 31),
                cardButton.widthAnchor.constraint(equalToConstant: 48),
                
                transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 284),//271
                transferButton.topAnchor.constraint(equalTo: topAnchor, constant: 90),
                transferButton.heightAnchor.constraint(equalToConstant: 31),
                transferButton.widthAnchor.constraint(equalToConstant: 48),
               
            ])
            
            subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        }
    
}
