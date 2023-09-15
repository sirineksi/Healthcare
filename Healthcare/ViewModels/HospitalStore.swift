//
//  HospitalStore.swift
//  Healthcare
//
//  Created by ceksi on 14.09.2023.
//

import Foundation

class HospitalStore: ObservableObject {
    @Published var hospitals:[Hospital] = []
    
    
    func addHospital(_ hospital: Hospital) {
        hospitals.append(hospital)
    }
    
    func deleteHospital(_ hospital: Hospital) {
        hospitals.removeAll(){ $0.id == hospital.id}
    }
    
    
    
    func demoList () {
        let location = Location(latitude: "", longitude: "")
        let hospital1 = Hospital(hospitalName: "American", hospitalAdress: "kadıköy", hospitalPhone: "545454554", location: location)
    }
    
}


