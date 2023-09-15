//
//  DoctorStore.swift
//  Healthcare
//
//  Created by ceksi on 15.09.2023.
//

import Foundation

class DoctorStore: ObservableObject {
    @Published var doctors:[Doctor] = []
    
    
    func addDoctor(_ doctor: Doctor) {
        doctors.append(doctor)
    }
    
    func deleteDoctor(_ doctor: Doctor) {
        doctors.removeAll(){ $0.id == doctor.id}
    }
    
    
    
    func demoList () {
        let location = Location(latitude: "", longitude: "")
        let doctor1 = Doctor(doctorName: "jhmk", doctorSurname: "gjb", doctorTelephone: "hjjn", doctorTitle: "nnnbn", doctorBranc: "bbhn")
    }
    
}

