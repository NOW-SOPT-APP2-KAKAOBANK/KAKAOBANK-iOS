import UIKit

import SnapKit
import Then

final class AddButtonView: UIView {
    
    // MARK: - UI Properties

    private let leadingImageView = UIImageView().then {
        $0.image = UIImage(named: "icn_plus_ios")
        $0.contentMode = .scaleAspectFit
    }
    
    
    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setStyle()
        setHierarchy()
        setLayout()
    }

}


// MARK: - Private Methods

private extension AddButtonView {
    
    func setStyle() {
        self.do {
            $0.backgroundColor = UIColor(resource: .darkgray0)
            $0.layer.cornerRadius = 15
            $0.layer.masksToBounds = true
        }
    }
    
    func setHierarchy() {
        addSubview(leadingImageView)
    }
    
    func setLayout() {
        leadingImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(158)
            make.top.equalToSuperview().offset(17)
        }
    }
}
