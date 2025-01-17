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
    
    var isChecked = false  // 버튼 상태

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNaverMapView()
        addSmokingAreaMarkers()
        
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
    
    
    @IBAction func addMarkerButtonTapped(_ sender: UIButton) {
        isChecked.toggle()
        if isChecked {
            markerPin.isHidden = false
            
            addMarkerButton.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)

        } else {
            let center = naverMapView.mapView.cameraPosition.target
            markerManager?.addMarker(at: center)
            
            markerPin.isHidden = true
            
            addMarkerButton.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)

        }
    }
    
    @IBAction func listButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // "Main"은 스토리보드 이름
            if let listVC = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController {
                navigationController?.pushViewController(listVC, animated: true)
                print("목록 버튼 눌림")
            } else {
                print("ListViewController를 찾을 수 없음")
            }
    }
}
