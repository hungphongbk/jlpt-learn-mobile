//
//  SuggestView.swift
//  Runner
//
//  Created by Truong Hung Phong on 13/05/2023.
//

import SwiftUI
import JlptLearn
import Apollo

typealias Datum = JDictQuery.Data.JdictSearchWord.Datum

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct SuggestItem<Content:View>:View{
    var selected: Binding<Datum?>
    var item:Datum
    let content:Content
    
    init(item:Datum, selected: Binding<Datum?>, @ViewBuilder _ content:()->Content){
        self.item = item
        self.selected = selected
        self.content = content()
    }
    
    var body:some View{
        HStack{
            content
            Spacer()
            if(selected.wrappedValue == item){
                Image(systemName: "checkmark")
                    .foregroundColor(.accentColor)
            }
        }
        .onTapGesture {
            self.selected.wrappedValue = item
        }
    }
}
struct SuggestView: View {
    @ObservedObject var payload:WordPayload
    
    @State private var data: [Datum] = []
    @State private var loading = false
    @Environment(\.dismiss) var dismiss
    
    let apolloClient = ApolloClient(url: URL(string: "https://jlpt-learn-hungphongbk.vercel.app/api/graphql")!)
    
    @State private var selection: Datum?
    
    func fetch(){
        loading = true
        apolloClient.fetch(query: JDictQuery(word: payload.word)){result in
            guard let data = try? result.get().data else {
                loading=false
                return }
            self.data = data.jdictSearchWord.data
            loading=false
        }
    }
    
    var body: some View{
        ZStack{
            if loading { ProgressView() } else { List(data, id: \.hashValue) {item in
                SuggestItem(item: item, selected: $selection){
                    VStack{
                        HStack{
                            Text(item.word)
                            Text(item.kana).opacity(0.5)
                            Spacer()
                        }
                        HStack{
                            Text(item.suggest_mean)
                            Spacer()
                        }.padding(.top, 0.1)
                    }
                }
            }
            }
        }
        .navigationBarTitle(Text("Danh sách từ vựng"),displayMode: .inline)
        .toolbar {
            ToolbarItem(
                placement: .navigationBarTrailing
            ) {
                Button("Chọn"){
                    if selection != nil {
//                        resultHandler?(selection!)
                        payload.word = selection!.word
                        payload.pronounce = selection!.kana
                        payload.explain = selection!.suggest_mean
                        payload.kanjis = selection!.kanjis.map{ k in
                            WordPayload.Kanji(id: k.kanji, hv: k.hanviet.lowercased())
                        }
                        
                        dismiss()
                    }
                }.disabled(selection == nil)
            }
        }
        .onChange(of: selection, perform: {value in
            print(value?.word ?? "-")
        })
        .task {
            if payload.word.count > 0 {
                fetch()
            }
        }
    }
}

struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        @StateObject var payload = WordPayload()
        SuggestView(payload: payload)
    }
}
