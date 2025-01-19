import UIKit
import NMapsMap

class AddSmokeAreaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var naverMapView: NMFNaverMapView!

    private var centerMarker: NMFMarker?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNaverMapView()
        //setupCenterMarker()
    }

    private func setupNaverMapView() {
        // 지도 초기 위치 설정
        let initialLocation = NMGLatLng(lat: 37.500920152198, lng: 127.03618231961)
        let cameraUpdate = NMFCameraUpdate(scrollTo: initialLocation)
        naverMapView.mapView.moveCamera(cameraUpdate)
        naverMapView.showLocationButton = true
    }

//    private func setupCenterMarker() {
//        // 지도 중심 위치에 마커 추가
//        centerMarker = NMFMarker()
//        centerMarker?.position = naverMapView.mapView.cameraPosition.target
//        centerMarker?.mapView = naverMapView.mapView // 네이버 지도에 마커 추가
//        centerMarker?.iconImage = NMF_MARKER_IMAGE_BLACK // 네이버 기본 마커 이미지 사용
//    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

//    @IBAction func confirmLocationTapped(_ sender: UIButton) {
//        // 현재 지도 중심의 위치를 가져옴
//        let currentCenter = naverMapView.mapView.cameraPosition.target
//        print("선택된 위치: \(currentCenter.lat), \(currentCenter.lng)")
//    }
}
