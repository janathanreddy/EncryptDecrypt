//
//  StrachyImageViewController.swift
//  EncryptDecrypt
//
//  Created by Janarthan Subburaj on 11/01/21.
//

import UIKit

class StrachyImageViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   

    @IBOutlet weak var tableView: UITableView!
    var headerView:UIView!
    let headerHeight:CGFloat = 250
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: headerHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        UpdateHeader()
    }
    func UpdateHeader(){
        if tableView.contentOffset.y < -headerHeight{
            headerView.frame.origin.y = tableView.contentOffset.y
            headerView.frame.size.height = -tableView.contentOffset.y

        }
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        Cell.textLabel?.text = "\(indexPath)"
        return Cell
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UpdateHeader()
    }
}
