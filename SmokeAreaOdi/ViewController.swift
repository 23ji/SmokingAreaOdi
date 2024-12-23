//
//  ViewController.swift
//  SmokeAreaOdi
//
//  Created by 이상지 on 12/23/24.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
    }

}

