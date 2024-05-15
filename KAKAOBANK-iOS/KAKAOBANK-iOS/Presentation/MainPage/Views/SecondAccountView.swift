import UIKit
import SnapKit

class SecondAccountView: UIView {
    
    private let bankImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let balanceLabel: UILabel = UILabel()
    private let moreButton: UIImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierachy()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setHierachy()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        bankImageView.image = UIImage(named: "icn_profilesmall_ios")
        bankImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "햄통장"
        titleLabel.textColor = UIColor(named: "black2")
        titleLabel.font = UIFont.pretendard(.body8)
        
        balanceLabel.text = "304원"
        balanceLabel.textColor = UIColor(named: "black2")
        balanceLabel.font = UIFont.pretendard(.head5)
        
        moreButton.image = UIImage(named: "btn_more_ios")
        moreButton.contentMode = .scaleAspectFit
        
        backgroundColor = UIColor(named: "pink0")
        layer.cornerRadius = 15
        layer.masksToBounds = true
    }
    
    private func setHierachy() {
        addSubview(bankImageView)
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(moreButton)
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
        
        moreButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().inset(19)
            make.width.height.equalTo(24)
        }
    }
}
