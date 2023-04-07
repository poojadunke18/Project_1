//
//  CommentsDetailViewController.swift
//  Project-1
//
//  Created by Mac on 26/03/23.
//

import UIKit

class CommentsDetailViewController: UIViewController {
    var idCommLabel : String = ""
    var nameCommLabel : String = ""
    var emailCommLabel : String = ""
    var bodyCommLabel : String = ""
    
    @IBOutlet weak var idcommLbl: UILabel!
    @IBOutlet weak var namecommLbl: UILabel!
    @IBOutlet weak var emailcommLbl: UILabel!
    @IBOutlet weak var bodycommLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        idcommLbl.text = idCommLabel
        namecommLbl.text = nameCommLabel
        emailcommLbl.text = emailCommLabel
        bodycommLbl.text = bodyCommLabel
        
    }
}
