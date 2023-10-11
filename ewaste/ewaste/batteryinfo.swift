//
//  batteryinfo.swift
//  ewaste
//
//  Created by SHIA on 11/10/23.
//

import SwiftUI

struct batteryinfo: View {
    let battery: [Battery] = [
        Battery(imageName: "9voltbattery", title: "9-volt battery"),
        Battery(imageName: "AAbattery", title: "AA Battery"),
        Battery(imageName: "AAAbattery", title: "AAA Battery"),
        Battery(imageName: "buttoncellbattery", title: "Button cell battery"),
        Battery(imageName: "Cbattery", title: "C battery"),
        Battery(imageName: "Dbattery", title: "D battery")
    ]
    @State var showSheet: Bool = false
    var body: some View {
      
        VStack{
            VStack{
                HStack(spacing: 20){
                        HStack{
                            Image("batterybin")
                                .resizable()
                                .frame(width: 120, height: 150)
                            }
                            VStack(spacing: 10){
                               
                                HStack(spacing: 20){
                                    Spacer()
                                    Text("Don Don Donki @ JEM")
                                        .bold()
                                        .font(.title3)
                                        .frame(alignment: .topLeading)
                                    Button(action: {
                                        showSheet.toggle()
                                        
                                    }, label: {
                                        Image(systemName: "info.circle.fill")
                                            .foregroundColor(.black)
                                        //                                    )
                                    })
                                    .sheet(isPresented: $showSheet,  content: {
                                        Text("Battery circumference must not exceed 50mm.")
                                            .padding(30)
                                            .presentationDetents([.height(200)])
                                    })
                                    Spacer()
                                    
                                }
                                .frame(width: 280, alignment: .leading)
                                
                                HStack{
                                    Text("700m away")
                                        .font(.callout)
                                        .foregroundColor(Color(#colorLiteral(red: 0.2875957489, green: 0.2912158072, blue: 0.2911520898, alpha: 0.8470588235)))
                                        .frame(width: 180, alignment: .leading)
                                }
                                
                                HStack{
                                    Text("Type: Retailer E-bin")
                                        .font(.footnote)
                                        .frame(width: 180, alignment: .leading)
                                }
                                
                                
                            }
                            
                            .frame(width: 200, height: 200)
                            
                            
                            
                            
                            
                        }
                        HStack(alignment: .bottom){
                            Text("50 JURONG GATEWAY ROAD, #02-24 to 26 608549 ")
                                .font(.caption)
                            
                        }
                    }
                    .background{
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 360, height: 230)
                        
                    }
                        
                        VStack{
                            List{
                                ForEach(battery) { batteryItem in
                                    BatteryView(items: batteryItem)
                                }
                            }
                            
                            
                        }
                }
                .background(Color(.systemGray6))
                
                
            }
            
            struct Battery: Identifiable {
                var id = UUID()
                var imageName: String
                var title: String
                
            }
            
            struct BatteryView: View {
                let items: Battery  //change this to name for the array
                
                var body: some View {
                    HStack(spacing: 80) {
                        Image(items.imageName)
                            .resizable()
                            .frame(width: 60, height: 70)
                        
                        VStack(alignment: .leading) {
                            Text(items.title)
                                .font(.footnote)
                            
                        }
                        .frame(width: 150, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 35)
                    .padding(.vertical, 30)
                    
                }
            }
        }


struct batteryinfo_Previews: PreviewProvider {
    static var previews: some View {
        batteryinfo()
    }
}
