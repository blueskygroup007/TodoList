//
//  ContentView.swift
//  TodoList
//
//  Created by 李海永 on 2023/2/7.
//

import SwiftUI

struct ContentView: View {
    
    //ToDo类实现了ObservableObject，成员变量todoList注解为Published，使用者userData注解为ObservedObject（注意与ObservableObject区分）
    @ObservedObject var userData:ToDo=ToDo(data: [SingleToDo(title: "写作业",dueDate: Date())
                                                  ,SingleToDo(title: "复习",dueDate: Date())
                                                  ,SingleToDo(title: "吃饭",dueDate: Date())
                                                  ,SingleToDo(title: "睡觉",dueDate: Date())
                                                 ])
    
    var body: some View{
        ScrollView(.vertical,showsIndicators: true){
            VStack {
                ForEach(userData.todoList){item in
                    SingleCardView(index:item.id)
                        .environmentObject(userData)//这里是使用EnvironmentObject的方法
                        .padding()
                }
            }
           
        }
    }
}

struct SingleCardView:View {
    var index:Int
    //这里添加注解EnvironmentObject,查询了解\@StateObject，@EnvironmentObject和@ObservedObject之间的区别
    @EnvironmentObject var userData:ToDo
    
    var body: some View {
        
        HStack {
            Rectangle().frame(width: 5.0).foregroundColor(.blue)
            VStack(alignment:.leading,spacing: 6.0) {
                Text(userData.todoList[index].title)
                    .font(.headline)
                    .fontWeight(.heavy)
                Text(userData.todoList[index].dueDate.description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.leading)
            Spacer()
            
            Image(systemName: userData.todoList[index].isChecked ? "checkmark.square.fill" : "square")
                .font(.title)//矢量图都可以这么调节大小
                .imageScale(.large)//view的调节大小方法？
                .onTapGesture {
                    userData.todoList[index].isChecked.toggle()
                }
        }
        .frame(height: 80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10,x:0,y:10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

