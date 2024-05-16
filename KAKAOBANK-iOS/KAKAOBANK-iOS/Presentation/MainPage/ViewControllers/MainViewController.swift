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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierachy()
        setLayout()
        
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor(resource: .darkgray1)
        adView.configure(with: "card_ad_ios")
    }
    
    private func setHierachy() {
        view.addSubview(scrollView)
        addChild(tipsViewController)
        
        scrollView.addSubview(contentView)
        contentView.addSubviews(headerView, messageBoxView, mainAccountView, secondAccountView, thirdAccountView, savingsView, addButtonView, meetingAccountView, simpleBarView, adView, tipsViewController.view)
                

        tipsViewController.didMove(toParent: self)
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
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        messageBoxView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(99)
        }
        
        mainAccountView.snp.makeConstraints {
            $0.top.equalTo(messageBoxView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(177)
        }
        
        secondAccountView.snp.makeConstraints {
            $0.top.equalTo(mainAccountView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(99)
        }
        
        thirdAccountView.snp.makeConstraints {
            $0.top.equalTo(secondAccountView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(140)
        }
        
        savingsView.snp.makeConstraints {
            $0.top.equalTo(thirdAccountView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(85)
        }
        
        meetingAccountView.snp.makeConstraints {
            $0.top.equalTo(savingsView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(62)
        }
        
        addButtonView.snp.makeConstraints {
            $0.top.equalTo(meetingAccountView.snp.bottom).offset(9)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(58)
        }
        
        simpleBarView.snp.makeConstraints {
            $0.top.equalTo(addButtonView.snp.bottom).offset(31)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        tipsViewController.view.snp.makeConstraints {
            $0.top.equalTo(simpleBarView.snp.bottom).offset(4)
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(150)
            $0.width.equalToSuperview()
        }
        
        adView.snp.makeConstraints {
            $0.top.equalTo(simpleBarView.snp.bottom).offset(170)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(17)
            $0.height.equalTo(82)
            $0.bottom.equalToSuperview().offset(-20)
        }

        self.view.layoutIfNeeded()
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
