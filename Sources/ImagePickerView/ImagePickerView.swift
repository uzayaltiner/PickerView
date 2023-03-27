import Foundation
import UIKit

public final class ImagePickerView: UIImageView {
    func showImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary

        if let topViewController = UIApplication.shared.keyWindow?.rootViewController {
            topViewController.present(imagePickerController, animated: true, completion: nil)
        }
    }

    override public func awakeFromNib() {
        super.awakeFromNib()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGestureRecognizer)
    }

    @objc public func imageViewTapped() {
        showImagePicker()
    }
}

extension ImagePickerView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
