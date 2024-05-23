import UIKit

import SnapKit
import Then

class ThirdAccountView: UIView {
    
    private var bankImageView = UIImageView()
    private var titleLabel = UILabel()
    private var emerFund = UIButton()
    private var balanceLabel = UILabel()
    private var withdrawLabel = UILabel()
    private var moreButton = UIImageView()
    private var cardButton = UIButton()
    private var transferButton = UIButton()
    
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
        bankImageView.do {
            $0.image = UIImage(named: "icn_bankimg2_ios")
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.textColor = UIColor(resource: .black2)
            $0.attributedText = UILabel.attributedText(for: .body8, withText: "김미정의 통장")

        }
        
        emerFund.do {
            $0.setTitleColor(UIColor(named: "white0"), for: .normal)
            $0.backgroundColor = UIColor(resource: .blue3)
            $0.layer.cornerRadius = 10
            let attributedText = UILabel.attributedText(for: .caption2, withText: "비상금")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        balanceLabel.do {
            $0.textColor = UIColor(resource: .black2)
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "41원")
        }
        
        withdrawLabel.do {
            $0.textColor = UIColor(resource: .blue4)
            $0.attributedText = UILabel.attributedText(for: .caption1, withText: "출금가능 3,000,041원")
        }
        
        moreButton.do {
            $0.image = UIImage(named: "btn_more_ios")
            $0.contentMode = .scaleAspectFit
        }
        
        cardButton.do {
            $0.setTitleColor(UIColor(named: "black2"), for: .normal)
            $0.backgroundColor = UIColor(resource: .blue1)
            $0.layer.cornerRadius = 15
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "카드")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        transferButton.do {
            $0.setTitleColor(UIColor(named: "black2"), for: .normal)
            $0.backgroundColor = UIColor(resource: .blue1)
            $0.layer.cornerRadius = 15
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "이체")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        self.backgroundColor = UIColor(resource: .blue0)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    private func setHierarchy() {
        addSubviews(bankImageView, titleLabel, balanceLabel, emerFund, withdrawLabel, moreButton, cardButton, transferButton)
    }
    
    private func setLayout() {
        bankImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(35)
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bankImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(30)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        emerFund.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(4)
            make.top.equalToSuperview().offset(29)
            make.height.equalTo(16)
            make.width.equalTo(33)
        }
        
        withdrawLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalToSuperview().offset(78)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
        
        cardButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(77)
            make.top.equalToSuperview().offset(90)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
        
        transferButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(271)
            make.top.equalToSuperview().offset(90)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
    }
    
    func configure(with response: GetMainAccountResponse) {
        titleLabel.text = response.accountName
        balanceLabel.text = "\(response.balance)원"
    }
}
