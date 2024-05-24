import UIKit

import SnapKit
import Then

final class SecondAccountView: UIView {
    
    // MARK: - UI Properties

    private var bankImageView = UIImageView()
    
    private var titleLabel = UILabel()
    
    private var balanceLabel = UILabel()
    
    private var moreButton = UIImageView()

    
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
    
    func configure(with response: GetMainAccountResponse) {
        titleLabel.text = response.accountName
        balanceLabel.text = "\(response.balance)원"
    }
}


// MARK: - Private Methods

private extension SecondAccountView {
    
    func setStyle() {
        bankImageView.image = UIImage(named: "icn_profilesmall_ios")
        bankImageView.contentMode = .scaleAspectFit
        

        titleLabel.textColor = UIColor(resource: .black2)
        titleLabel.attributedText = UILabel.attributedText(for: .body8, withText: "햄통장")
        
        balanceLabel.textColor = UIColor(resource: .black2)
        balanceLabel.attributedText = UILabel.attributedText(for: .head5, withText: "304원")

        moreButton.image = UIImage(named: "btn_more_ios")
        moreButton.contentMode = .scaleAspectFit
        
        backgroundColor = UIColor(named: "pink0")
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    func setHierarchy() {
        addSubviews(bankImageView, titleLabel, balanceLabel, moreButton)
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
        
        balanceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
    }
}
