import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    
    private var scrollView = UIScrollView()
    
    private var headerView = HeaderView()
    private var messageBoxView = MessageBoxView()
    private var mainAccountView = MainAccountView()
    private var secondAccountView = SecondAccountView()
    private var thirdAccountView = ThirdAccountView()
    private var savingsView = SavingsView()
    private var meetingAccountView = MeetingAccountView()
    private var addButtonView = AddButtonView()
    private var simpleBarView = SimpleBarView()
    
    private var adView = AdView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierachy()
        setLayout()
        
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor(named: "darkgray1")
        
        adView.configure(with: "card_ad_ios")
    }
    
    private func setHierachy() {
        view.addSubview(scrollView)
        
        scrollView.addSubviews(headerView, messageBoxView, mainAccountView, secondAccountView, thirdAccountView, savingsView, addButtonView, meetingAccountView, simpleBarView, adView)
        
    }
    
    private func setLayout() {
        
        

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(0)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(60)
        }
    
        messageBoxView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(99)
        }
    
        mainAccountView.snp.makeConstraints { make in
            make.top.equalTo(messageBoxView.snp.bottom).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(177)
        }

        secondAccountView.snp.makeConstraints { make in
            make.top.equalTo((mainAccountView.snp.bottom)).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(99)
        }

        thirdAccountView.snp.makeConstraints { make in
            make.top.equalTo((secondAccountView.snp.bottom)).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(140)
        }
        
        savingsView.snp.makeConstraints { make in
            make.top.equalTo((thirdAccountView.snp.bottom)).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(85)
        }
        
        meetingAccountView.snp.makeConstraints { make in
            make.top.equalTo((savingsView.snp.bottom)).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(62)
        }
        
        addButtonView.snp.makeConstraints { make in
            make.top.equalTo((meetingAccountView.snp.bottom)).offset(9)
            make.centerX.equalToSuperview()
            make.width.equalTo(341)
            make.height.equalTo(58)
//            make.bottom.equalToSuperview().offset(-20)
        }
        
        simpleBarView.snp.makeConstraints { make in
            make.top.equalTo((addButtonView.snp.bottom)).offset(31)
            make.centerX.equalToSuperview()
//            make.width.equalTo(164)
            make.height.equalTo(44)
//            make.bottom.equalToSuperview().offset(-20)
            
        }
        
        adView.snp.makeConstraints { make in
            make.top.equalTo((simpleBarView.snp.bottom)).offset(187)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(17)
            make.width.equalTo(341)
            make.height.equalTo(82)
            make.bottom.equalToSuperview().offset(-20)
            
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
