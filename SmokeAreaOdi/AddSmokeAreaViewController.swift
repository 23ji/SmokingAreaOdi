//
//  AddSmokeAreaViewController.swift
//  SmokeAreaOdi
//
//  Created by 이상지 on 1/19/25.
//

import UIKit

class AddSmokeAreaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    private func setUp() {
        //서치바 디자인
        searchBar.searchTextField.borderStyle = .none
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
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
