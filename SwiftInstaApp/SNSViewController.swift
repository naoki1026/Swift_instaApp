//
//  SNSViewController.swift
//  SwiftInstaApp
//
//  Created by Naoki Arakawa on 2019/02/25.
//  Copyright © 2019 Naoki Arakawa. All rights reserved.
//

import UIKit

class SNSViewController: UIViewController {
    
    //受け取り用の変数
    var endImage : UIImage = UIImage()
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var endImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        endImageView.image = endImage
    }
    
    
    //UIViewActivityを出す
    @IBAction func post(_ sender: Any) {
        
        //下からピュッと出てくるものを使用する
        //エラーを検知するときに、なぜそのエラーが表示されるのかを検知することができる
        
        do {
            
            let activityViewController = UIActivityViewController(activityItems: [endImage], applicationActivities: nil)
                present(activityViewController, animated: true, completion: nil)
            
        } catch let error {
            
            print(error)
            
        }
        
        
        
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
