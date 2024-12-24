//
//  ViewController.swift
//  SmokeAreaOdi
//
//  Created by 이상지 on 12/23/24.
//

import UIKit
import NMapsMap

class ViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // NaverMapView 생성 및 추가
        let naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
        
        // 위치 버튼 표시
        naverMapView.showLocationButton = true

        // 첫 화면 위도와 경도 지정
        let initialLocation = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        // 카메라를 특정 위치로 지정
        let cameraUpdate = NMFCameraUpdate(scrollTo: initialLocation)
        // 카메라를 이동시키는 메서드
        naverMapView.mapView.moveCamera(cameraUpdate)
        
        // 마커 표시
        let marker = NMFMarker()
        marker.position = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        marker.mapView = naverMapView.mapView

    }
}

