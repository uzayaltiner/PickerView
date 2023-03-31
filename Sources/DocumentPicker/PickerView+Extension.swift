//
//  DocumentPickerViewExtension.swift
//
//
//  Created by Mert Çetin on 31.03.2023.
//

import Foundation
import MobileCoreServices
import UIKit

public extension UIView {
    private enum AssociatedKeys {
        static var onDocumentPicked: UInt8 = 0
    }

    private var onDocumentPicked: ((URL) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.onDocumentPicked) as? (URL) -> Void
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.onDocumentPicked, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    
    @objc func viewTappedForDocumentPicker(_ sender: UITapGestureRecognizer) {
        if let viewController = sender.view?.findViewController() {
            showDocumentPicker(from: viewController)
        }
    }

    public func setupDocumentPicker(onDocumentPicked: @escaping (URL) -> Void) {
        self.onDocumentPicked = onDocumentPicked
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTappedForDocumentPicker(_:)))
        isUserInteractionEnabled = true
        addGestureRecognizer(tapGestureRecognizer)
    }

    public func showDocumentPicker(from viewController: UIViewController) {
        let documentPickerController = UIDocumentPickerViewController(documentTypes: [kUTTypePDF as String], in: .import)
        documentPickerController.delegate = self

        DispatchQueue.main.async {
            viewController.present(documentPickerController, animated: true, completion: nil)
        }
    }
}

public extension UIView: UIDocumentPickerDelegate {
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        if let selectedURL = urls.first {
            onDocumentPicked?(selectedURL)
        }
        controller.dismiss(animated: true, completion: nil)
    }

    public func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

public extension UIView {
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

