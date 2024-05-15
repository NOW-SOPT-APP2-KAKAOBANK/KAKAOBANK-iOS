import UIKit
import SwiftUI
import SnapKit

class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView?
    private var headerView: HeaderView?
    private var messageBoxView: MessageBoxView?
    private var mainAccountView: MainAccountView?
    private var secondAccountView: SecondAccountView?
    private var thirdAccountView: ThirdAccountView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "darkgray1")
        
        scrollView = UIScrollView()
        headerView = HeaderView()
        messageBoxView = MessageBoxView()
        mainAccountView = MainAccountView()
        secondAccountView = SecondAccountView()
        thirdAccountView = ThirdAccountView()
        
        setViews()
    }
    
    private func setViews() {
        // ScrollView의 기본 설정을 합니다.
        if let scrollView = scrollView {
            
            view.addSubview(scrollView)
            scrollView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
        }
        
        if let headerView = headerView {
            scrollView?.addSubview(headerView)
            headerView.snp.makeConstraints { make in
                make.top.equalToSuperview().offset(0)
                make.centerX.equalToSuperview()
                make.width.equalToSuperview()
                make.height.equalTo(60)
            }
        }
    
        // MessageBoxView를 HeaderView 아래에 위치시키고 중앙 정렬합니다.
        if let messageBoxView = messageBoxView, let headerView = headerView {
            scrollView?.addSubview(messageBoxView)
            messageBoxView.snp.makeConstraints { make in
                make.top.equalTo(headerView.snp.bottom)
                make.centerX.equalToSuperview()
                make.width.equalTo(341)
                make.height.equalTo(99)
            }
        }
        
        // Account views를 추가하고 중앙 정렬합니다.
        if let mainAccountView = mainAccountView {
            scrollView?.addSubview(mainAccountView)
            mainAccountView.snp.makeConstraints { make in
                make.top.equalTo(messageBoxView?.snp.bottom ?? scrollView!.snp.top).offset(9)
                make.centerX.equalToSuperview()
                make.width.equalTo(341)
                make.height.equalTo(177)
            }
        }
        
        if let secondAccountView = secondAccountView {
            scrollView?.addSubview(secondAccountView)
            secondAccountView.snp.makeConstraints { make in
                make.top.equalTo((mainAccountView?.snp.bottom)!).offset(9)
                make.centerX.equalToSuperview()
                make.width.equalTo(341)
                make.height.equalTo(99)
            }
        }
        
        if let thirdAccountView = thirdAccountView {
            scrollView?.addSubview(thirdAccountView)
            thirdAccountView.snp.makeConstraints { make in
                make.top.equalTo((secondAccountView?.snp.bottom)!).offset(9)
                make.centerX.equalToSuperview()
                make.width.equalTo(341)
                make.height.equalTo(140)
            }
        }
    
    // 마지막으로 스크롤 뷰의 contentSize를 동적으로 조절하기 위해 마지막 요소에 대한 처리
        if let lastView = thirdAccountView ?? secondAccountView ?? mainAccountView ?? messageBoxView ?? headerView {
            scrollView?.contentSize = CGSize(width: view.frame.width, height: lastView.frame.maxY)
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
