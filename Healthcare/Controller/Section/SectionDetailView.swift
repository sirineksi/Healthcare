//
//  SectionDetailView.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import SwiftUI

struct SectionDetailView: View {
    
    let section: SectionModel
    
    var body: some View {
        VStack{
            Text("Bölüm Adı: \(section.sectionName)")
                .padding()
            Text("Bölüm Logosu: \(section.sectionLogo)")
            
            
        }
        .navigationTitle(section.sectionName)
        
        
        
    }
}


