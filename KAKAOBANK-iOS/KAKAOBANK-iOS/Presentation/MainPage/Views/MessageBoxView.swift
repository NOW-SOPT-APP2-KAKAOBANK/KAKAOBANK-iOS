import UIKit

import SnapKit
import Then

final class MessageBoxView: UIView {
    
    // MARK: - UI Properties

    private var messageLabel = UILabel()
    private var closeButton = UIButton()
    private var checkLimitButton = UIButton()
    
    
    // MARK: - Properties

    var heightConstraint: Constraint?


    // MARK: - Life Cycles
    
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

}


// MARK: - Private Methods

private extension MessageBoxView {
    
    func setHierachy() {
        addSubviews(messageLabel, closeButton, checkLimitButton)
    }

    func setStyle() {
        backgroundColor = UIColor(resource: .darkgray0)
        layer.cornerRadius = 10
        layer.masksToBounds = true

        messageLabel.do {
            $0.textColor = UIColor(resource: .white)
            $0.attributedText = UILabel.attributedText(for: .subTitle2, withText: "김미정님의 신용점수는\n대출 승인 가능성이 높아요")
            $0.numberOfLines = 0
        }

        closeButton.do {
            $0.setImage(UIImage(named: "icn_x_ios"), for: .normal)
            $0.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        }

        checkLimitButton.do {
            $0.setTitleColor(UIColor(resource: .black2), for: .normal)
            $0.backgroundColor = UIColor(resource: .yellow0)
            let attributedText = UILabel.attributedText(for: .subTitle2, withText: "한도 확인하기")
            $0.setAttributedTitle(attributedText, for: .normal)
            $0.layer.cornerRadius = 15
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

    @objc
    func handleCloseButton() {
        UIView.animate(withDuration: 0.3) {
            self.snp.updateConstraints { make in
                make.height.equalTo(0)
            }
            self.alpha = 0
            self.superview?.layoutIfNeeded()
        } completion: { _ in
            self.isHidden = true
        }
    }
}

