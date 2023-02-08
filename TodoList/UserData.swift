//
//  UserData.swift
//  TodoList
//
//  Created by 李海永 on 2023/2/8.
//

import Foundation

class ToDo:ObservableObject{
    @Published var todoList:[SingleToDo]
    var count=0
    init(){
        todoList=[]
    }
    init(data:[SingleToDo]){
        todoList=[]
        for item in data {
            todoList.append(SingleToDo(title: item.title,dueDate: item.dueDate,id: count))
            count+=1
        }
    }
    
    func check(id:Int)  {
        todoList[id].isChecked=true
    }
}

struct SingleToDo: Identifiable {
    
    var title:String
    var dueDate:Date=Date()
    var isChecked:Bool=false
    var id:Int=0
}
