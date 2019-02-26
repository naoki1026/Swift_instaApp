//
//  ViewController.swift
//  SwiftInstaApp
//
//  Created by Naoki Arakawa on 2019/02/25.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import Photos


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //隣の画面のUIImageViewに表示させるため
    var saveImage : UIImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // ユーザーに許可を促す.
        PHPhotoLibrary.requestAuthorization { (status) in
            
            switch(status) {
                
            case .authorized: break
            case .denied: break
            case .notDetermined: break
            case .restricted: break
                
            }
        }

    }

    //カメラを開く
    @IBAction func openCamera(_ sender: Any) {
        
        let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.camera
        
        //カメラが利用可能であるかのチェック
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            
            //インスタンスの作成
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            
            //最後の１行でカメラを呼び出していて、その上は下準備である
            self.present(cameraPicker, animated: true, completion: nil)
            
        } else {
            
            print("エラー")

    }
  }
    
    
    //画面遷移のコード
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "next"){
            
            let subVC : FilterViewController = segue.destination as! FilterViewController
            
            //saveImageをsubVCのpassImageの中に入れている
            subVC.passImage = saveImage
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if (info[ .originalImage] as? UIImage) != nil
        {
            saveImage = info[.originalImage] as! UIImage
            
            //閉じる処理
            picker.dismiss(animated: true, completion: nil)
            
            //画面遷移
            performSegue(withIdentifier: "next", sender: nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
        //アルバムを開く
        @IBAction func openAlbum(_ sender: Any) {
            
            let sourceType: UIImagePickerController.SourceType = UIImagePickerController.SourceType.photoLibrary
            
            //カメラが利用可能であるかのチェック
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
                
                //インスタンスの作成
                let cameraPicker = UIImagePickerController()
                cameraPicker.sourceType = sourceType
                cameraPicker.delegate = self
                
                //最後の１行でカメラを呼び出していて、その上は下準備である
                self.present(cameraPicker, animated: true, completion: nil)
                
            } else {
                
                print("エラー")

                
            }
            
        }
    
}
