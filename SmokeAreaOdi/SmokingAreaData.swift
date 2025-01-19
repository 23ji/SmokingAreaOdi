// SmokingAreaData.swift

import Foundation

struct SmokingArea {
    let name: String
    let latitude: Double
    let longitude: Double
    let description: String  // 상세 설명 추가
}

// 흡연구역 기본 데이터
var smokingAreas: [SmokingArea] = [
    SmokingArea(name: "역삼역 흡연구역", latitude: 37.5009, longitude: 127.0362, description: "역삼역 근처 흡연구역"),
    SmokingArea(name: "강남역 흡연구역", latitude: 37.4979, longitude: 127.0276, description: "강남역 인근 흡연구역"),
    SmokingArea(name: "삼성역 흡연구역", latitude: 37.5088, longitude: 127.0631, description: "삼성역 근처 흡연구역")
]

