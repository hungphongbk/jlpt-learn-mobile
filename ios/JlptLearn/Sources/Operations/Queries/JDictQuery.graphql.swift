// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class JDictQuery: GraphQLQuery {
  public static let operationName: String = "JDict"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query JDict($word: String!) {
        jdictSearchWord(word: $word) {
          __typename
          data {
            __typename
            id
            word
            kana
            suggest_mean
            kanjis {
              __typename
              id
              kanji
              hanviet
            }
          }
        }
      }
      """#
    ))

  public var word: String

  public init(word: String) {
    self.word = word
  }

  public var __variables: Variables? { ["word": word] }

  public struct Data: JlptLearn.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("jdictSearchWord", JdictSearchWord.self, arguments: ["word": .variable("word")]),
    ] }

    public var jdictSearchWord: JdictSearchWord { __data["jdictSearchWord"] }

    /// JdictSearchWord
    ///
    /// Parent Type: `JDictAPIResult`
    public struct JdictSearchWord: JlptLearn.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.JDictAPIResult }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("data", [Datum].self),
      ] }

      public var data: [Datum] { __data["data"] }

      /// JdictSearchWord.Datum
      ///
      /// Parent Type: `JDictWord`
      public struct Datum: JlptLearn.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.JDictWord }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("word", String.self),
          .field("kana", String.self),
          .field("suggest_mean", String.self),
          .field("kanjis", [Kanji].self),
        ] }

        public var id: Int { __data["id"] }
        public var word: String { __data["word"] }
        public var kana: String { __data["kana"] }
        public var suggest_mean: String { __data["suggest_mean"] }
        public var kanjis: [Kanji] { __data["kanjis"] }

        /// JdictSearchWord.Datum.Kanji
        ///
        /// Parent Type: `JDictKanji`
        public struct Kanji: JlptLearn.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.JDictKanji }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("id", Int.self),
            .field("kanji", String.self),
            .field("hanviet", String.self),
          ] }

          public var id: Int { __data["id"] }
          public var kanji: String { __data["kanji"] }
          public var hanviet: String { __data["hanviet"] }
        }
      }
    }
  }
}
