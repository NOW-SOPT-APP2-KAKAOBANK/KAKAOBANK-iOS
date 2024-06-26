import UIKit

import SwiftUI
import SnapKit

final class TipsViewController: UIViewController {

    // MARK: - UI Properties

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    // MARK: - Properties
    
    private var tipsData = TipsModel.dummy()

    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        setCollectionView()
    }
    
}


// MARK: - Private Methods

private extension TipsViewController {
    
    func setStyle() {
        view.backgroundColor = UIColor(resource: .darkgray1)
        collectionView.backgroundColor = UIColor(resource: .darkgray1)
    }
    
    func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(11)
        }
    }
    
    func setHierarchy() {
        view.addSubview(collectionView)
    }
    
    func setCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 11
        layout.itemSize = CGSize(width: 121, height: 127)
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TipsCollectionViewCell.self, forCellWithReuseIdentifier: TipsCollectionViewCell.identifier)
        
        collectionView.showsHorizontalScrollIndicator = false
    }
}


// MARK: - Delegates

extension TipsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

extension TipsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tipsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TipsCollectionViewCell.identifier, for: indexPath) as? TipsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: tipsData[indexPath.item])
        return cell
    }
}
