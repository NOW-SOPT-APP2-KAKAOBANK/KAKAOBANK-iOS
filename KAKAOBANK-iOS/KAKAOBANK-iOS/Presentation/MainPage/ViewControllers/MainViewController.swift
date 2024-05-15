import UIKit
import SwiftUI


class MainViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var mainView: MainView!
    private var HeaderView: HeaderView! 
    private var messageBoxView: MessageBoxView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "darkgray1")
        
        setupScrollView()
        setupMainView()
        setupHeaderView()
        setupMessageBoxView()
    }
    
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    private func setupMainView() {
        mainView = MainView()
        scrollView.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        // 강제로 레이아웃 업데이트
        mainView.setNeedsLayout()
        mainView.layoutIfNeeded()
    }
    
    private func setupHeaderView() {
        HeaderView = KAKAOBANK_iOS.HeaderView()
            HeaderView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(HeaderView)
            
            NSLayoutConstraint.activate([
                HeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                HeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                HeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                HeaderView.heightAnchor.constraint(equalToConstant: 60)
            ])
        }
    
    private func setupMessageBoxView() {
        messageBoxView = MessageBoxView()
        messageBoxView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(messageBoxView)
        
        NSLayoutConstraint.activate([
            messageBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17),
            messageBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -17),
            messageBoxView.topAnchor.constraint(equalTo: HeaderView.bottomAnchor),
            messageBoxView.heightAnchor.constraint(equalToConstant: 99),
            messageBoxView.widthAnchor.constraint(equalToConstant: 341)

        ])
    }
    
}

// 프리뷰
// UIViewController를 SwiftUI에서 사용하기 위한 래퍼
struct MainViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
        MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
        // Update the view controller if needed.
    }
}


// UIView를 SwiftUI에서 사용하기 위한 래퍼
struct MainViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> MainView {
        MainView()
    }
    
    func updateUIView(_ uiView: MainView, context: Context) {
        // Update the view if needed.
    }
}

// SwiftUI Preview Provider for MainViewController
struct MainViewController_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MainViewControllerRepresentable()
                .edgesIgnoringSafeArea(.all)
                .previewDisplayName("MainViewController Preview")
            
            MainViewRepresentable()
                .previewLayout(.fixed(width: 400, height: 1000))
                .previewDisplayName("MainView Preview")
        }
    }
}
