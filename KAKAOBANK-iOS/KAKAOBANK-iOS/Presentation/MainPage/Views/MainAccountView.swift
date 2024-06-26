import UIKit

import SnapKit
import Then

protocol MainAccountViewDelegate: AnyObject {
    func pushToBankAccountVC(sender: UITapGestureRecognizer)
}

final class MainAccountView: UIView {
    
    // MARK: - UI Properties

    private var bankImageView = UIImageView()
    
    private var titleLabel = UILabel()
    
    private var starImageView = UIImageView()
    
    private var balanceLabel = UILabel()
    
    private var moreButton = UIImageView()
    
    private var cardButton = UIButton()
    
    private var transferButton = UIButton()
    
    private var separatorLine = UIView()
    
    private var safeBoxLabel = UILabel()
    
    private var amountLabel = UILabel()
    
    
    // MARK: - Properties

    weak var delegate: MainAccountViewDelegate?
    
    
    // MARK: - Life Cycles

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
    
    @objc
    func didTapMainBankBook(sender: UITapGestureRecognizer) {
        self.delegate?.pushToBankAccountVC(sender: sender)
    }
    
    func configure(with response: GetMainAccountResponse) {
        titleLabel.text = response.accountName
        balanceLabel.text = "\(response.balance.formattedWithSeparator)원"
    }
}


// MARK: - Private Methods

private extension MainAccountView {
    
    func setHierarchy() {
        addSubviews(bankImageView, 
                    titleLabel,
                    starImageView,
                    balanceLabel,
                    moreButton,
                    separatorLine,
                    cardButton, 
                    transferButton,
                    safeBoxLabel,
                    amountLabel)
    }
    
    func setStyle() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapMainBankBook))
        self.addGestureRecognizer(gesture)
        
        bankImageView.do {
            $0.image = UIImage(named: "icn_bankimg1_ios")
        }
        
        titleLabel.do {
            $0.textColor = UIColor(resource: .black2)
            let attributedText = UILabel.attributedText(for: .body8, withText: "햄들의 통장")
            $0.attributedText = attributedText
        }
        
        starImageView.do {
            $0.image = UIImage(named: "icn_star_ios")
        }
        
        balanceLabel.do {
            $0.text = "0원"
            $0.textColor = UIColor(resource: .black2)
            $0.font = UIFont.pretendard(.head5)
        }
        
        moreButton.do {
            $0.image = UIImage(named: "btn_more_ios")
        }
        
        cardButton.do {
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.backgroundColor = UIColor(resource: .yellow0)
            $0.layer.cornerRadius = 15
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "카드")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        transferButton.do {
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.backgroundColor = UIColor(resource: .yellow0)
            $0.layer.cornerRadius = 15
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "이체")
            $0.setAttributedTitle(attributedText, for: .normal)
        }
        
        separatorLine.do {
            $0.backgroundColor = UIColor(resource: .yellow1)
        }
        
        safeBoxLabel.do {
            $0.textColor = UIColor(resource: .black2)
            let attributedText = UILabel.attributedText(for: .body8, withText: "세이프박스")
            $0.attributedText = attributedText
        }
        
        amountLabel.do {
            $0.textColor = UIColor(resource: .black2)
            let attributedText = UILabel.attributedText(for: .body6, withText: "394원")
            $0.attributedText = attributedText
            
        }
        
        self.do {
            $0.backgroundColor = UIColor(named: "mainColor")
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = true
        }
    }
    
    func setLayout() {
        bankImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(34)
            make.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(bankImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().offset(29)
        }
        
        starImageView.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(0)
            make.top.equalToSuperview().offset(26)
            make.width.height.equalTo(20)
        }
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
        
        cardButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(216)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
        
        transferButton.snp.makeConstraints { make in
            make.leading.equalTo(cardButton.snp.trailing).offset(7)
            make.top.equalToSuperview().offset(70)
            make.height.equalTo(31)
            make.width.equalTo(48)
        }
        
        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(balanceLabel.snp.bottom).offset(52)
            make.horizontalEdges.equalToSuperview().inset(22)
            make.height.equalTo(1)
        }
        
        safeBoxLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(21)
            make.bottom.equalToSuperview().inset(22.5)
        }
        
        amountLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(22)
            make.bottom.equalToSuperview().inset(21)
        }
    }
}
