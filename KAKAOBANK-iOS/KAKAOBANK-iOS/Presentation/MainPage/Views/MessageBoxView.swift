import UIKit

class MessageBoxView: UIView {
    var heightConstraint: NSLayoutConstraint?
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "김미정님의 신용점수는\n 대출 승인 가능성이 높아요"
        label.textColor = UIColor(named: "white")
//        label.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        label.font = UIFont.pretendard(.subTitle2)
        label.numberOfLines = 0  // 여러 줄 표시 가능하도록 설정
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icn_x_ios"), for: .normal)
        return button
    }()
    
    private let checkLimitButton: UIButton = {
        let button = UIButton()
        button.setTitle("한도 확인하기", for: .normal)
        button.setTitleColor(UIColor(named: "black2"), for: .normal)
        button.backgroundColor = UIColor(named: "yellow0")  // Assets에서 색상 사용
//        button.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        button.titleLabel?.font = UIFont.pretendard(.subTitle2)
        button.layer.cornerRadius = 15  // 버튼 모서리 둥글게
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setCloseButtonAction()
        configureHeightConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setViews()
        setCloseButtonAction()
        configureHeightConstraint()
    }
    
    private func setViews() {
        backgroundColor = UIColor(named: "darkgray0")  // Assets에서 배경색 설정
        layer.cornerRadius = 10  // 모서리 둥글게 설정
        layer.masksToBounds = true  // 둥근 모서리가 콘텐츠를 넘지 않도록
        
        addSubviews(messageLabel, closeButton, checkLimitButton)
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        checkLimitButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 13),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            closeButton.widthAnchor.constraint(equalToConstant: 24),
            closeButton.heightAnchor.constraint(equalToConstant: 24),
            
            messageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 23),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: closeButton.leadingAnchor, constant: -10),
            
            checkLimitButton.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 12),
            checkLimitButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17),
            checkLimitButton.heightAnchor.constraint(equalToConstant: 31),
            checkLimitButton.widthAnchor.constraint(equalToConstant: 92),
            checkLimitButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -19)
        ])
    }
    
    private func setCloseButtonAction() {
        closeButton.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
    }
    
    private func configureHeightConstraint() {
        self.heightConstraint = self.heightAnchor.constraint(equalToConstant: 99) // 초기 높이
        self.heightConstraint?.isActive = true
    }
    
    @objc private func handleCloseButton() {
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint?.constant = 0  // 높이를 0으로 설정
            self.alpha = 0  // 뷰를 투명하게 만들어 숨김 효과 추가
            self.superview?.layoutIfNeeded()  // 부모 뷰의 레이아웃 업데이트
        } completion: { _ in
            self.isHidden = true  // 애니메이션이 끝난 후 뷰를 숨김
        }
    }
}
