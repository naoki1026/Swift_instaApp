//
//  FilterViewController.swift
//  SwiftInstaApp
//
//  Created by Naoki Arakawa on 2019/02/25.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit
import CoreImage

class FilterViewController: UIViewController {
    
    var ciContext : CIContext!
    var passImage : UIImage = UIImage()
    
    
    @IBOutlet weak var editImageView: UIImageView!
    
    @IBOutlet weak var sc: UIScrollView!
    
    var vc = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        editImageView.image = passImage
        
        //これで透明にすることができる
      sc.backgroundColor = UIColor.clear
        
        vc.frame = CGRect(x: 0, y: 0, width: 800, height: 80)
        
        for i in 0 ..< 6 {
            
        let button : UIButton = UIButton()
        button.frame = CGRect(x: (i*80), y: 0, width: 80, height: 80)
            
         button.tag = i
            let buttonImage:UIImage = UIImage(named: String(i))!
            button.setImage(buttonImage, for: UIControl.State.normal)
            
            button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
            vc.addSubview(button)
            
        }
        
        sc.addSubview(vc)
        sc.contentSize = vc.bounds.size
        
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonTap(sender:UIButton){
        
        if sender.tag == 0{
            editImageView.image = passImage
            filter1()
            
        } else if sender.tag == 1 {
            editImageView.image = passImage
            filter2()
            
            
        } else if sender.tag == 2 {
            editImageView.image = passImage
            filter3()
            
            
        } else if sender.tag == 3 {
            editImageView.image = passImage
            filter4()
            
            
        } else if sender.tag == 4 {
            editImageView.image = passImage
            filter5()
            
            
        } else if sender.tag == 5 {
            editImageView.image = passImage
            filter6()
            
        
        
        } else if sender.tag == 6 {
            editImageView.image = passImage
     
        
        }

    }
    
    //フィルターのメソッドたち
    
    func filter1(){
        
        // image が 元画像のUIImage
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CISepiaTone")!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(0.8, forKey: "inputIntensity")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        
        editImageView.image = image2
        
        
    }
    
    
    
    func filter2(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIColorMonochrome")!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIColor(red: 0.75, green: 0.75, blue: 0.75), forKey: "inputColor")
        ciFilter.setValue(1.0, forKey: "inputIntensity")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        editImageView.image = image2
        
    }
    
    func filter3(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIFalseColor" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIColor(red: 0.44, green: 0.5, blue: 0.2), forKey: "inputColor0")
        ciFilter.setValue(CIColor(red: 1, green: 0.92, blue: 0.50), forKey: "inputColor1")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        editImageView.image = image2
        
    }
    
    func filter4(){
        
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIColorControls" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(1.0, forKey: "inputSaturation")
        ciFilter.setValue(0.5, forKey: "inputBrightness")
        ciFilter.setValue(3.0, forKey: "inputContrast")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        editImageView.image = image2
        
    }
    
    func filter5(){
        
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIToneCurve" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(CIVector(x: 0.0, y: 0.0), forKey: "inputPoint0")
        ciFilter.setValue(CIVector(x: 0.25, y: 0.1), forKey: "inputPoint1")
        ciFilter.setValue(CIVector(x: 0.5, y: 0.5), forKey: "inputPoint2")
        ciFilter.setValue(CIVector(x: 0.75, y: 0.9), forKey: "inputPoint3")
        ciFilter.setValue(CIVector(x: 1.0, y: 1.0), forKey: "inputPoint4")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        editImageView.image = image2
        
    }
    
    func filter6(){
        let ciImage:CIImage = CIImage(image:editImageView.image!)!;
        let ciFilter:CIFilter = CIFilter(name: "CIHueAdjust" )!
        ciFilter.setValue(ciImage, forKey: kCIInputImageKey)
        ciFilter.setValue(3.14, forKey: "inputAngle")
        self.ciContext = CIContext(options: nil)
        let cgimg:CGImage = ciContext.createCGImage(ciFilter.outputImage!, from:ciFilter.outputImage!.extent)!
        //image2に加工後のUIImage
        let image2:UIImage = UIImage(cgImage: cgimg, scale: 1.0, orientation:UIImage.Orientation.right)
        editImageView.image = image2
        
        
    }

 
    @IBAction func next(_ sender: Any) {
        
        //この１行で画面遷移を行うことができる
        performSegue(withIdentifier: "end", sender: nil)
   
    
    }
    
    //値を渡しながら画面遷移を行う
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "end" {
            
            //遷移先のファイル名を変数にする
            let snsVc : SNSViewController = segue.destination as! SNSViewController
            
            snsVc.endImage = editImageView.image!
            
        }
    
    
    }
    
    
    
    
    
    
}
