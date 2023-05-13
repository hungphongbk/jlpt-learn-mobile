//
//  KanjiEdit.swift
//  Runner
//
//  Created by Truong Hung Phong on 14/05/2023.
//

import SwiftUI

struct KanjiButton: View{
    @ObservedObject var kanji: WordPayload.Kanji
    
    @State private var isActive = false
    
    var body:some View{
        ZStack{
            Rectangle().fill(.black).opacity(0.12).aspectRatio(1.0,contentMode: .fill).cornerRadius(4.0)
            VStack(spacing: 8){
                Text(kanji.id).font(.largeTitle)
                Text(kanji.hv).font(.caption2).opacity(0.9).textCase(.uppercase)
            }
        }
        .background(NavigationLink(destination: KanjiEdit(kanji: kanji), isActive: $isActive, label:{
            EmptyView()
        }).hidden())
        .onTapGesture {
            isActive.toggle()
        }
    }
}

struct KanjiButton_Previews: PreviewProvider{
    static var kanjis: [WordPayload.Kanji] = [
        WordPayload.Kanji(id:"神",hv:"thần")
    ]
    static var previews: some View {
        Form{
            //            Section(header:Text("Example")){
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
            ],spacing: 4) {
                ForEach(kanjis, id: \.id) {
                    kanji in KanjiButton(kanji: kanji)
                }
            }
            //            }
        }
    }
}

struct KanjiEdit: View {
    @ObservedObject var kanji: WordPayload.Kanji
    
    var body: some View {
        VStack(alignment: .leading){
            Form{
                Section(header: Text("Chỉnh sửa")){
                    LabelledTextField(label:"Hán Việt",text: $kanji.hv,right:{EmptyView()})
                }
            }
            Spacer()
        }.navigationBarTitle(Text("Kanji \(kanji.id)"))
    }
}
