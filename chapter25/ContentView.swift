//
//  ContentView.swift
//  chapter25
//
//  Created by Y on 2020/06/06.
//  Copyright © 2020 HEETAE YANG. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var toggleStatus = true
    
    var body: some View {
        
        NavigationView {
            List {
                Section(header: Text("설정")){
                    Toggle(isOn: $toggleStatus) {
                        Text("알람 설정")
                    }
                }
                Section(header: Text("할일")){
                    ForEach(listData) { item in
                        HStack {
                            NavigationLink(destination: Text(item.task)) {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }
                        }
                    }.onDelete(perform: deleteItem)
                    .onMove(perform: moveItem)
                }
            }
            .navigationBarTitle(Text("할일"))
            .navigationBarItems(trailing: EditButton())
        }
    }
}
// 부가적인 작업을 수행하는 버튼도 추가할 수 있다.

// 제목을 설정하기 위해서 리스트 컴포넌트의 수정자를 사용하여 네비게이션뷰 타이틀 바를 설정할수있다.
// 이제 리스트에는 각 셀에 대한 뷰가 필요 없다. 그 대신 데이터 배열에 대한 반복문을 실행하면서 동일하게 선언된 HStack 선언부를 재사용하고 각 배열 항목에서의 적절한 데이터를 연결한다.
// 리스트에 동적 데이터와 정적 데이터를 함께 표현해야 하는 경우, ForEach 구문을 리스트의 body에서 사용하여 동적 데이터에 대해 반복문을 돌리면서 정적항목을 선언할 수 있다. 동기:동적데이터 VS 비동기:정적데이터. 정적 항목인 토글 버튼과 함께 동적 데이터에 대한 ForEach 구문을 사용하고 있다.


// list 구현체는 section 뷰를 이용하여 헤더와 푸터가 있는 섹션으로 나눌 수도 있다. 헤더가 있는 두 개의 섹션으로 나눠진 리스트를 보여준다.

// 리스트의 항목을 사용자가 터치하면 앱의 다른 화면으로 이동해야 할 경우가 종종 있다. 이런 동작은 네비게이션 또는 네비게이션 링크를 사용하여 구현한다.

// 리스트에 있는 항목을 터치하여 이동하게 만들려면 먼저 리스트를 NavigationView 안에 넣어야 한다. 그런후에 리스트의 각 행을 navigationLinka 컨트롤로 감싸고 사용자가 터치하면 대상 뷰로 이동되도록 구성한다.

func deleteItem(at offsets: IndexSet) {
    
}

func moveItem(from source: IndexSet, to destination: Int) {

}
    
struct ToDoList: Identifiable {
    var id = UUID()
    var imageName: String
    var task: String
}

var listData: [ToDoList] = [
    ToDoList(imageName: "trash.fill", task: "take out trash"),
    ToDoList(imageName: "person.fill", task: "pick up the kids"),
    ToDoList(imageName: "car.fill", task: "wash the car")
]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
