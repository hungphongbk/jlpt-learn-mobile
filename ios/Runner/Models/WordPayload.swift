//
//  WordPayload.swift
//  Runner
//
//  Created by Truong Hung Phong on 14/05/2023.
//
import SwiftUI
import Combine
import Foundation
import JlptLearn

class WordPayload:ObservableObject{
    class Kanji:ObservableObject, Hashable {
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        static func == (lhs: WordPayload.Kanji, rhs: WordPayload.Kanji) -> Bool {
            return lhs.id == rhs.id
        }
        
        
        init(id: String = "", hv: String = "") {
            self.id = id
            self.hv = hv
        }
        @Published var id = ""
        @Published var hv = ""
    }
    @Published var word = ""
    @Published var pronounce = ""
    @Published var explain = ""
    @Published var kanjis: [Kanji] = []
    
    var cancellables = [AnyCancellable]()
    init(){
        self.kanjis.forEach({
            let c=$0.objectWillChange.sink(receiveValue: {self.objectWillChange.send()})
            self.cancellables.append(c)
        })
    }
    
    var wordInsertInput:WordInsertInput{
        get{
            return WordInsertInput(explain: explain, pronounce: pronounce, word: word);
        }
    }
    var kanjiUpsertInputPairs: [KanjiUpsertInputPair]{
        get{
            return kanjis.map{
                KanjiUpsertInputPair(hv: $0.hv, id: $0.id)
            }
        }
    }
}
