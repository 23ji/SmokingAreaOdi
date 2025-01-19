import UIKit
import NMapsMap
import CoreLocation


class ViewController: UIViewController {
    // MARK: - Properties
    let locationManager = CLLocationManager()
    var markerManager: MarkerManager?  // 마커 매니저
    
    @IBOutlet weak var naverMapView: NMFNaverMapView!
    @IBOutlet weak var addMarkerButton: UIButton!
    @IBOutlet weak var markerPin: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isChecked = false  // 버튼 상태
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaverMapView()
        addSmokingAreaMarkers()
        setupView()
        
        // 마커 매니저 초기화
        markerManager = MarkerManager(mapView: naverMapView.mapView)
        markerPin.isHidden = true
    }
    
    // MARK: - Setup Methods
    private func setupNaverMapView() {
        let initialLocation = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        let cameraUpdate = NMFCameraUpdate(scrollTo: initialLocation)
        naverMapView.mapView.moveCamera(cameraUpdate)
        naverMapView.showLocationButton = true
    }
    
    private func addSmokingAreaMarkers() {
        for area in smokingAreas {
            let marker = NMFMarker()
            marker.position = NMGLatLng(lat: area.latitude, lng: area.longitude)
            marker.captionText = area.name
            marker.mapView = naverMapView.mapView
        }
    }
    
    private func setupView(){
        // 흰색 테두리 없애기
        searchBar.searchTextField.borderStyle = .none
        searchBar.layer.cornerRadius = 15
        searchBar.clipsToBounds = true
    }
    
    
    @IBAction func addMarkerButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let addVC = storyboard.instantiateViewController(withIdentifier: "AddSmokeAreaViewController") as? AddSmokeAreaViewController {
            addVC.modalPresentationStyle = .fullScreen // 화면 전체로 표시 (선택 사항)
            present(addVC, animated: true, completion: nil)
        } else {
            print("AddSmokeAreaViewController를 찾을 수 없음")
        }
    }
}

//            if isChecked {
//                
//                // 마커 추가 및 핀 이미지 표시
//                markerPin.isHidden = false // 핀 이미지 보이게 설정
//            } else {
//                // 마커 제거 및 핀 이미지 숨김
//                //markerManager?.removeMarker()
//                let center = naverMapView.mapView.cameraPosition.target
//                markerManager?.addMarker(at: center)
//                markerPin.isHidden = true // 핀 이미지 숨기기
//            }

