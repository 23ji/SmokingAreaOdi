//
//  MarkerManager.swift
//  SmokeAreaOdi
//
//  Created by 이상지 on 1/10/25.
//

import NMapsMap

class MarkerManager {
    // MARK: - Properties
    private weak var mapView: NMFMapView?  // 맵뷰 참조
    private var currentMarker: NMFMarker?
    
    // MARK: - Initializer
    init(mapView: NMFMapView) {
        self.mapView = mapView
    }
    
    // MARK: - Methods
    func addMarker(at center: NMGLatLng) {
        // 마커 생성 및 추가
        if currentMarker == nil {
            currentMarker = NMFMarker()
        }
        currentMarker?.position = center
        currentMarker?.mapView = mapView
        currentMarker?.captionText = "새로운 마커"
    }
    
    func removeMarker() {
        // 마커 제거
        currentMarker?.mapView = nil
        currentMarker = nil
    }
}
