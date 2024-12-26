// ViewController.swift
import UIKit
import NMapsMap
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    // MARK: - Properties
    let locationManager = CLLocationManager() // 위치 관리자 객체
    @IBOutlet weak var naverMapView: NMFNaverMapView! // 스토리보드에서 연결한 NaverMapView
    
    @IBOutlet weak var addMarkerButton: UIButton!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 위치 권한 요청
        //requestLocationPermission()
        
        // NaverMapView 설정
        setupNaverMapView()
    }
    
    // MARK: - Setup Methods
    private func setupNaverMapView() {
        // 지도 초기 위치 설정 (역삼역)
        let initialLocation = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        let cameraUpdate = NMFCameraUpdate(scrollTo: initialLocation)
        naverMapView.mapView.moveCamera(cameraUpdate)
        
        // 위치 버튼 표시
        naverMapView.showLocationButton = true
        
        // 초기 마커 추가
        let marker = NMFMarker()
        marker.position = initialLocation
        marker.mapView = naverMapView.mapView
    }
    
    // MARK: - Location Permission Methods
    private func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    // MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // 권한 허용된 경우
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            // 권한 거부된 경우
            showLocationPermissionAlert()
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first {
            // 사용자 현재 위치 가져오기
            let lat = currentLocation.coordinate.latitude
            let lon = currentLocation.coordinate.longitude
            let currentPosition = NMGLatLng(lat: lat, lng: lon)
            
            // 지도 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: currentPosition)
            naverMapView.mapView.moveCamera(cameraUpdate)
            
            // 현재 위치 마커 추가
            let marker = NMFMarker()
            marker.position = currentPosition
            marker.mapView = naverMapView.mapView
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }
    
    // 위치 권한 거부 경고 표시
    private func showLocationPermissionAlert() {
        let alert = UIAlertController(title: "위치 권한", message: "위치 권한을 허용해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
