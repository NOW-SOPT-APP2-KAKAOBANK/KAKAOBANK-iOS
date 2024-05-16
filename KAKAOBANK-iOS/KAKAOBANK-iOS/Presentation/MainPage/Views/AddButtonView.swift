import UIKit

import SnapKit
import Then

class AddButtonView: UIView {

    private let leadingImageView = UIImageView().then {
        $0.image = UIImage(named: "icn_plus_ios")
        $0.contentMode = .scaleAspectFit
    }

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
    
    private func setStyle() {
        // UIView의 스타일 설정
        self.do {
            $0.backgroundColor = UIColor(named: "darkgray0")  // Assets에서 배경색 설정
            $0.layer.cornerRadius = 15  // 모서리 둥글게 설정
            $0.layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        }
    }
    
    private func setHierarchy() {
        addSubview(leadingImageView)
    }
    
    private func setLayout() {
        leadingImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(158)
            make.top.equalToSuperview().offset(17)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        

    }
}
