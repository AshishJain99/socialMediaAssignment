//
//  OpenGallary.swift
//  socialMediaAssignment
//
//  Created by Ashish Jain on 31/03/24.
//

import UIKit
import PhotosUI

class ImagePicker: NSObject, PHPickerViewControllerDelegate {
    
    private var picker: PHPickerViewController?
    private var presentationController: UIViewController?
    private var completionHandler: ((UIImage?) -> Void)?
    
    func present(from viewController: UIViewController, completionHandler: @escaping (UIImage?) -> Void) {
        self.presentationController = viewController
        self.completionHandler = completionHandler
        
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        configuration.selectionLimit = 1
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        viewController.present(picker, animated: true, completion: nil)
        
        self.picker = picker
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        presentationController?.dismiss(animated: true, completion: nil)
        
        guard let completionHandler = completionHandler else { return }
        guard let result = results.first else {
            completionHandler(nil)
            return
        }
        
        result.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
            DispatchQueue.main.async {
                if let image = image as? UIImage {
                    completionHandler(image)
                } else {
                    completionHandler(nil)
                }
            }
        }
    }
}
