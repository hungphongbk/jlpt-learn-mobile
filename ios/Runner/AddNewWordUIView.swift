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
//struct JpTextField:UIViewControllerRepresentable{
//    func updateUIViewController(_ uiViewController: UIInputViewController, context: Context) {
//        
//    }
//    
//    @ViewBuilder var content:some View {
//        EmptyView()
//    }
////    override var primaryLanguage: String? {
////        get{
////            return "ja"
////        }
////        set{
////            //
////        }
////    }
////    override func viewDidLoad(){
////        super.viewDidLoad();
////        let keyboardController = UIHostingController(rootView: content)
////        view.addSubview(keyboardController.view)
////    }
//    
//    func makeUIViewController(context: Context) -> UIInputViewController {
//            let pageViewController = UIInputViewController()
//            pageViewController.primaryLanguage="ja"
//            return pageViewController
//        }
//}

struct WordListView:View{
    var body: some View{
        Text("ahihi")
    }
}

struct AddNewWordUIView: View {
    var delegate:AddNewWordDelegate? = nil
    let apolloClient = ApolloClient(url: URL(string: "https://jlpt-learn-hungphongbk.vercel.app/api/graphql")!)
    
    @State private var word: String = ""
    @State private var pronounce: String = ""
    @State private var explain:String = ""
    
    func fetch(){
        apolloClient.fetch(query: JDictQuery(word: word))
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Thêm từ mới")
                        .font(.largeTitle)
                    Spacer()
                }
                .padding()
                Form{
                    Section(header: Text("Từ mới")){
                        LabelledTextField(label: "Từ mới", text: $word, right: {
                            if /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/ {
                                NavigationLink(""){
                                    WordListView()
                                }.frame(width: 40)
                            } else {
                                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
                            }
                        }).onChange(of: word){value in
                            print(value)
                        }
                        LabelledTextField(label: "Kana", text: $pronounce,right:{
                            EmptyView()
                        })
                        TextField("Nghĩa",text:$explain,axis:.vertical)
                    }
                }
                Spacer()
            }
        }
    }
}

struct AddNewWordUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AddNewWordUIView()
        }
    }
}
