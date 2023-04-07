//
//  CommentsViewController.swift
//  Project-1
//
//  Created by Mac on 26/03/23.
//

import UIKit

class CommentsViewController: UIViewController {
    var comments = [Comments]()
    var url : URL?
    var urlsession : URLSession?
    var urlrequest : URLRequest?
    var urlString : String?
    @IBOutlet weak var TableViewComments: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
     fetchCommentsData()
        TableViewComments.delegate = self
        TableViewComments.dataSource = self
        let uiNib = UINib(nibName: "commentsTableViewCell", bundle: nil)
        self.TableViewComments.register(uiNib, forCellReuseIdentifier: "commentsTableViewCell")
    }
    func fetchCommentsData(){
    urlString =  "https://jsonplaceholder.typicode.com/comments"
        url = URL(string: urlString!)
        urlrequest = URLRequest(url: url!)
        urlrequest?.httpMethod = "GET"
        urlsession = URLSession(configuration: .default)
    
        let task = urlsession?.dataTask(with: urlrequest!){ data,response,error in
            print("data")
            print("response")
            print ("error")
            let getJsonObj = try! JSONSerialization.jsonObject(with: data!) as! [[String : Any]]
            for dict in getJsonObj{
                let eachdict = dict as [String : Any]
                let pid = eachdict["id"] as! Int
                let pname = eachdict["name"]as! String
                let pemail = eachdict["email"] as! String
                let pbody = eachdict["body"] as! String
                
                var newComment = Comments(id: pid, name: pname, email: pemail, body: pbody)
                self.comments.append(newComment)
            }
            DispatchQueue.main.async {
                self.TableViewComments.reloadData()
            }
    }
    task?.resume()
}
}

extension CommentsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = TableViewComments.dequeueReusableCell(withIdentifier: "commentsTableViewCell") as! commentsTableViewCell
        cell.idCommLbl.text = String(comments[indexPath.row].id)
        return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryBoard: CommentsDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "CommentsDetailViewController") as! CommentsDetailViewController
          mainStoryBoard.idCommLabel = String(comments[indexPath.row].id)
          mainStoryBoard.nameCommLabel = comments[indexPath.row].name
          mainStoryBoard.bodyCommLabel = comments[indexPath.row].body
          mainStoryBoard.emailCommLabel = comments[indexPath.row].email
          
          self.navigationController?.pushViewController(mainStoryBoard, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160.0
    }
}
