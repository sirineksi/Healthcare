//
//  DoctorListView.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import SwiftUI

struct DoctorListView: View {
    
    @StateObject private var doctorStore = DoctorStore()
    
    @State private var isDeleteAlertPresented = false
    @State private var doctorToDelete: Doctor? = nil
    
    
    
    var body: some View {
        NavigationView{
            
            List{
                ForEach(doctorStore.doctors) { doctor in
                    NavigationLink(destination: DoctorDetailView(doctor: doctor)) {
                        HStack{
                            Text(doctor.doctorName)
                            Spacer()
                        }
                    }
                    
                }
                .onDelete(perform: deleteDoctor)
                
        }
            .navigationTitle("Doktorlar")
            .alert(isPresented: $isDeleteAlertPresented) {
                Alert(
                    title: Text("Doktor Silme"),
                    message: Text("Bu Doktoru silmek istediğinize emin misiniz?"),
                    primaryButton: .destructive(Text("Sil"), action: confirmDelete),
                    secondaryButton: .cancel()
                )
        }
            
        }
    
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: DoctorAddView(doctorStore: doctorStore)) {
                    Text("Ekle")
                }
            }
            
        }
    }
    
    func deleteDoctor(at offsets: IndexSet) {
                   
                   
                    if let index = offsets.first, doctorStore.doctors.indices.contains(index) {
                        
                        print("offset first: \(index) ")
                        
                        let doctor = doctorStore.doctors[index]
                        
                        print("bulunan doktor: \(doctor)")
                        
                        
                        doctorToDelete = doctor
                        isDeleteAlertPresented.toggle()
                    }
                }
                
                func confirmDelete() {
                        if let sirin = doctorToDelete {
                            doctorStore.deleteDoctor(sirin)
                            doctorToDelete = nil
                           
                        }
        }
    
    
    
}


