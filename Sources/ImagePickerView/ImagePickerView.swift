import Foundation
import UIKit

public final class ImagePickerView: UIImageView {
    // MARK: - Properties -

    public var placeholderImage: UIImage? {
        didSet {
            image = placeholderImage
        }
    }

    public var color: UIColor? {
        didSet {
            backgroundColor = color
        }
    }

    public var cornerRadius: CGFloat? {
        didSet {
            layer.cornerRadius = cornerRadius ?? 0
        }
    }

    /// Determines what happens after the image is selected and returns a UIImage.
    public var onImagePicked: ((UIImage) -> Void)?
    public init() {
        super.init(frame: .zero)
        setupTapGestureRecognizer()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func awakeFromNib() {
        super.awakeFromNib()
        setupTapGestureRecognizer()
    }

    private func setupTapGestureRecognizer() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGestureRecognizer)
    }

    public func showImagePicker() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary

        if let topViewController = findViewController() {
            DispatchQueue.main.async {
                topViewController.present(imagePickerController, animated: true, completion: nil)
            }
        }
    }

    @objc public func imageViewTapped() {
        showImagePicker()
    }
}

extension ImagePickerView: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = selectedImage
            onImagePicked?(selectedImage)
        }
        picker.dismiss(animated: true, completion: nil)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

private extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}
