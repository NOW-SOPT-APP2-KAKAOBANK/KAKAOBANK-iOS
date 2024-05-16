import UIKit
import SnapKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let iconNames = ["icn_pig_ios", "icn_scale_ios", "icn_coupon_ios"]
    let titles = ["매일 오토 벌기", "시용대출 비교하기", "쿠폰 사용권"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setDelegate()
    }

    private func setCollectionView() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .white
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(width: 120, height: 100)
        }
    }

    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as! CollectionViewCell
        cell.iconImageView.image = UIImage(named: iconNames[indexPath.item])
        cell.titleLabel.text = titles[indexPath.item]
        return cell
    }
}
