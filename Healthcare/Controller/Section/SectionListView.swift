//
//  SectionListView.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import SwiftUI

struct SectionListView: View {
    
    @StateObject private var sectionStore = SectionStore()
    
    @State private var isDeleteAlertPresented = false
    @State private var sectionToDelete: SectionModel? = nil
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(sectionStore.sections) { section in
                    NavigationLink(destination: SectionDetailView(section: section)) {
                        HStack{
                            Text(section.sectionName)
                            Spacer()
                        }
                    }
                    
                }
                .onDelete(perform: deleteSection)
                
                }
            .navigationTitle("Bölümler")
            .alert(isPresented: $isDeleteAlertPresented) {
                Alert(
                title: Text("Bölüm Silme"),
                message: Text("Bu bölümü silmek istediğinize eminmisiniz?"),
                primaryButton: .destructive(Text("Sil"), action: confirmDelete),
                secondaryButton: .cancel()
                
                
                )
            }
            
        }
     
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SectionAddView(sectionStore: sectionStore)) {
                    Text("Ekle")
                }
            }
        }
        
        
        
        
        
        
        
        
    }
    
    func deleteSection(at offsets: IndexSet) {
        
        if let index = offsets.first, sectionStore.sections.indices.contains(index) {
            print("offset first: \(index)")
            
            let section = sectionStore.sections[index]
            print("Bulnan doktor: \(section)")
            
            sectionToDelete = section
            isDeleteAlertPresented.toggle()
            
            }
        }
    
    func confirmDelete() {
        if let sirin = sectionToDelete {
            sectionStore.deleteSection(sirin)
            sectionToDelete = nil
        }
    }
    
    
    
    
    
}


