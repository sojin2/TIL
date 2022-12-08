//
//  ArratList.swift
//  TableView_SwiftUI
//
//  Created by 김소진 on 2022/12/03.
//

import SwiftUI

struct item: Identifiable {
    var id = UUID()
    let name: String
}

struct ArratList: View {
    @State private var items: [item] = [
        item(name: "소진"),
        item(name: "혜린"),
        item(name: "도희"),
    ]
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
            .onDelete(perform: didDeleteCell)
            .onMove(perform: didMoveCell)
        }
        .listStyle(.insetGrouped)
        .navigationBarItems(trailing: EditButton())
            
    }
    
    func didDeleteCell(at offsets: IndexSet) {
            items.remove(atOffsets: offsets)
            print("Deleted cell is \(offsets)")
        }
    
    func didMoveCell(from sorce: IndexSet, to destination: Int){
        items.move(fromOffsets: sorce, toOffset: destination)
        }
}

struct ArratList_Previews: PreviewProvider {
    static var previews: some View {
        ArratList()
    }
}
