//
//  PostDetailViewController.swift
//  Project-1
//
//  Created by Mac on 13/03/23.
//

import UIKit

class PostDetailViewController: UIViewController {
    
    var postidLabel : String = ""
    var postbodyLabel : String = ""
    var posttitleLabel : String = ""
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        idLabel.text = postidLabel
        bodyLabel.text = postbodyLabel
        titleLabel.text = posttitleLabel

    }
    

}
