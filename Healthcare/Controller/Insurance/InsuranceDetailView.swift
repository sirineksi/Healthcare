//
//  InsuranceDetailView.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import SwiftUI

struct InsuranceDetailView: View {
    
    let insurance: Insurance
    
    var body: some View {
        
   
            VStack {
                Text("Sigorta Adı: \(insurance.insuranceName)")
                    .padding()
                Text("Sigorta Adresi: \(insurance.insuranceLogo)" )
            
                
            }
            .navigationTitle(insurance.insuranceName)
        }
    
}

