//
//  HomeViewController.swift
//  Project-1
//
//  Created by Mac on 26/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func postbtn(_ sender: Any) {
        let mainStoryBoard : ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.navigationController?.pushViewController(mainStoryBoard, animated: true)
    }
    @IBAction func commentsBtn(_ sender: Any) {
        let mainStoryBoard : CommentsViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentsViewController") as! CommentsViewController
        self.navigationController?.pushViewController(mainStoryBoard, animated: true)
    }
}
    
