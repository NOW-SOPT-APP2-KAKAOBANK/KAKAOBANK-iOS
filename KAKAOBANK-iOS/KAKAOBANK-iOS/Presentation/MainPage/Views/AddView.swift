import UIKit

import SnapKit
import Then

final class AdView: UIView {
    
    // MARK: - UI Properties

    private let imageView = UIImageView()
    
    
    // MARK: - Life Cycles
    
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

    func configure(with imageName: String) {
        imageView.image = UIImage(named: "card_ad_ios")
    }
}


// MARK: - Private Methods

private extension AdView {
    
    func setHierachy() {
        addSubview(imageView)
    }
    
    func setStyle() {
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
    }
    
    func setLayout() {
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
