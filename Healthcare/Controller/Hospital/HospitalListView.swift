//
//  HospitalListView.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import SwiftUI

struct HospitalListView: View {
    
    @StateObject private var hospitalStore = HospitalStore()
    
    @State private var isDeleteAlertPresented = false
    @State private var hospitalToDelete: Hospital? = nil
    
    
    var body: some View {
        
            NavigationView{
                
                List{
                    ForEach(hospitalStore.hospitals) { hospital in
                        NavigationLink(destination: HospitalDetailView(hospital: hospital)) {
                            HStack{
                                Text(hospital.hospitalName)
                                Spacer()
                            }
                        }
                        
                    }
                    .onDelete(perform: deleteHospital)
                    
            }
                .navigationTitle("Hastahaneler")
                .alert(isPresented: $isDeleteAlertPresented) {
                    Alert(
                        title: Text("Hastahane Silme"),
                        message: Text("Bu Hastahaneyi silmek istediğinize emin misiniz?"),
                        primaryButton: .destructive(Text("Sil"), action: confirmDelete),
                        secondaryButton: .cancel()
                    )
            }
                
            }
        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: HospitalAddView(hospitalStore: hospitalStore)) {
                        Text("Ekle")
                    }
                }
                
            }
    }
    func deleteHospital(at offsets: IndexSet) {
                   
                   
                    if let index = offsets.first, hospitalStore.hospitals.indices.contains(index) {
                        
                        print("offset first: \(index) ")
                        
                        let hospital = hospitalStore.hospitals[index]
                        
                        print("bulunan hospital: \(hospital)")
                        
                        
                        hospitalToDelete = hospital
                        isDeleteAlertPresented.toggle()
                    }
                }
                
                func confirmDelete() {
                        if let sirin = hospitalToDelete {
                            hospitalStore.deleteHospital(sirin)
                            hospitalToDelete = nil
                           
                        }
        }
        
    }
  

