//
//  ViewController.swift
//  SmokeAreaOdi
//
//  Created by 이상지 on 12/23/24.
//

import UIKit
import NMapsMap

class ViewController: UIViewController {

    // MARK: - Properties
    private let locationManager = CLLocationManager()

    // 초기 화면에 표시할 기본 위치 (나중에 사용자 위치로 대체하기)
    private var defaultLocation: NMGLatLng {
        return NMGLatLng(lat: 37.500920152198, lng: 127.03618231961) // 현재 하드코딩된 위치
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaverMap()
    }

    // MARK: - Setup Methods
    private func setupNaverMap() {
        let naverMapView = NMFNaverMapView(frame: view.bounds)
        view.addSubview(naverMapView)
        
        naverMapView.showLocationButton = true

        setInitialCamera(on: naverMapView)
        addMarker(on: naverMapView)
    }

    private func setInitialCamera(on naverMapView: NMFNaverMapView) {
        // 초기 화면 위치를 설정
        let cameraUpdate = NMFCameraUpdate(scrollTo: defaultLocation)
        naverMapView.mapView.moveCamera(cameraUpdate)
    }

    private func addMarker(on naverMapView: NMFNaverMapView) {
        let marker = NMFMarker()
        marker.position = defaultLocation // 하드코딩된 첫 위치
        marker.mapView = naverMapView.mapView
    }
}
