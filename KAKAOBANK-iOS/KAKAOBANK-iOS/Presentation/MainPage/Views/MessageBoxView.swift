import UIKit

import SnapKit
import Then

class MessageBoxView: UIView {
    var heightConstraint: Constraint?

    private var messageLabel = UILabel()
    private var closeButton = UIButton()
    private var checkLimitButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setHierachy()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setHierachy()
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setStyle()
        setLayout()
    }

    private func setHierachy() {
        addSubviews(messageLabel, closeButton, checkLimitButton)
    }

    private func setStyle() {
        backgroundColor = UIColor(resource: .darkgray0)  // Assets에서 배경색 설정
        layer.cornerRadius = 10  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록

        // Set the styles for messageLabel using Then
        messageLabel.do {
            $0.textColor = UIColor(resource: .white)
            $0.attributedText = UILabel.attributedText(for: .subTitle2, withText: "김미정님의 신용점수는\n대출 승인 가능성이 높아요")
            $0.numberOfLines = 0  // 여러 줄 표시 가능하도록 설정
        }

        // Set the styles for closeButton using Then
        closeButton.do {
            $0.setImage(UIImage(named: "icn_x_ios"), for: .normal)
            $0.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        }

        // Set the styles for checkLimitButton using Then
        checkLimitButton.do {
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.backgroundColor = UIColor(resource: .yellow0)
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "한도 확인하기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.layer.cornerRadius = 15  // 버튼 모서리 둥글게
        }
    }

    private func setLayout() {
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(13)
            make.trailing.equalToSuperview().offset(-17)
            make.width.height.equalTo(24)
        }

        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(23)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(closeButton.snp.leading).offset(-10)
        }

        checkLimitButton.snp.makeConstraints { make in
            make.top.equalTo(closeButton.snp.bottom).offset(12)
            make.trailing.equalToSuperview().offset(-17)
            make.height.equalTo(31)
            make.width.equalTo(92)
            make.bottom.equalToSuperview().offset(-19)
        }
    }

    @objc private func handleCloseButton() {
        UIView.animate(withDuration: 0.3) {
            self.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.alpha = 0  // 뷰를 투명하게 만들어 숨김 효과 추가
            self.superview?.layoutIfNeeded()  // 부모 뷰의 레이아웃 업데이트
        } completion: { _ in
            self.isHidden = true  // 애니메이션이 끝난 후 뷰를 숨김
        }
    }
}


