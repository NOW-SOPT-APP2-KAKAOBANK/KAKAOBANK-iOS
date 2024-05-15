import UIKit
import SnapKit

class ThirdAccountView: UIView {
    
    private let bankImageView: UIImageView = UIImageView()
    private let titleLabel: UILabel = UILabel()
    private let emerFund: UIButton = UIButton()
    private let balanceLabel: UILabel = UILabel()
    private let withdrawLabel: UILabel = UILabel()
    private let moreButton: UIImageView = UIImageView()
    private let cardButton: UIButton = UIButton()
    private let transferButton: UIButton = UIButton()
    
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
        bankImageView.image = UIImage(named: "icn_bankimg2_ios")
        bankImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = "김미정의 통장"
        titleLabel.textColor = UIColor(named: "black2")
        titleLabel.font = UIFont.pretendard(.body8)
        
        emerFund.setTitle("비상금", for: .normal)
        emerFund.setTitleColor(UIColor(named: "white0"), for: .normal)
        emerFund.backgroundColor = UIColor(named: "blue3")
        emerFund.layer.cornerRadius = 10
        emerFund.titleLabel?.font = UIFont.pretendard(.caption2)
        
        balanceLabel.text = "41원"
        balanceLabel.textColor = UIColor(named: "black2")
        balanceLabel.font = UIFont.pretendard(.head5)
        
        withdrawLabel.text = "출금가능 3,000,041원"
        withdrawLabel.textColor = UIColor(named: "blue4")
        withdrawLabel.font = UIFont.pretendard(.caption1)
        
        moreButton.image = UIImage(named: "btn_more_ios")
        moreButton.contentMode = .scaleAspectFit
        
        cardButton.setTitle("카드", for: .normal)
        cardButton.setTitleColor(UIColor(named: "black2"), for: .normal)
        cardButton.backgroundColor = UIColor(named: "blue1")
        cardButton.layer.cornerRadius = 15
        cardButton.titleLabel?.font = UIFont.pretendard(.subTitle2)
        
        transferButton.setTitle("이체", for: .normal)
        transferButton.setTitleColor(UIColor(named: "black2"), for: .normal)
        transferButton.backgroundColor = UIColor(named: "blue1")
        transferButton.layer.cornerRadius = 15
        transferButton.titleLabel?.font = UIFont.pretendard(.subTitle2)
        
        backgroundColor = UIColor(named: "blue0")
        layer.cornerRadius = 15  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
    }
    
    private func setHierachy() {
        addSubview(bankImageView)
        addSubview(titleLabel)
        addSubview(balanceLabel)
        addSubview(emerFund)
        addSubview(withdrawLabel)
        addSubview(moreButton)
        addSubview(cardButton)
        addSubview(transferButton)
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
