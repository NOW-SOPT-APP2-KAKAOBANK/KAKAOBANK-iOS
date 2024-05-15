import UIKit

class MainAccountView: UIView {
    
    private let bankImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icn_bankimg1_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "햄들의 통장"
        label.textColor = UIColor(named: "black2")
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        return label
    }()
    
    private let starImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icn_star_ios")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "0원"
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
    
    private let cardButton: UIButton = {
        let button = UIButton()
        button.setTitle("카드", for: .normal)
        button.setTitleColor(UIColor(named: "black2"), for: .normal)
        button.backgroundColor = UIColor(named: "yellow0")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        return button
    }()
    
    private let transferButton: UIButton = {
        let button = UIButton()
        button.setTitle("이체", for: .normal)
        button.setTitleColor(UIColor(named: "black2"), for: .normal)
        button.backgroundColor = UIColor(named: "yellow0")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        return button
    }()
    
    private let separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "yellow1")
        return view
    }()
    
    private let safeBoxLabel: UILabel = {
        let label = UILabel()
        label.text = "세이프박스"
        label.textColor = UIColor(named: "black2")
        label.font = UIFont(name: "Pretendard-Regular", size: 12)
        return label
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "394원"
        label.textColor = UIColor(named: "black2")
        label.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        return label
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
        backgroundColor = UIColor(named: "mainColor")
        layer.cornerRadius = 15  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        
        addSubview(bankImageView)
        addSubview(titleLabel)
        addSubview(starImageView)
        addSubview(balanceLabel)
        addSubview(moreButton)
        addSubview(separatorLine)
        addSubview(cardButton)
        addSubview(transferButton)
        addSubview(safeBoxLabel)
        addSubview(amountLabel)
        
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
                
                starImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 4),
                starImageView.topAnchor.constraint(equalTo: topAnchor, constant: 26),
                starImageView.widthAnchor.constraint(equalToConstant: 20),
                starImageView.heightAnchor.constraint(equalToConstant: 20),
                
                balanceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                balanceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                
                moreButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
                moreButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -19),
                moreButton.widthAnchor.constraint(equalToConstant: 24),
                moreButton.heightAnchor.constraint(equalToConstant: 24),
                
                cardButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 229), //216
                cardButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
                cardButton.heightAnchor.constraint(equalToConstant: 31),
                cardButton.widthAnchor.constraint(equalToConstant: 48),
                
                transferButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 284),//271
                transferButton.topAnchor.constraint(equalTo: topAnchor, constant: 70),
                transferButton.heightAnchor.constraint(equalToConstant: 31),
                transferButton.widthAnchor.constraint(equalToConstant: 48),
                
                separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
                separatorLine.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 52),
                separatorLine.widthAnchor.constraint(equalToConstant: 297),
                separatorLine.heightAnchor.constraint(equalToConstant: 1),
                
                safeBoxLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21),
                safeBoxLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21),
                
                amountLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
                amountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -21)
            ])
            
            subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        }
    
}
