//
//  MyInfoViewController.swift
//  MyRecipes
//
//  Created by 주환 on 2023/06/14.
//

import UIKit

final class MyInfoViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var wofy = ["간장", "김치", "밀가루"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let qlabel = UILabel()
        qlabel.text = "렁"
        view.addSubview(qlabel)
        qlabel.center(inView: view)
        // Do any additional setup after loading the view.
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
