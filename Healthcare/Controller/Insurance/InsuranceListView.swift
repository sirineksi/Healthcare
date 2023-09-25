//
//  InsuranceListView.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import SwiftUI

struct InsuranceListView: View {
    
    @StateObject private var insuranceStore = InsuranceStore()
    
    @State private var isDeleteAlertPresented = false
    @State private var insuranceToDelete:Insurance? = nil
    
    
    var body: some View {
        NavigationView{
        
        List {
            ForEach(insuranceStore.insurances) { insurance in
                NavigationLink(destination: InsuranceDetailView (insurance: insurance)) {
                    HStack {
                        Text(insurance.insuranceName)
                        Spacer()
                    }
                }
            }
            
            .onDelete(perform: deleteInsurance)
            
        }
        .navigationTitle("Sigortalar")
        .alert(isPresented: $isDeleteAlertPresented) {
            Alert(title: Text("Sigorta Silme"),
                  message: Text("Bu Doktoru silmek istediğinize eminmisiniz?"),
                  primaryButton: .destructive(Text("Sil"), action: confirmDelete),
                  secondaryButton: .cancel()
                  )
        }
        
        
        
        }
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: InsuranceAddView(insuranceStore: insuranceStore)) {
                    Text("Ekle")
                }
            }
        }
    }
    
    func deleteInsurance(at offsets: IndexSet) {
        
        if let index = offsets.first, insuranceStore.insurances.indices.contains(index) {
            
            print("offset first: \(index) ")
            
            let insurance = insuranceStore.insurances[index]
            
            print("bulunan doktor: \(insurance)")
            
            insuranceToDelete = insurance
            isDeleteAlertPresented.toggle()
            
            
            
        }
        
        
        
    }
    
    func confirmDelete() {
        if let sirin = insuranceToDelete {
            insuranceStore.deleteInsurance(sirin)
            insuranceToDelete = nil
        }
    }
    
    
    
    
    
    
}


