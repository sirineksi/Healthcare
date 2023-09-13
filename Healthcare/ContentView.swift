//
//  ContentView.swift
//  Healthcare
//
//  Created by ceksi on 13.09.2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack {
                    Image("medicine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .padding()
                        .foregroundColor(Color.white)
                        .cornerRadius(15)
                }
                HStack(spacing: 20) {
                    NavigationLink(destination: HospitalListView()) {
                        VStack {
                            Image("hospital")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                            Text("Hospitals")
                        }
                    }
                    NavigationLink(destination: DoctorListView()) {
                        VStack {
                            Image("doctors")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                            Text("Doctors")
                        }
                    }
                   
                }
                
                HStack(spacing: 20) {
                    
                    NavigationLink(destination: InsuranceListView()) {
                        VStack {
                            Image("insurance")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                            Text("Insurance")
                        }
                    }
                    
                    
                    NavigationLink(destination: SectionListView()) {
                        VStack {
                            Image("sections")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(Color.white)
                                .cornerRadius(15)
                            Text("Sections")
                        }
                    }
                  
                    
                    
                }
            }
            .navigationBarTitle("Main Screen")
        }
    }
}

