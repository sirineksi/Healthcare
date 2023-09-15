//
//  HospitalAddView.swift
//  Healthcare
//
//  Created by ceksi on 14.09.2023.
//

import SwiftUI

struct HospitalAddView: View {
    
    @ObservedObject var hospitalStore: HospitalStore
    @State private var newHospitalName = ""
    @State private var newHospitalAdress = ""
    @State private var newHospitalPhone = ""
    @State private var newHospitalImage = ""
    
    @State private var newLatitude = ""
    @State private var newLongitude = ""
    
    
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    
    
    
    
    var body: some View {
            Form {
            Section(header: Text("Hastahane Bilgileri")) {
                TextField("Hastahane Adı", text: $newHospitalName)
                TextField("Telefon Numarası", text: $newHospitalPhone)
                TextField("Adres", text: $newHospitalAdress)
                TextField("Hastahane Resmi", text: $newHospitalImage)
                
                
               
            }

            Section {
                //1- addMovie methodu çağırılır button tıklanınca
                Button(action: addHospital) {
                    Text("Kaydet ")
                }
                //.disabled(isFromInvalid)
                
            }
            
            
        }
        .navigationTitle("Hastahane Ekle")
        .alert(isPresented: $isAlertPresented, content: {
            Alert(
            title: Text("Hastahane Eklendi"),
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
        return newHospitalName.isEmpty || newHospitalAdress.isEmpty
    }
    
     
    func addHospital() {
        
            //2- name ve açıklama boş ise bu mesaj çalışır
            guard isFromValid  == false else {
                alertMessage = "Lütfen tüm alanları doldurun."
                isAlertPresented = true
                // isalertpresented alert i boş ise açar
                return
                // return altındaki hiç bir kod çalışmaz
            }
            //stateden longitude ve latitude alır
            let newHospitalLocation = Location(latitude: newLatitude, longitude: newLongitude)
        
            let newHospital = Hospital(hospitalName: newHospitalName, hospitalAdress: newHospitalAdress, hospitalPhone: newHospitalPhone, location: newHospitalLocation )
            
            //yeni film struct a eklenir
            
        hospitalStore.addHospital(newHospital)
            //movie store içindeki array a eleman eklenir add movie methodu çağırılır
            
            
        alertMessage = "\(newHospital.hospitalName) Hastahane eklendi! "
            print("hastahane eklendi")
            isAlertPresented = true
            print("hastahane açıldı")
            clear()
            print("Elemanlar boşaltıldı")
            
        
    
    }
    
    func clear() {
        newHospitalName = ""
        newHospitalPhone = ""
        newHospitalAdress = ""
        newHospitalImage = ""
        newLatitude = ""
        newLongitude = ""
    }
    
    
    
    
    
}


