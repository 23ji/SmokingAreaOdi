// SmokingAreaData.swift

import Foundation

struct SmokingArea {
    let name: String
    let latitude: Double
    let longitude: Double
}

// 흡연구역 기본 데이터
let smokingAreas: [SmokingArea] = [
    SmokingArea(name: "역삼역 흡연구역", latitude: 37.5009, longitude: 127.0362),
    SmokingArea(name: "강남역 흡연구역", latitude: 37.4979, longitude: 127.0276),
    SmokingArea(name: "삼성역 흡연구역", latitude: 37.5088, longitude: 127.0631)
]
