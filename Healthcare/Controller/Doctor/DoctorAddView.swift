//
//  DoctorAddView.swift
//  Healthcare
//
//  Created by ceksi on 15.09.2023.
//

import SwiftUI

struct DoctorAddView: View {

    @ObservedObject var doctorStore: DoctorStore
    @State private var newDoctorName = ""
    @State private var newDoctorSurname = ""
    @State private var newDoctorTelephone = ""
    @State private var newDoctorTitle = ""
    @State private var newDoctorBranc = ""
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    


    var body: some View {
        Form{
            Section(header: Text("Doctor Bilgileri")) {
                TextField("Doktor Adı:", text: $newDoctorName)
                TextField("Doktor SoyAdı:", text: $newDoctorSurname)
                TextField("Doktor Telefonu:", text: $newDoctorTelephone)
                TextField("Doktor Title:", text: $newDoctorTitle)
                TextField("Doktor Branş:", text: $newDoctorBranc)
                
            }
            
            Section {
                Button(action: addDoctor) {
                    Text("Kaydet ")
                }
            }
        }
        .navigationTitle("Doktor Ekle")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(
            title: Text("Doktor Eklendi"),
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
        return newDoctorName.isEmpty || newDoctorSurname.isEmpty
    }
    
    func addDoctor() {
        
        guard isFromValid == false else {
            alertMessage = "Lütfen tüm alanları doldurun!"
            isAlertPresented = true
            return
        }
        
        let newDoctor = Doctor(doctorName: "jhıj", doctorSurname: "bkl", doctorTelephone: "bcknv", doctorTitle: "dbfnk", doctorBranc: "fmv fg")
        doctorStore.addDoctor(newDoctor)
        
        alertMessage = "\(newDoctor.doctorName) Doctor Eklendi!"
        print("Doctor eklendi")
        isAlertPresented = true
        print("hastahane açıldı")
        clear()
        print("Elemanlar boşaltıldı")
        
        
        
    }
    
    func clear() {
        newDoctorName = ""
        newDoctorSurname = ""
        newDoctorBranc = ""
        newDoctorTitle = ""
        newDoctorTelephone = ""
    }
    
    
    
}


