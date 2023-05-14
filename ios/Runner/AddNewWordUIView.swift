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

let apolloClient = ApolloClient(url: URL(string: "https://jlpt-learn-hungphongbk.vercel.app/api/graphql")!)

func ??<T>(binding: Binding<T?>, fallback: T) -> Binding<T> {
    return Binding(get: {
        binding.wrappedValue ?? fallback
    }, set: {
        binding.wrappedValue = $0
    })
}

struct AddNewWordUIView: View {
    @EnvironmentObject var hostingProvider: ViewControllerProvider
    
    var delegate:AddNewWordDelegate
    
    @StateObject private var payload = WordPayload()
    @State private var isSuccess: Bool? = nil
    @State private var list: [Datum] = []
    
    func perform(){
        isSuccess = false
        apolloClient.perform(mutation: AddNewWordMutation(word: payload.wordInsertInput, kanjis: payload.kanjiUpsertInputPairs)){
            result in
            switch result {
            case .success(_):
                isSuccess = true
            case .failure(let error):
                print("error: \(error)")
                isSuccess = nil
            }
        }
    }
    
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
                                    kanji in
                                    KanjiButton(kanji: kanji)
                                }
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationBarTitle(Text("Từ mới"),displayMode: .inline)
            .toolbar {
                ToolbarItem(placement:.navigationBarTrailing) {
                    HStack(spacing: 4){
                        Button("Thêm"){
                            perform()
                        }.disabled(isSuccess == false)
                        if isSuccess == false {
                            ProgressView()
                        }
                    }
                }
            }.toast(message: "Success", isShowing: $isSuccess ?? false, duration: Toast.short, onDisappear: {
                hostingProvider.viewController?.dismiss(animated: true)
            })
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
