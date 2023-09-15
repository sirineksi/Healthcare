//
//  DoctorDetailView.swift
//  Healthcare
//
//  Created by ceksi on 15.09.2023.
//

import SwiftUI

struct DoctorDetailView: View {
    
    let doctor: Doctor
    var body: some View {
        VStack {
            Text("Hastahane Adı: \(doctor.doctorName)")
                .padding()
            Text("Hastahane Adresi: \(doctor.doctorSurname)" )
            Text("Hastahane Telefonu: \(doctor.doctorBranc)")
            Text("Hastahane Resmi: \(doctor.doctorTitle)")
            Text("Hastahane Resmi: \(doctor.doctorTelephone)")
        }
        .navigationTitle(doctor.doctorName)
    }
    }


