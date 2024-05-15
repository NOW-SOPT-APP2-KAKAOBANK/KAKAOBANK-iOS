import UIKit
import SnapKit

class MainAccountView: UIView {
    
    private let bankImageView = UIImageView()
    private let titleLabel = UILabel()
    private let starImageView = UIImageView()
    private let balanceLabel = UILabel()
    private let moreButton = UIImageView()
    private let cardButton = UIButton()
    private let transferButton = UIButton()
    private let separatorLine = UIView()
    private let safeBoxLabel = UILabel()
    private let amountLabel = UILabel()
    
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
    
    private func setHierarchy() {
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
    }
    
    private func setStyle() {
        bankImageView.image = UIImage(named: "icn_bankimg1_ios")
        bankImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "햄들의 통장"
        titleLabel.textColor = UIColor(named: "black2")
        titleLabel.font = UIFont.pretendard(.body8)
        
        starImageView.image = UIImage(named: "icn_star_ios")
        starImageView.contentMode = .scaleAspectFit
        
        balanceLabel.text = "0원"
        balanceLabel.textColor = UIColor(named: "black2")
        balanceLabel.font = UIFont.pretendard(.head5)
        
        moreButton.image = UIImage(named: "btn_more_ios")
        moreButton.contentMode = .scaleAspectFit
        
        cardButton.setTitle("카드", for: .normal)
        cardButton.setTitleColor(UIColor(named: "black2"), for: .normal)
        cardButton.backgroundColor = UIColor(named: "yellow0")
        cardButton.layer.cornerRadius = 15
        cardButton.titleLabel?.font = UIFont.pretendard(.subTitle2)
        
        transferButton.setTitle("이체", for: .normal)
        transferButton.setTitleColor(UIColor(named: "black2"), for: .normal)
        transferButton.backgroundColor = UIColor(named: "yellow0")
        transferButton.layer.cornerRadius = 15
        transferButton.titleLabel?.font = UIFont.pretendard(.subTitle2)
        
        separatorLine.backgroundColor = UIColor(named: "yellow1")
        
        safeBoxLabel.text = "세이프박스"
        safeBoxLabel.textColor = UIColor(named: "black2")
        safeBoxLabel.font = UIFont.pretendard(.body8)
        
        amountLabel.text = "394원"
        amountLabel.textColor = UIColor(named: "black2")
        amountLabel.font = UIFont.pretendard(.body6)
        
        backgroundColor = UIColor(named: "mainColor")
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    private func setLayout() {
        bankImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(34)
            make.width.height.equalTo(40)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bankImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(29)
        }
        
        starImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(4)
            make.top.equalToSuperview().offset(26)
            make.width.height.equalTo(20)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
        
        cardButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(229)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
        
        transferButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(284)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(22)
            make.top.equalTo(balanceLabel.snp.bottom).offset(52)
            make.width.equalTo(297)
            make.height.equalTo(1)
        }
        
        safeBoxLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.bottom.equalToSuperview().inset(21)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().inset(21)
        }
    }
}
