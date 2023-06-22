//
//  ListView.swift
//  TheList
//
//  Created by Dongseok Cho on 2023-06-21.
//

import SwiftUI

struct ListView: View {
    //@StateObject var theList = ListViewModel()
    let thelist = ["Camping",
                   "Groceries",
                   "Fashion"]
    
    
    var body: some View {
        //created lists
        
        VStack{
            NavigationView{
                List{
                    ForEach(thelist, id: \.self){ list in
                        NavigationLink(destination: ItemListView()){
                            Image(systemName: "circle.circle")
                            Text(list)
                        }
                        .navigationTitle("THE LIST")
                    }
                }
                
            }
            .navigationTitle("THE LIST")
            .bold()
            
            //button for add
           
                Button {
                }label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.blue)
                            .controlSize(.mini)
                        
                        Text("ADD")
                            .foregroundColor(Color.white)
                            .bold()
                        
                    }
                }
                .frame(width: 100, height:50)
               
            
        }
    }
    
    
    
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView()
        }
    }
}
