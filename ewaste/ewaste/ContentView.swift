//
//  ContentView.swift
//  ewaste
//
//  Created by SHIA on 10/10/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var showSheet = false
    @State private var showSheet1 = false
    @State private var showSheet2 = false
    @State private var showSheet3 = false
    @State private var selection: String? = threein1[0]
    @State private var isPresentingConfirm: Bool = false
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:1.3333714389013962 , longitude: 103.74261768664843), span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.005))
    
    struct Location: Identifiable {
        var id = UUID()
        var coordinates: CLLocationCoordinate2D
    }
    
    let locations: [Location] = [
        Location(coordinates: CLLocationCoordinate2D(latitude: 1.3342185161153437 , longitude: 103.74258782357808)),
        Location(coordinates: CLLocationCoordinate2D(latitude: 1.3326654221411782, longitude: 103.74322424077077)),
        Location(coordinates: CLLocationCoordinate2D(latitude: 1.3332047579128004, longitude: 103.74332516564826))
      
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Map(
                    coordinateRegion: $mapRegion,
                    annotationItems: locations,
                    annotationContent: {item in MapMarker(coordinate: item.coordinates)
                        
                    }
                )
                
                Image(systemName: "location.north.circle.fill").position(x:184, y:460)
                
                Group{
                    NavigationLink("O", destination: {
                        batteryandbulbinfo()
                    }).position(x:184,y:342).padding().foregroundColor(.red.opacity(1)).font(.system(size: 37))
                    
                    NavigationLink("O", destination: {
                        batteryinfo()
                    }).position(x:235,y:415).padding().foregroundColor(.red.opacity(1)).font(.system(size: 37))
                    
                    NavigationLink("O", destination: {
                        ictinfo()
                    }).position(x:228,y:454).padding().foregroundColor(.red.opacity(1)).font(.system(size: 37))
                  
                   
                    
                }
                
                
                HStack(alignment: .top){
                    HStack{
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .foregroundColor(Color.gray)
                    }
                    .frame(width: 300, height: 20, alignment: .leading)
                    .background{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 350, height: 50)
                    }
                    
                    
                    
                }
                .offset(y: -330)
                
                HStack{
                    Spacer()

                    Button{
                        showSheet.toggle()
                    }
                label: {
                    Label("3-in-1",systemImage: "laptopcomputer.and.iphone").font(.callout).foregroundColor(Color.white)}
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                .frame(width: 90, height: 30))
                .sheet(isPresented: $showSheet) {
                    NavigationStack {
                        List(selection: $selection) {
                            Section {
                                
                                NavigationLink {
                                   ictinfo()
                                } label: {
                                    HStack {
                                        HStack{
                                            Image("ictbin")
                                                .resizable()
                                                .frame(width: 120, height: 100, alignment: .center)
                                                .padding()
                                        }
                                        
                                        VStack(alignment:.leading) {
                                            
                                            Text("Challenger @ JEM")
                                                .font(.title3)
                                            
                                            Text("500m away")
                                                .font(.callout)
                                                .foregroundColor(Color.gray)
                                                .padding(.bottom, 1)
                                            
                                            HStack(spacing: 5) {
                                                Image(systemName: "laptopcomputer")
                                                Image(systemName: "iphone.gen1")
                                                Image(systemName: "ipad.sizes")
                                                Image(systemName: "minus.plus.batteryblock.fill")
                                                Image(systemName: "lightbulb.fill")
                                            }.font(.footnote)
                                        }
                                
                                    }
                                }
                            }
                        }
                                    }.presentationDetents([.medium, .large])
                                }
                    
                    Spacer()
                    
                    Button {
                        showSheet1.toggle()
                    }
                label: {
                    Label("2-in-1",systemImage: "lightbulb.fill").font(.callout)
                    .foregroundColor(Color.white)}
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                    .frame(width: 90, height: 30)
                        )
                    .sheet(isPresented: $showSheet1) {
                        NavigationStack {
                            List(selection: $selection) {
                                
                                Section {
                                    
                                    NavigationLink {
                                      batteryandbulbinfo()
                                    } label: {
                                        HStack(spacing: 40) {
                                            Image("batterybin")
                                                .resizable()
                                                .frame(width: 70, height: 100, alignment:.center)
                                                .padding()
                                            
                                            VStack(alignment:.leading) {
                                                
                                                    Text("Mr. DIY @ Westgate")
                                                        .font(.title3)
                                                    
                                                
                                                Text("2.1km away")
                                                    .font(.callout)
                                                    .foregroundColor(Color.gray)
                                                    .padding(.bottom, 5)
                                                
                                                HStack(spacing: 5) {
                                                    Image(systemName: "minus.plus.batteryblock.fill")
                                                    Image(systemName: "lightbulb.fill")
                                                }.font(.footnote)
                                            }
                                        }
                                    }
                                }}}.presentationDetents([.medium, .large])
                        
                        
                 }
                    Spacer()
                    Button{
                        showSheet2.toggle()
                    }
                    label: {
                        Label("Battery-only",systemImage: "minus.plus.batteryblock.fill")
                        .font(.callout)
                        .foregroundColor(Color.white)}
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                                .frame(width: 135, height: 30)
                            )
                        .sheet(isPresented: $showSheet2) {
                            NavigationStack {
                                List(selection: $selection) {
                                    
                                    Section {
                                        NavigationLink {
                                            batteryinfo()
                                        } label: {
                                            HStack(spacing:30) {
                                                Image("batterybin")
                                                    .resizable()
                                                    .frame(width: 80, height: 100, alignment:.center)
                                                    .padding()
                                                
                                                VStack(alignment:.leading) {
                                                    Text("Don Don Donki @ JEM")
                                                        .font(.title3)
                                                    Text("400m away")
                                                        .font(.callout)
                                                        .foregroundColor(Color.gray)
                                                        .padding(.bottom, 5)
                                                    
                                                    HStack(spacing: 5) {
                                                        Image(systemName: "minus.plus.batteryblock.fill")
                                                    }.font(.footnote)
                                                }
                                            }
                                        }
                                    }}}.presentationDetents([.medium, .large])
                        }

                    
                    Spacer()
                }
                .frame(width: 400)
                .offset(y: -270)
               
                
                
                
            }
            .ignoresSafeArea()
        }
    }
    
}
            
        
            


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
