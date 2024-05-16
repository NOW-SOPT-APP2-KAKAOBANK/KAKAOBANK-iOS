//
//  SegmentView.swift
//  KAKAOBANK-iOS
//
//  Created by 윤희슬 on 5/15/24.
//

import UIKit

import SnapKit
import Then

final class SegmentView: UISegmentedControl {

    // MARK: - UI Properties
    
    private let underline = UIView()
    
    
    // MARK: - Properties
    

    
    // MARK: - UI Properties
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        
        setHierarchy()
        removeBackgroundAndDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUnderline()
    }
    
    func setUnderline() {
        underline.backgroundColor = UIColor(resource: .gray7)
        
        let width = self.widthForSegment(at: self.selectedSegmentIndex)
        let height = CGFloat(3)

        let xPosition = width * CGFloat(self.selectedSegmentIndex)
        let yPosition = self.frame.height - height
        
        UIView.animate(withDuration: 0.1) {
            self.underline.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        }
        
    }
}


// MARK: - UI Properties

private extension SegmentView {
    
    func setHierarchy() {
        self.addSubview(underline)
    }
    
    func removeBackgroundAndDivider() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .normal, barMetrics: .default)
        self.setBackgroundImage(image, for: .selected, barMetrics: .default)
        self.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
        self.setDividerImage(image, forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
}
