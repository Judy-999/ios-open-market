//
//  ProductViewController.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/27.
//

import UIKit

class ProductManageCollectionViewController: UICollectionViewController {
    // MARK: Inner types
    enum Section: Int ,Hashable {
        case ProductImage
        case ProductInfo
        case ProductDescription
    }
    
    // MARK: Typealias
    typealias DataSource = UICollectionViewDiffableDataSource<Section, Param>
    typealias SnapShot = NSDiffableDataSourceSnapshot<Section, Param>

    // MARK: Properties
    private var dataSource: [UIImage] = []
    private var imagePicker: UIImagePickerController?
    private var imageParams: [ImageParam] = []
    private var viewModeTitle = "상품등록"
    private var productNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureDelegate()
    }
    
//    func changeToEditMode(data: DetailProduct, images: [String]) {
//        productView.configure(data: data)
//        productNumber = data.id
//        images.forEach {
//            guard let cachedImage = ImageCacheManager.shared.object(forKey: NSString(string: $0)) else { return }
//            dataSource.append(cachedImage)
//        }
//        productView.collectionView.reloadData()
//        viewModeTitle = "상품수정"
//    }
    
    func changeToEditMode() {
        
        
        
    }
    
    //MARK: configure
    private func configureUI() {
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonDidTapped))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(updateButtonDidTapped))
        
        navigationItem.title = viewModeTitle
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = doneBarButton
        navigationItem.setHidesBackButton(true, animated: false)
        
        if dataSource.isEmpty {
            guard let addImage = UIImage(systemName: "plus") else { return }
            dataSource.append(addImage)
            configureImagePicker()
        }
    }
    
    private func configureDelegate() {
//        productView.descriptionTextView.delegate = self
    }
    
    private func configureImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker?.sourceType = .photoLibrary
        imagePicker?.allowsEditing = true
        imagePicker?.delegate = self
    }
    
    //MARK: buttonAction
    @objc private func cancelButtonDidTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func updateButtonDidTapped() {
//        let sessionManager = URLSessionManager(session: URLSession.shared)
//        let paramManager = ParamManager()
//        guard let param = productView.createParam() else { return }

        guard param.productName != "", param.price != "", param.description != "" else {
            showAlert(title: "상품 등록 불가", message: "필수 항목을 입력해주십시오.\n(이름, 가격, 설명)")
            return
        }
        
        if viewModeTitle == "상품등록" {
            guard dataSource.count != 1 else {
                showAlert(title: "상품 등록 불가", message: "최소 1장 이상의 사진을 넣어주십시오.")
                return
            }
            
            postParam(paramManager, param, sessionManager)
        } else {
            patchParam(paramManager, param, sessionManager)
        }
    }
    
    // MARK: DataSource
    private func makeDataSource() -> DataSource {
        let infoRegistration = UICollectionView.CellRegistration<DetailInfoCollectionViewCell, Param>.init { cell, indexPath, item in
        }
        
        let imageRegistration = UICollectionView.CellRegistration<DetailImageCollectionViewCell, Param>.init { cell, indexPath, item in
      }
        
        let descriptionRegistration = UICollectionView.CellRegistration<DetailInfoCollectionViewCell, Param>.init { cell, indexPpath, item in
            
        }
        
        return DataSource(collectionView: collectionView) { collectionView, indexPath, item -> UICollectionViewCell? in
            guard let section = Section(rawValue: indexPath.section) else { fatalError("Unknown section") }
            switch section {
            case .ProductImage:
                return collectionView.dequeueConfiguredReusableCell(using: imageRegistration, for: indexPath, item: item)
            case .ProductInfo:
                return collectionView.dequeueConfiguredReusableCell(using: infoRegistration, for: indexPath, item: item)
            case .ProductDescription:
                return collectionView.dequeueConfiguredReusableCell(using: descriptionRegistration, for: indexPath, item: item)
            }
        }
    }
    
    private func patchParam(_ paramManager: ParamManager, _ param: Param, _ sessionManager: URLSessionManager) {
        let dataElement = paramManager.combineParamForPatch(param: param)
        guard let productNumber = productNumber else { return }
        
        sessionManager.patchData(productNumber: productNumber, dataElement: dataElement) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            case .failure(_):
                self.showAlert(title: "실패", message: "상품의 정보를 수정할 수 없습니다.")
            }
        }
    }
    
    private func postParam(_ paramManager: ParamManager, _ param: Param, _ sessionManager: URLSessionManager) {
        let dataElement = paramManager.combineParamForPost(param: param, imageParams: imageParams)
        
        sessionManager.postData(dataElement: dataElement) { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self.showAlert(title: "서버 통신 실패", message: "데이터를 올리지 못했습니다.")
                }
            }
        }
    }
}

//MARK: CollectionView's DataSource & Delegate
extension ProductManageCollectionViewController {
    override func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
//    override func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddProductCollectionViewCell.id, for: indexPath) as? AddProductCollectionViewCell ?? AddProductCollectionViewCell()
//        cell.configureCell(image: dataSource[indexPath.item])
//        return cell
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == dataSource.count - 1 {
            guard let imagePickerCheck = imagePicker else { return }
            self.present(imagePickerCheck, animated: true)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let failureAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "확인", style: .default))
        DispatchQueue.main.async {
            self.present(failureAlert, animated: true)
        }
    }
}

//MARK: imagePickerController
extension ProductManageCollectionViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage = UIImage()
        
        guard dataSource.count != 6 else {
            picker.dismiss(animated: true, completion: nil)
            showAlert(title: "사진 등록 불가능", message: "사진은 최대 5장까지 가능합니다.")
            return
        }
        
        if let newImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = newImage
        } else if let newImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = newImage
        }
        
        let resizedImage = compressImage(selectedImage)
        
        dataSource.insert(selectedImage, at: 0)
        imageParams.append(ImageParam(imageName: "\(dataSource.count - 1)번사진.\(resizedImage.fileExtension)", imageType: resizedImage.fileExtension, imageData: resizedImage))
        
        picker.dismiss(animated: true, completion: nil)
        
        collectionView.reloadData()
    }
    
    private func compressImage(_ image: UIImage) -> Data {
        guard var imageData = image.jpegData(compressionQuality: 1.0) else { return Data() }
        var imageDataSize = imageData.count
        var scale = 0.9
        
        while imageDataSize >= 300 * 1024 {
            imageData = image.jpegData(compressionQuality: scale) ?? Data()
            imageDataSize = imageData.count
            scale -= 0.1
        }
       
        return imageData
    }
    
    // MARK: Layout
    private func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            let section: NSCollectionLayoutSection
            
            switch sectionKind {
            case .ProductImage:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.45))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .groupPagingCentered
                
            case .ProductInfo:
                let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: layoutSize)
                let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.55))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitem: item, count: 1)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                section = NSCollectionLayoutSection(group: group)
                
            case .ProductDescription:
                let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: layoutSize)
                let groupsize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.55))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupsize, subitem: item, count: 1)
                
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                section = NSCollectionLayoutSection(group: group)
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
}

//MARK: ImageDataType
extension Data {
    var fileExtension: String {
        let array = [UInt8](self)
        let ext: String
        switch (array[0]) {
        case 0xFF:
            ext = "jpg"
        case 0x89:
            ext = "png"
        case 0xd8:
            ext = "jpeg"
        default:
            ext = "unknown"
        }
        return ext
    }
}
