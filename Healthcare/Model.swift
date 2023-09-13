//
//  Model.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import Foundation
import SwiftUI

struct Hospital: Identifiable {
    
    let id = UUID()
    let hospitalName: String
    let hospitalAdress: String
    let hospitalPhone: Int
    let hospitalImage: Image = Image( "hospital")
    let latitude: String
    let longitude: String
    
    }

struct Doctor: Identifiable {
    
    let id =  UUID()
    let doctorName: String
    let doctorSurname: String
    let doctorTelephone: Int
    let doctorTitle: String
    let doctorBranc: String
}

struct Section: Identifiable {
    
    let id = UUID()
    let sectionName: String
    let sectionLogo: Image
}

struct Insurance: Identifiable {
    
    let id = UUID()
    let insuranceName: String
    let insuranceLogo: Image
}

