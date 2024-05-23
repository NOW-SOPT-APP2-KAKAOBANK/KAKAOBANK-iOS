import UIKit

import SwiftUI
import SnapKit
import Then

class MainViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var headerView = HeaderView()
    private var messageBoxView = MessageBoxView()
    private var mainAccountView = MainAccountView()
    private var secondAccountView = SecondAccountView()
    private var thirdAccountView = ThirdAccountView()
    private var savingsView = SavingsView()
    private var meetingAccountView = MeetingAccountView()
    private var addButtonView = AddButtonView()
    private var simpleBarView = SimpleBarView()
    private var tipsViewController = TipsViewController()
    private var adView = AdView()
    
    private var headerViewTopConstraint: Constraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegate()
        setStyle()
        setHierachy()
        setLayout()
        getAccountInfo()
        
    }
    
    private func setDelegate() {
        scrollView.delegate = self
        mainAccountView.delegate = self
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor(resource: .darkgray1)
        adView.configure(with: "card_ad_ios")
        
        headerView.backgroundColor = UIColor(resource: .darkgray1)
    }
    
    private func setHierachy() {
        view.addSubview(scrollView)
        addChild(tipsViewController)
        
        scrollView.addSubview(contentView)
        contentView.addSubviews(
            messageBoxView,
            mainAccountView,
            secondAccountView,
            thirdAccountView,
            savingsView,
            addButtonView,
            meetingAccountView,
            simpleBarView,
            adView,
            tipsViewController.view)
        
        
        tipsViewController.didMove(toParent: self)
        
        view.addSubview(headerView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        headerView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(0)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(380)
            $0.height.equalTo(118)

        }
        
        messageBoxView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(99)
        }
        
        mainAccountView.snp.makeConstraints {
            $0.top.equalTo(messageBoxView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(177)
        }
        
        secondAccountView.snp.makeConstraints {
            $0.top.equalTo(mainAccountView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(99)
        }
        
        thirdAccountView.snp.makeConstraints {
            $0.top.equalTo(secondAccountView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(140)
        }
        
        savingsView.snp.makeConstraints {
            $0.top.equalTo(thirdAccountView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(85)
        }
        
        meetingAccountView.snp.makeConstraints {
            $0.top.equalTo(savingsView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(62)
        }
        
        addButtonView.snp.makeConstraints {
            $0.top.equalTo(meetingAccountView.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(58)
        }
        
        simpleBarView.snp.makeConstraints {
            $0.top.equalTo(addButtonView.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        tipsViewController.view.snp.makeConstraints {
            $0.top.equalTo(simpleBarView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(14)
            $0.height.equalTo(150)
            $0.width.equalToSuperview()
        }
        
        adView.snp.makeConstraints {
            $0.top.equalTo(simpleBarView.snp.bottom).offset(170)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(341)
            $0.height.equalTo(82)
            $0.bottom.equalToSuperview().offset(-20)
        }
        self.view.layoutIfNeeded()
    }
    
    private func getAccountInfo() {
        NetworkService.shared.mainAccountService.getAccountInfo(accountId: 1) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.mainAccountView.configure(with: response)
                }
            default:
                print("Failed to fetch account info")
            }
        }
        
        NetworkService.shared.mainAccountService.getAccountInfo(accountId: 2) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.secondAccountView.configure(with: response)
                }
            default:
                print("Failed to fetch account info")
            }
        }
        
        NetworkService.shared.mainAccountService.getAccountInfo(accountId: 3) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.thirdAccountView.configure(with: response)
                }
            default:
                print("Failed to fetch account info")
            }
        }
    
    }
}

// UIScrollViewDelegate 구현
extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
            headerViewTopConstraint?.update(offset: max(0, -offsetY))
        
    }
}

extension MainViewController: MainAccountViewDelegate {
    
    func pushToBankAccountVC(sender: UITapGestureRecognizer) {
        let bankAccountVC = BankAccountViewController()
        self.navigationController?.pushViewController(bankAccountVC, animated: true)
    }

}


// 프리뷰를 위한 코드 
struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        MainViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
}


struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MainViewController {
        MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
        
    }
}

// MARK: - Preview Layout Customization
extension MainViewController_Previews {
    static var platform: PreviewPlatform? = .iOS
    static var devices: [String] = ["iPhone 15 Pro"]
}
