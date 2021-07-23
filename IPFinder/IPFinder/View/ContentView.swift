//
//  ContentView.swift
//  IPFinder
//
//  Created by Angelos Staboulis on 24/7/21.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = IPFinderViewModel()
    @State var ipDetailsArray:[IPModel]=[]
    var body: some View {
        Text("IPFinder").padding(10)
        Text("Utility to display ip details")
        List(ipDetailsArray){ item in
            VStack{
                Text("ip="+item.ip).frame(width:300,height:45,alignment:.topLeading)
                Text("city="+item.city).frame(width:300,height:45,alignment:.topLeading)
                Text("latitude="+String(item.latitude)).frame(width:300,height:45,alignment:.topLeading)
                Text("longitude="+String(item.longitude)).frame(width:300,height:45,alignment:.topLeading)
                Text("country="+item.country_name).frame(width:300,height:45,alignment:.topLeading)
                Text("country_code="+item.country_code).frame(width:300,height:45,alignment:.topLeading)
                Text("region="+item.region).frame(width:300,height:45,alignment:.topLeading)
                Text("org="+item.org).frame(width:300,height:45,alignment:.topLeading)
            }
          
            
        }.onAppear(perform: {
            viewModel.fetchIPDetails { (array) in
                ipDetailsArray.append(contentsOf: array)
            }
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
