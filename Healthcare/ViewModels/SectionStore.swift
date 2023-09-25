//
//  SectionStore.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import Foundation

class SectionStore: ObservableObject {
    @Published var sections: [SectionModel] = []
    
    
    func addSection(_ section: SectionModel) {
        sections.append(section)
    }
    
    func deleteSection(_ section: SectionModel) {
        sections.removeAll() { $0.id == section.id}
    }
    
    
    
    
}
