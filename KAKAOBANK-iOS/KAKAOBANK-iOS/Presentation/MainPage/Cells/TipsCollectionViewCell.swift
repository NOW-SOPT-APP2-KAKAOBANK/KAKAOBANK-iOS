import UIKit

import SnapKit
import Then

class TipsCollectionViewCell: UICollectionViewCell {
    static let identifier = "TipsCollectionViewCell"
    
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarcy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        contentView.do {
            $0.backgroundColor = UIColor(named: "darkgray0")
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
        
        iconImageView.do {
            $0.contentMode = .scaleAspectFit
        }
        
        titleLabel.do {
            $0.textColor = UIColor(named: "white")
            $0.font = UIFont.pretendard(.body6)
            $0.numberOfLines = 0 
        }
    }
    
    private func setHierarcy() {
        contentView.addSubviews(iconImageView, titleLabel)
    }
    
    private func setLayout() {
        
        iconImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(17)
            make.leading.equalToSuperview().offset(14)
            make.size.equalTo(CGSize(width: 26, height: 27))
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImageView.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(with model: TipsModel) {
        iconImageView.image = model.icon
        titleLabel.text = model.title
    }
}
