//
//  ictinfo.swift
//  ewaste
//
//  Created by SHIA on 10/10/23.
//

import SwiftUI

struct ictinfo: View {
    let items: [Items] = [
        Items(imageName: "computer", title: "Computer"),
        Items(imageName: "laptop", title: "Laptop"),
        Items(imageName: "powerbank", title: "Powerbank"),
        Items(imageName: "printer", title: "Printer"),
        Items(imageName: "routers", title: "Router"),
        Items(imageName: "desktopmonitors", title: "Desktop Monitors"),
        Items(imageName: "settopboxes", title: "Set-top boxes"),
       Items(imageName: "9voltbattery", title: "9-volt battery"),
    Items(imageName: "AAbattery", title: "AA Battery"),
       Items(imageName: "AAAbattery", title: "AAA Battery"),
        Items(imageName: "buttoncellbattery", title: "Button cell battery"),
       Items(imageName: "Cbattery", title: "C battery"),
       Items(imageName: "Dbattery", title: "D battery"),
        Items(imageName: "halogenbulb", title: "Halogen Bulb"),
        Items(imageName: "metalhalidebulb", title: "Metal-Halide Bulb"),
        Items(imageName: "LEDbulb", title: "LED bulb"),
        Items(imageName: "incandescentbulb", title: "Incandescent Bulb"),
       Items(imageName: "fluorescentbulb", title: "Fluorescent Bulb")
    ]
    @State var showSheet: Bool = false
    var body: some View {
        VStack{
            VStack{
                HStack(spacing: 0){
                    HStack{
                        Image("ictbin")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    VStack(spacing: 10){
                        
                        HStack(spacing: 25){
                            Text("Challenger @ JEM")
                                .bold()
                                .font(.title3)
                                .frame(width: 150, height: 60, alignment: .topLeading)
                            
                            Button(action: {
                                showSheet.toggle()
                                
                            }, label: {
                                Image(systemName: "info.circle.fill")
                                    .foregroundColor(.black)
                                    
                            })
                            .padding(.horizontal, -15)
                            .sheet(isPresented: $showSheet,  content: {
                                Text("For ICT equipments, devices must be able to fit through the 500mm x 250mm slot. Battery circumference must not exceed 50mm. Light bulb with bulb circumference of no more than 100mm. Long fluorescent/LED tubes are not accepted")
                                    .padding(30)
                                    .presentationDetents([.height(200)])
                                
                            })
                            
                            
                        }
                        .frame(width: 240, alignment: .leading)
                        
                        HStack{
                            Text("100m away")
                                .font(.callout)
                                .foregroundColor(Color(#colorLiteral(red: 0.2875957489, green: 0.2912158072, blue: 0.2911520898, alpha: 0.8470588235)))
                                .frame(width: 240, alignment: .leading)
                        }
                        
                        HStack{
                            Text("Type: Retailer E-bin")
                                .font(.footnote)
                                .frame(width: 240, alignment: .leading)
                        }
                        
                        
                        
                        
                    }
                    
                    .frame(width: 200, height: 200)
                    
                    
                    
                    
                    
                }
                HStack(alignment: .bottom){
                    Text("50 JURONG GATEWAY ROAD, JEM, #04-01, IN-STORE 608549")
                        .font(.caption)
                }
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .frame(width: 370, height: 230)
                
            }
                
                VStack{
                    List{
                        ForEach(items) { itemsItem in
                            ItemsView(items: itemsItem)
                        }
                    }
                    
                    
                }
          
           
            
        }
        .background(Color(.systemGray6))
        
    }
    
    struct Items: Identifiable {
        var id = UUID()
        var imageName: String
        var title: String
        
    }
    
    struct ItemsView: View {
        let items: Items 
        
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

struct ictinfo_Previews: PreviewProvider {
    static var previews: some View {
        ictinfo()
    }
}
