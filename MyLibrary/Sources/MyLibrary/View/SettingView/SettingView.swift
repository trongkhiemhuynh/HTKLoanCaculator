//
//  SwiftUIView.swift
//  
//
//  Created by Khiem Huynh on 5/9/24.
//

import SwiftUI
import SnapKit

public struct SettingView: View {
    public init() {}
    public var body: some View {
        Text("setting view loading ...")
    }
}

//#Preview {
//    SwiftUIView()
//}

/**
 - important: Using Snapkit building UI
 - returns: collection view UI - header - avatar -
 */
public class SettingViewController: UIViewController {
//    public init() {
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero)
//        view.delegate = self
//        view.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: self.view.frame.width/2 - 20, height: self.view.frame.width/2 - 20)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .vertical
        
        view.collectionViewLayout = layout
        
        return view
    }()
    
    var cellView: SettingCell {
        let cell = SettingCell()
        
        return cell
    }
    
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Flower>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Flower>
    
    private lazy var dataSource = makeDataSource()
    
    var flowers = Flower.allFlowers()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        // FIXME: crash collectionview which init
//        self.addViews()
//        self.configureLayout()
//        self.applySnapshot()
    }
    
    private func configureLayout() {
        self.collectionView.register(SettingCell.self, forCellWithReuseIdentifier: "cell")
        
        
    }
    
    private func addViews() {
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints { make in
            make.leadingMargin.trailingMargin.topMargin.bottomMargin.equalToSuperview()
        }
    }
    
    private func applySnapshot(animatingDifferences: Bool = true) {
        var snapshot = Snapshot()
        
        snapshot.appendItems(flowers, toSection: nil)
        
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}

//extension SettingViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return self.flowers.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = UICollectionViewCell()
//        
//        return cell
//    }
//}

extension SettingViewController {
    func makeDataSource() -> DataSource {
        let dataSource = DataSource(collectionView: self.collectionView) { collectionView, indexPath, flower in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? SettingCell
            cell?.lblName.text = flower.name
            cell?.lblDescription.text = flower.description

            if let url = URL(string: flower.imageName) {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    cell?.imgBackground.image = image
                } catch {
                    cell?.imgBackground.backgroundColor = .gray
                }
                    
            }
            
            return cell
        }
        
        return dataSource
    }
}


class Flower: Hashable {
    var id = UUID()
    var name: String
    var description: String
    var imageName: String
    
    init(name: String, description: String, imageName: String) {
        self.name = name
        self.description = description
        self.imageName = imageName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Flower, rhs: Flower) -> Bool {
        lhs.id == rhs.id
    }
}

//extension Flower {
//    static func allFlowers() -> [Flower] {
//        return [Flower(name: "", description: <#T##String#>, imageName: <#T##String#>)]
//    }
//}

//MARK: - Dummy Data
extension Flower {
    static func allFlowers() -> [Flower] {
        var flowers: [Flower] = []
        
        let item1 = Flower(name: "African Daisy", description: "Gazania", imageName: "https://thumb.photo-ac.com/a0/a07be9695c8735b48e43352552177506_t.jpeg")
        flowers.append(item1)
        
        let item2 = Flower(name: "Begonia", description: "Begoniaceae", imageName: "https://images.squarespace-cdn.com/content/v1/65e82bfa342b7527b67b826f/1728611103954-EMOCNWJGP5B2M92OL0HF/processed_9abc64a45f3e4ec28a3254074f2edf11.jpeg?format=1000w")
        flowers.append(item2)
        
        let item3 = Flower(name: "California Poppy", description: "Eschscholzia californica", imageName: "https://images.squarespace-cdn.com/content/v1/55d9e933e4b004326c39c4f9/1642704074360-6X2DPXHLN0VCWIX5NSL3/California+Poppy.jpeg?format=1500w")
        flowers.append(item3)
        
        let item4 = Flower(name: "Day Lily", description: "Hemerocallis", imageName: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS5j__4WwKbG1MFX2yUlFvIdY_eRlVW_x6mMA&s")
        flowers.append(item4)
        
        let item5 = Flower(name: "Erigeron", description: "Seaside Daisy", imageName: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQvBYnFMRzrVtYJNxiUN-EMCxKtOSFtAtU-Q&s")
        flowers.append(item5)
        
        let item6 = Flower(name: "Meconopsis", description: "Blue Himalayan Poppy", imageName: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4arF9Qff9vSf6-J2yl6DU79UO1C0fAF5Hcg&s")
        flowers.append(item6)
        
        let item7 = Flower(name: "Osteospermum", description: "Calendula Family, Cape Daisy", imageName: "https://images.squarespace-cdn.com/content/v1/50ed78abe4b0a16d22fbfbca/1587568483961-YJWQHA6NKAMVU48TQIH1/Osteospermum.JPEG?format=1000w")
        flowers.append(item7)
        
        let item8 = Flower(name: "Violet", description: "Violaceae Family", imageName: "https://media.istockphoto.com/id/108622864/photo/violets.jpg?s=612x612&w=0&k=20&c=m3G-1uyEjSKd4ajTeCy2nvon4kdOd2VgQ6ZobDAfbsg=")
        flowers.append(item8)
        
        let item9 = Flower(name: "Yellow Bell", description: "Golden Trumpet", imageName: "https://saavedraeightes.wordpress.com/wp-content/uploads/2012/10/url.jpeg")
        flowers.append(item9)
        
        let item10 = Flower(name: "Gladiolus", description: "Iris Family", imageName: "https://as1.ftcdn.net/v2/jpg/02/20/26/16/1000_F_220261658_goMSpdrh1PFlQcjAoLvP71a6bCWkPwRw.jpg")
        flowers.append(item10)
        
        return flowers
    }
}

enum Section {
    case main
}

class SettingCell: UICollectionViewCell {
    let lblName: UILabel = {
        let lblName = UILabel()
        lblName.translatesAutoresizingMaskIntoConstraints = false
        return lblName
    }()
    
    let lblDescription: UILabel = {
        let lblDescription = UILabel()
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        return lblDescription
    }()
    
    let imgBackground: UIImageView = {
        let imgBackground = UIImageView()
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
        return imgBackground
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        addSubview(self.lblName)
        addSubview(self.lblDescription)
        addSubview(self.imgBackground)
        
        self.lblName.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.lblDescription.snp.makeConstraints { make in
            make.top.equalTo(self.lblName).offset(10)
            make.centerX.equalTo(self)
        }
        
        self.imgBackground.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
}

public struct SettingsView: UIViewControllerRepresentable {
    public init() {
        
    }
    public func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    public func makeUIViewController(context: Context) -> some UIViewController {
        SettingViewController()
    }
}
