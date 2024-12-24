import UIKit
import NMapsMap
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - Properties
    let locationManager = CLLocationManager()
    var naverMapView: NMFNaverMapView!

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // NaverMapView 생성 및 추가
        setupNaverMapView()
        
        // 위치 권한 요청
        requestLocationPermission()
    }
    
    // MARK: - Setup Methods
    // NaverMapView 설정
    private func setupNaverMapView() {
        // NaverMapView 생성 및 추가
        naverMapView = NMFNaverMapView(frame: view.frame)
        view.addSubview(naverMapView)
        
        // 위치 버튼 표시
        naverMapView.showLocationButton = true

        // 첫 화면 위도와 경도 (역삼역) 지정
        let initialLocation = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        
        // 카메라를 특정 위치로 지정
        let cameraUpdate = NMFCameraUpdate(scrollTo: initialLocation)
        // 카메라를 이동시키는 메서드
        naverMapView.mapView.moveCamera(cameraUpdate)

        // 마커 표시 (역삼역)
        let marker = NMFMarker()
        marker.position = initialLocation
        marker.mapView = naverMapView.mapView
    }
    
    // MARK: - Location Permission Methods
    // 위치 권한 요청
    private func requestLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.requestWhenInUseAuthorization()
        }
    }

    // MARK: - CLLocationManagerDelegate
    // 위치 권한 상태 변경 시 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            // 권한이 허용된 경우 위치 업데이트 시작
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            // 권한이 거부된 경우 사용자에게 알림
            showLocationPermissionAlert()
        default:
            break
        }
    }

    // 위치 권한을 거부했을 때 알림
    private func showLocationPermissionAlert() {
        let alert = UIAlertController(title: "위치 권한", message: "위치 권한을 허용해주세요.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    // 위치 업데이트가 있을 때 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let currentLocation = locations.first {
            // 사용자 위치를 가져와서 지도에 표시
            let lat = currentLocation.coordinate.latitude
            let lon = currentLocation.coordinate.longitude
            
            // 카메라를 사용자의 현재 위치로 업데이트
            let currentPosition = NMGLatLng(lat: lat, lng: lon)
            let cameraUpdate = NMFCameraUpdate(scrollTo: currentPosition)
            naverMapView.mapView.moveCamera(cameraUpdate)
            
            // 마커 표시
            let marker = NMFMarker()
            marker.position = currentPosition
            marker.mapView = naverMapView.mapView
        }
    }

    // 위치 업데이트 실패 시 호출되는 메서드
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("위치 업데이트 실패: \(error.localizedDescription)")
    }
}
