//
//  batteryandbulbinfo.swift
//  ewaste
//
//  Created by SHIA on 11/10/23.
//

import SwiftUI

struct batteryandbulbinfo: View {
    @State var showSheet: Bool = false
    
    let batteryandbulb: [Batteryandbulb] = [
        Batteryandbulb(imageName: "9voltbattery", title: "9-volt battery"),
        Batteryandbulb(imageName: "AAbattery", title: "AA Battery"),
        Batteryandbulb(imageName: "AAAbattery", title: "AAA Battery"),
        Batteryandbulb(imageName: "buttoncellbattery", title: "Button cell battery"),
        Batteryandbulb(imageName: "Cbattery", title: "C battery"),
        Batteryandbulb(imageName: "Dbattery", title: "D battery"),
        Batteryandbulb(imageName: "halogenbulb", title: "Halogen Bulb"),
        Batteryandbulb(imageName: "metalhalidebulb", title: "Metal-Halide Bulb"),
        Batteryandbulb(imageName: "LEDbulb", title: "LED bulb"),
        Batteryandbulb(imageName: "incandescentbulb", title: "Incandescent Bulb"),
        Batteryandbulb(imageName: "fluorescentbulb", title: "Fluorescent Bulb")
    ]
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
                                            Text("Mr. DIY\n@ Westgate")
                                                .bold()
                                                .font(.title3)
                                                .frame(alignment: .topLeading)
                                            Button(action: {
                                                showSheet.toggle()
                                                
                                            }, label: {
                                                Image(systemName: "info.circle.fill")
                                                    .foregroundColor(.black)
                                            })
                                            .sheet(isPresented: $showSheet,  content: {
                                                Text("Battery circumference must not exceed 50mm. Light bulb with bulb circumference of no more than 100mm. Long fluorescent/LED tubes are not accepted.")
                                                    .padding(30)
                                                    .presentationDetents([.height(200)])
                                            })
                                            Spacer()
                                            
                                        }
                                        .frame(width: 276, alignment: .leading)
                                        
                                      
                                        HStack {
                                            Text("700m away")
                                                    .font(.callout)
                                                    .foregroundColor(Color(#colorLiteral(red: 0.2875957489, green: 0.2912158072, blue: 0.2911520898, alpha: 0.8470588235)))
                                                    .frame(width: 150, alignment: .leading)
                                        }
                                        
                                        
                                        HStack{
                                            Text("Type: Retailer E-bin")
                                                .font(.footnote)
                                                .frame(width: 150, alignment: .leading)
                                        }
                                        
                                        
                                    }
                                    
                                    .frame(width: 200, height: 200)
                                    
                                    
                                    
                                    
                                    
                                }
                                HStack(alignment: .bottom){
                                    Text("3 GATEWAY DRIVE, WESTGATE, #03-46/47/48 608532")
                                        .font(.caption)
                                }
                            }
                            .background{
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white)
                                    .frame(width: 360, height: 230)
                                
                            }
                                
                                VStack{
                                    //                    ScrollView(.vertical){
                                    List{
                                        ForEach(batteryandbulb) { batteryandbulbItem in
                                            BatteryandbulbView(items: batteryandbulbItem)
                                        }
                                    }
                                    
                                    
                                }
                             
                            
                        }
                        .background(Color(.systemGray6))
                        
                    }
                    
                    struct Batteryandbulb: Identifiable {
                        var id = UUID()
                        var imageName: String
                        var title: String
                        
                    }
                    
                    struct BatteryandbulbView: View {
                        let items: Batteryandbulb  //change this to name for the array
                        
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


struct batteryandbulbinfo_Previews: PreviewProvider {
    static var previews: some View {
        batteryandbulbinfo()
    }
}
