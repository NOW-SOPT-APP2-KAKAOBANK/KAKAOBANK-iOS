import UIKit

import SnapKit
import Then

class ThirdAccountView: UIView {
    
    // Instance creation with basic initializers
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
        // Setting properties for each UI component using 'then' to maintain clarity and brevity
        bankImageView.do {
            $0.image = UIImage(named: "icn_bankimg2_ios")
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
//            $0.text = "김미정의 통장"
            $0.textColor = UIColor(named: "black2")
//            $0.font = UIFont.pretendard(.body8)
            $0.attributedText = UILabel.attributedText(for: .body8, withText: "김미정의 통장")

        }
        
        emerFund.do {
//            $0.setTitle("비상금", for: .normal)
            $0.setTitleColor(UIColor(named: "white0"), for: .normal)
            $0.backgroundColor = UIColor(named: "blue3")
            $0.layer.cornerRadius = 10
//            $0.titleLabel?.font = UIFont.pretendard(.caption2)
            let attributedText = UILabel.attributedText(for: .caption2, withText: "비상금")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        balanceLabel.do {
//            $0.text = "41원"
            $0.textColor = UIColor(named: "black2")
//            $0.font = UIFont.pretendard(.head5)
            $0.attributedText = UILabel.attributedText(for: .head5, withText: "41원")
        }
        
        withdrawLabel.do {
//            $0.text = "출금가능 3,000,041원"
            $0.textColor = UIColor(named: "blue4")
//            $0.font = UIFont.pretendard(.caption1)
            $0.attributedText = UILabel.attributedText(for: .caption1, withText: "출금가능 3,000,041원")
        }
        
        moreButton.do {
            $0.image = UIImage(named: "btn_more_ios")
            $0.contentMode = .scaleAspectFit
        }
        
        cardButton.do {
//            $0.setTitle("카드", for: .normal)
            $0.setTitleColor(UIColor(named: "black2"), for: .normal)
            $0.backgroundColor = UIColor(named: "blue1")
            $0.layer.cornerRadius = 15
//            $0.titleLabel?.font = UIFont.pretendard(.subTitle2)
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "카드")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        transferButton.do {
//            $0.setTitle("이체", for: .normal)
            $0.setTitleColor(UIColor(named: "black2"), for: .normal)
            $0.backgroundColor = UIColor(named: "blue1")
            $0.layer.cornerRadius = 15
//            $0.titleLabel?.font = UIFont.pretendard(.subTitle2)
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "이체")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        // Setting properties of the view itself
        self.backgroundColor = UIColor(named: "blue0")
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
    
    private func setHierarchy() {
        addSubviews(bankImageView, titleLabel, balanceLabel, emerFund, withdrawLabel, moreButton, cardButton, transferButton)
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
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
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
            make.leading.equalToSuperview().offset(284)
            make.top.equalToSuperview().offset(90)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
    }
}
