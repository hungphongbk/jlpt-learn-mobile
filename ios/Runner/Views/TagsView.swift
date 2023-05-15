//
//  TagsView.swift
//  Runner
//
//  Created by Truong Hung Phong on 15/05/2023.
//

import Foundation
import SwiftUI
import Combine
import JlptLearn

struct TagsView:View{
    typealias Tag = JlptLearn.IOSTagsQuery.Data.Tag
    @State private var _tags:[Tag]? = nil
    @Binding var selecteds:[String]
    
    
    func fetch(){
        apolloClient.fetch(query: IOSTagsQuery()){result in
            guard let data = try? result.get().data else {
                return }
            self._tags = data.tags
        }
    }
    
    func customBind(item: Tag) -> Binding<Bool?>{
        return Binding<Bool?>(
            get:{selecteds.contains { i in
                item.id == i
            }},
            set:{
                if $0 == true{
                    selecteds.append(item.id)
                }else {
                    selecteds.removeAll { i in
                        return i==item.id
                    }
                }
            }
        )
    }
    
    var body: some View{
        if(_tags != nil){
            ForEach(_tags!, id:\.id){item in
                SuggestItem(item: true,selected:customBind(item: item)){
                    Text(item.label)
                }
            }
        }else{
            ProgressView()
                .onAppear{
                    fetch()
                }
        }
    }
}
