//
//  ProfileViewController.swift
//  Delivery Tracking
//
//  Created by Koh Boon Yeow on 2022/4/22.
//

import UIKit

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate,
                             UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
            profileImage.image = UIImage(named: "profilePic.png")
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBAction func addPicture(_ sender: Any) {
        let alertController = UIAlertController(title: "Add Profile Picture", message: "", preferredStyle: .alert)
        let camera = UIAlertAction(title: "Camera", style: .default) { (aciton) in
            
            let picker = UIImagePickerController()
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    picker.allowsEditing = false
                    picker.sourceType = UIImagePickerController.SourceType.camera
                    picker.cameraCaptureMode = .photo
                    picker.modalPresentationStyle = .fullScreen
                    self.present(picker,animated: true,completion: nil)
                } else {
                    print("No camera")
    
            }
        }
        
        let serachAction = UIAlertAction(title: "Photos", style: .default) { (aciton) in
            // load image

            let photoPicker = UIImagePickerController()
            photoPicker.delegate = self
            photoPicker.sourceType = .photoLibrary
            // display image selection view
            self.present(photoPicker, animated: true, completion: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
        }
        
        alertController.addAction(serachAction)
        alertController.addAction(camera)
        alertController.addAction(cancelAction)
        
            
            self.present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
// Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

                
                picker .dismiss(animated: true, completion: nil)
                profileImage.image=info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        
    }
    
    fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
        return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
    }

    // Helper function inserted by Swift 4.2 migrator.
    fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
        return input.rawValue
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
