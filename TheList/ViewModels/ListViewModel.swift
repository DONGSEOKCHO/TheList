//
//  ListViewModel.swift
//  TheList
//
//  Created by Dongseok Cho on 2023-06-21.
//

import Foundation
import SQLite

class ListViewModel: ObservableObject{
    //@Published var theList = ["Camping",
    //"Groceries",
    //"Fashion"]
    
    //init(){}

    private var db: Connection!
    private var items: Table!
    
    private var cat_id: Expression<Int>!
    private var category: Expression<String>!
    //private var quantity: Expression<Int>!
    
    init() {
       
        do {
            
            let path: String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first ?? ""
            
            db = try Connection("\(path)/my_items.sqlite3")
            
            items = Table("items")
            
            cat_id = Expression<Int>("id")
            category = Expression<String>("description")
            
            if (!UserDefaults.standard.bool(forKey:  "is_db_created")) {
                try db.run(items.create { (t) in
                    t.column(cat_id, primaryKey: true)
                    t.column(category)
                })
                UserDefaults.standard.set(true, forKey: "is_db_created")
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    
    public func addItem(descriptionValue: String) {
        do {
            try db.run(items.insert(category <- descriptionValue))
        
        } catch {
            print(error.localizedDescription)
        }
    }
    
    
    
    public func getItems() -> [CategoryListModel] {
        var itemModels: [CategoryListModel] = []
        
        items = items.order(cat_id.desc)
        do {
            for item in try db.prepare(items) {
                let itemModel: CategoryListModel = CategoryListModel()
                itemModel.cat_id = item[cat_id]
                itemModel.category = item[category]
                
                itemModels.append(itemModel)
            }
        } catch {
            print(error.localizedDescription)
        }
        return itemModels
    }
    
    
    
    public func delete() {
        
    }
    
}
