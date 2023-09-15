//
//  HospitalDetailView.swift
//  Healthcare
//
//  Created by ceksi on 15.09.2023.
//

import SwiftUI

struct HospitalDetailView: View {
    
    let hospital: Hospital
    
    var body: some View {
        VStack {
            Text("Hastahane Adı: \(hospital.hospitalName)")
                .padding()
            Text("Hastahane Adresi: \(hospital.hospitalAdress)" )
            Text("Hastahane Telefonu: \(hospital.hospitalPhone)")
            Text("Hastahane Resmi: \(hospital.hospitalImage)")
        }
        .navigationTitle(hospital.hospitalName)
    }
    }


