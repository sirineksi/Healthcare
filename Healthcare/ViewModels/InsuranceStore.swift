//
//  InsuranceStore.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import Foundation


class InsuranceStore: ObservableObject {
    @Published var insurances:[Insurance] = []
    
    
    func addInsurance(_ insurance: Insurance) {
        insurances.append(insurance)
    }
    
    func deleteInsurance(_ insurance: Insurance) {
        insurances.removeAll(){ $0.id == insurance.id}
    }
    
    
    
   
    
}
