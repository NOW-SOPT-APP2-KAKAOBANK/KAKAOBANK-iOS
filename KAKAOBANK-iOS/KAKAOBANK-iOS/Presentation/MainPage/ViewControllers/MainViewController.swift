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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierachy()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor(named: "darkgray1")
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
        

        self.view.layoutIfNeeded()
    }
    
    private func setHierachy() {
        view.addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.addSubview(messageBoxView)
        scrollView.addSubview(mainAccountView)
        scrollView.addSubview(secondAccountView)
        scrollView.addSubview(thirdAccountView)
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
