//
//  ViewController.swift
//  Project-1
//
//  Created by Mac on 13/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var PostsCollectionView: UICollectionView!
    var posts = [Posts]()
    var url : URL?
    var urlsession : URLSession?
    var urlrequest : URLRequest?
    var urlString : String?
    override func viewDidLoad() {
        super.viewDidLoad()
           
            PostsCollectionView.delegate = self
            PostsCollectionView.dataSource = self
            let uiNib = UINib(nibName: "postsCollectionViewCell", bundle: nil)
            self.PostsCollectionView.register(uiNib, forCellWithReuseIdentifier: "postsCollectionViewCell")
           fetchPostdata()
            print("Successful")
        
    }
    func fetchPostdata(){
        urlString =  "https://jsonplaceholder.typicode.com/posts"
        url = URL(string: urlString!)
        urlrequest = URLRequest(url: url!)
        urlrequest?.httpMethod = "GET"
        urlsession = URLSession(configuration: .default)
    
        let task = urlsession?.dataTask(with: urlrequest!){ data,response,error in
            print("data")
            print("response")
            print ("error")
            
            var getJsonobj = try! JSONSerialization.jsonObject(with: data!) as! [[String: Any]]
            for dict in getJsonobj {
                let eachdict = dict as [String: Any]
                let pid = eachdict["id"] as! Int
                let ptitle = eachdict["title"] as! String
                let pbody = eachdict["body"] as! String
              var newpost = Posts(id: pid, title: ptitle, body: pbody)
                self.posts.append(newpost)
                
            }
        
            DispatchQueue.main.async {
        self.PostsCollectionView.reloadData()
            
            }
        }
    task?.resume()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     
       let mainStoryboard: PostDetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailViewController") as! PostDetailViewController
       mainStoryboard.postidLabel = String(posts[indexPath.row].id)
       mainStoryboard.posttitleLabel = posts[indexPath.row].title
       mainStoryboard.postbodyLabel = posts[indexPath.row].body
      
        self.navigationController?.pushViewController(mainStoryboard, animated: true)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100 , height: 100 )
      /*  let collectionWidth = PostsCollectionView.bounds.width
        return CGSize(width: collectionWidth/3, height: collectionWidth/3) */
      /* return CGSize(width: PostsCollectionView.frame.size.width/1, height: PostsCollectionView.frame.size.height/1)  */
    }
    
  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 50
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    } */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PostsCollectionView.dequeueReusableCell(withReuseIdentifier: "postsCollectionViewCell", for: indexPath) as! postsCollectionViewCell
      
        cell.idLabel.text = String(posts[indexPath.row].id)
        let numberofItemperRow: CGFloat = 3
        let spacingBetweenCells: CGFloat = 5
       
        return cell
    }
   

}




