//
//  InsuranceAddView.swift
//  Healthcare
//
//  Created by ceksi on 25.09.2023.
//

import SwiftUI

struct InsuranceAddView: View {
    
    @ObservedObject var insuranceStore: InsuranceStore
    @State private var newInsuranveName = ""
    @State private var newInsuranceLogo = ""
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        
        Form{
            Section(header:Text("Doktor Bilgileri")) {
                TextField("Sigorta Adı:", text: $newInsuranveName)
                TextField("Sigorta Logosu:", text: $newInsuranceLogo)
                
                }
            
            Section {
                Button(action: addInsuranece1) {
                    Text("Kaydet")
                }
            }
            
            
        }
        
        .navigationTitle("Sigorta Ekle")
        .alert(isPresented: $isAlertPresented, content: {
            Alert (title: Text("Sigorta eklendi!"),
                   message: Text(alertMessage),
                   dismissButton: .default(Text("Tamam")) {
                print("Tamam butonu tıklandı")
                presentationMode.wrappedValue.dismiss()
                print("Liste sayfasına döndü")
            }
            )
        })
        }
    
    var isFromValid: Bool {
        return newInsuranveName.isEmpty || newInsuranceLogo.isEmpty
    }
    
    func addInsuranece1() {
        
        guard isFromValid == false else {
          alertMessage = "Lütfen tüm alanları doldurun!"
          isAlertPresented = true
            return
        }
        
        let newInsurance = Insurance(insuranceName: "frrf" )
        insuranceStore.addInsurance(newInsurance)
        
       
        
        alertMessage = "\(newInsurance.insuranceName) Sigorta Eklendi!"
        print("Sigorta eklendi!")
        isAlertPresented = true
        print("Sigorta açıldı")
        clear()
        print("Elemanlar Boşaltıldı")
        
    }
    
    func clear() {
        newInsuranveName = ""
        newInsuranceLogo = ""
    }
    
    
    
}


