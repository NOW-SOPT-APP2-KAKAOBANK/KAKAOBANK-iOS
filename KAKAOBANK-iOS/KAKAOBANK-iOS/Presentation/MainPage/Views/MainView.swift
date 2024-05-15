import UIKit

class MainView: UIView {
    
    private let contentHeight: CGFloat = 2000
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // 배경색 설정
        backgroundColor = UIColor(hex: "#282A31")
        
        // ContentView가 Clip 되도록
        self.clipsToBounds = true
        
        for i in 0..<50 {
            let label = UILabel()
            label.frame = CGRect(x: 20, y: i * 40, width: Int(self.bounds.width - 40), height: 30)
            label.text = "Label \(i + 1)"
            label.textColor = .white
            addSubview(label)
        }
        
        // View의 높이를 label이 모두 포함될 수 있게 설정
        let totalHeight = CGFloat(50 * 40)
        self.frame.size.height = totalHeight
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
