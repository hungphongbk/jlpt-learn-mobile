//
//  AddNewWordUIView.swift
//  Runner
//
//  Created by Truong Hung Phong on 11/05/2023.
//

import SwiftUI
import Foundation
import Apollo
import ApolloAPI
import JlptLearn

protocol AddNewWordDelegate{
    var show: Bool { get set }
    var initialWord: Published<String>.Publisher { get }
}

protocol PLabelledTextField{
    //    associatedtype T: View
    var right:AnyView{get}
}
struct LabelledTextField<T: View>: View{
    let label:String
    @Binding var text:String
    @ViewBuilder var right:()->T
    
    var body:some View{
        HStack(alignment: .center, spacing: 16){
            Text(label)
            TextField(label,text:$text)
                .frame(maxWidth: .infinity)
            right()
        }
    }
}

class WordPayload:ObservableObject{
    struct Kanji{
        var id = ""
        var hv = ""
    }
    @Published var word = ""
    @Published var pronounce = ""
    @Published var explain = ""
    @Published var kanjis: [Kanji] = []
}

struct AddNewWordUIView: View {
    var delegate:AddNewWordDelegate
    
    @StateObject private var payload = WordPayload()
    
    @State private var list: [Datum] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Form{
                    Section(header: Text("Từ mới")){
                        LabelledTextField(label: "Từ mới", text: $payload.word, right: {
                            if payload.word.count>0 {
                                NavigationLink(destination: SuggestView(payload: payload), label: {
                                    Text("")
                                }).frame(width: 40)
                            } else {
                                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                            }
                        }).onReceive(delegate.initialWord, perform: {
                            self.payload.word = $0
                        })
                        LabelledTextField(label: "Kana", text: $payload.pronounce,right:{
                            EmptyView()
                        })
                        TextField("Nghĩa",text:$payload.explain,axis:.vertical)
                    }
                    if(!payload.kanjis.isEmpty){
                        Section(header: Text("Hán tự")){
                            LazyVGrid(columns: [
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible()),
                            ],spacing: 4) {
                                ForEach(payload.kanjis, id: \.id) {
                                    kanji in ZStack{
                                        Rectangle().fill(.black).opacity(0.12).aspectRatio(1.0,contentMode: .fill)
                                        VStack(spacing: 8){
                                            Text(kanji.id).font(.largeTitle)
                                            Text(kanji.hv).font(.caption2)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text("Thêm từ mới"),displayMode: .inline)
        }
    }
}

class EmptyDelegate:AddNewWordDelegate{
    var show: Bool = false
    
    @Published var _initialWord: String = ""
    var initialWord: Published<String>.Publisher { $_initialWord }
}
struct AddNewWordUIView_Previews: PreviewProvider {
    static let delegate = EmptyDelegate()
    static var previews: some View {
        VStack{
            AddNewWordUIView(delegate: delegate)
        }
    }
}
