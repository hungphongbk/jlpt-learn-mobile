//
//  SuggestView.swift
//  Runner
//
//  Created by Truong Hung Phong on 13/05/2023.
//

import SwiftUI
import JlptLearn

typealias Datum = JDictQuery.Data.JdictSearchWord.Datum

struct SuggestView: View {
    var data: [Datum] = []
    var body: some View{
        List(data, id:\.self.hashValue){item in
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

struct SuggestView_Previews: PreviewProvider {
    static var previews: some View {
        SuggestView(data: [
            Datum(_fieldData: ["word":"読む", "kana":"よむ", "suggest_mean":"đọc"]),
            Datum(_fieldData: ["word":"飲む", "kana":"のむ", "suggest_mean":"uống"]),
        ])
    }
}
