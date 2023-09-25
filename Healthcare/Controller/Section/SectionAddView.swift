//
//  SectionAddView.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import SwiftUI

struct SectionAddView: View {
    
    @ObservedObject var sectionStore: SectionStore
    @State private var newSectionName = ""
    @State private var newSectionLogo = ""
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Bölüm bilgileri")) {
                TextField("Bölüm Adı:", text: $newSectionName)
                TextField("Bölüm Logosu:", text: $newSectionLogo)
                
            }
            Section {
                Button(action: addSection) {
                    Text("Kaydet")
                }
            }
        }
        .navigationTitle("Doktor Ekle")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(
            title: Text("Bölüm Eklendi"),
            message: Text(alertMessage),
            dismissButton: .default(Text("Tamam")) {
            print("Tamam butonu tıklandı")
                presentationMode.wrappedValue.dismiss()
                print("Liste sayfasına döndü")
            }
            
            )
        })
        
        
        
    }
    
    var isFromVlid:Bool {
        return newSectionName.isEmpty || newSectionLogo.isEmpty
    }
    
    func addSection() {
        guard isFromVlid == false else {
            alertMessage = "Lütfen tüm alanları doldurun!"
            isAlertPresented = true
            return
        }
        
        let newSection = SectionModel(sectionName: "vbfgb")
        sectionStore.addSection(newSection)
        
        
        alertMessage = "\(newSection.sectionName) Bölüm eklendi!"
        print("Böüm eklendi")
        isAlertPresented = true
        print("Bölümler açıldı")
        clear()
        
        }
    
    
    func clear() {
        
        newSectionName = ""
        newSectionLogo = ""
    }
    
}


