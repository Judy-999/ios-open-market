//
//  ProductViewController.swift
//  OpenMarket
//
//  Created by 주디, 재재 on 2022/07/27.
//

import UIKit

class ProductViewController: UIViewController {
    private let productView = AddProductView()
    private lazy var dataSource = [UIImage(systemName: "plus")]
    let imagePicker = UIImagePickerController()
    
    lazy var textViewConstraint = productView.descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300)
    
    override func loadView() {
        super.loadView()
        view = productView
    }
    
    override func viewDidLoad() {
        let cancelBarButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(goBack))
        let doneBarButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(goBackWithUpdate))
        super.viewDidLoad()
        navigationItem.title = "상품등록"
        navigationItem.leftBarButtonItem = cancelBarButton
        navigationItem.rightBarButtonItem = doneBarButton
        navigationItem.setHidesBackButton(true, animated: false)
        
        productView.collectionView.dataSource = self
        productView.collectionView.delegate = self
        productView.descriptionTextView.delegate = self
       
        configureImagePicker()
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc private func goBackWithUpdate() {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func configureImagePicker() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
    }
}

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddProductViewCell.id, for: indexPath) as? AddProductViewCell ?? AddProductViewCell()
        cell.productImage.image = dataSource[indexPath.item]
        return cell
    }
}

extension ProductViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row != 5 && indexPath.row == dataSource.count - 1 {
            self.present(self.imagePicker, animated: true)
        }
        
        if indexPath.row == 5 {
            showAlert(title: "사진 등록 불가능", message: "사진은 최대 5장까지 가능합니다.")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let failureAlert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        failureAlert.addAction(UIAlertAction(title: "확인", style: .default))
        present(failureAlert, animated: true)
    }
}

extension ProductViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
//        productView.entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
        
        textViewConstraint.isActive = true
        
//         view.frame.size.height -= 300
//        view.frame.origin.y -= 300
        
//        productView.descriptionTextView.setContentOffset(CGPoint(x: 0, y:  productView.descriptionTextView.contentSize.height - productView.descriptionTextView.bounds.height + 300), animated: false)
    }
    
    func textViewDidChange(_ textView: UITextView) {
//        productView.descriptionTextView.setContentOffset(CGPoint(x: 0, y:  productView.descriptionTextView.contentSize.height - productView.descriptionTextView.bounds.height + 300), animated: false)
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
//        productView.entireStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true

        textViewConstraint.isActive = false
        
        
//        view.frame.size.height += 300
//        view.frame.origin.y += 300
        
//        productView.descriptionTextView.setContentOffset(CGPoint(x: 0, y:  productView.descriptionTextView.contentSize.height - productView.descriptionTextView.bounds.height), animated: false)
    }
}

extension ProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var selectedImage: UIImage? = nil
        
        if let newImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            selectedImage = newImage
        } else if let newImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = newImage
        }
    
        dataSource.insert(selectedImage, at: 0)
        picker.dismiss(animated: true, completion: nil)
        productView.collectionView.reloadData()
    }
}


