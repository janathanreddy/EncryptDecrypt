//
//  ParalleleffectViewController.swift
//  EncryptDecrypt
//
//  Created by Janarthan Subburaj on 11/01/21.
//

import UIKit
struct structscrolldata{
    let title: String?
    let image: UIImage?
}
class ParalleleffectViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var scrolldata = [structscrolldata]()
     var tagValue = 10
    var viewtagValue = 10
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        scrolldata = [structscrolldata.init(title: "first", image: #imageLiteral(resourceName: "first")),structscrolldata.init(title: "second", image: #imageLiteral(resourceName: "second"))]
        scrollView.contentSize.width = self.scrollView.frame.width * CGFloat(scrolldata.count)
        var i = 0
        for data in scrolldata{
            let view = CustomView(frame: CGRect(x: 10 + (self.scrollView.frame.width * CGFloat(i)), y: 80, width: self.scrollView.frame.width - 20, height: self.scrollView.frame.height))
            view.imageView.image = data.image
            view.tag = i + viewtagValue
            self.scrollView.addSubview(view)
            let label = UILabel(frame: CGRect.init(origin: CGPoint.init(x: 0, y:20), size: CGSize.init(width: 0, height: 40)))
            label.text = data.title
            view.tag = i + tagValue
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.textColor = UIColor.black
            label.sizeToFit()
            if i == 0{
                label.center.x = view.center.x
            }else{
                label.center.x = view.center.x - self.scrollView.frame.width / 2
            }
            self.scrollView.addSubview(label)

            i += 1

    }
    
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == scrollView{
            for i in 0..<scrolldata.count{
//                let label = scrollView.viewWithTag(i + tagValue) as! UILabel
                let view = scrollView.viewWithTag(i + viewtagValue) as! CustomView
                var scrollContentOffset = scrollView.contentOffset.x + self.scrollView.frame.width
                var viewoffet = (view.center.x - scrollView.bounds.width / 4) - scrollContentOffset
//                label.center.x = scrollContentOffset - ((scrollView.bounds.width / 4 - viewoffet) / 2)
            }
        }
    }

}

class CustomView: UIView{
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.systemBlue
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override init(frame:CGRect){
        super.init(frame: frame)
        self.addSubview(imageView)
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

    }
    required init?(coder: NSCoder) {
        fatalError("Error init coder can not init")
    }
    
}
