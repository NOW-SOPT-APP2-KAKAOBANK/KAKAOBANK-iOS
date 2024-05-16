import UIKit

import SnapKit
import Then

class AdView: UIView {
    
    private let imageView = UIImageView()

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
    
    private func setHierachy() {
        addSubview(imageView)
    }
    
    private func setStyle() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func configure(with imageName: String) {
        imageView.image = UIImage(named: "card_ad_ios")
    }
}

