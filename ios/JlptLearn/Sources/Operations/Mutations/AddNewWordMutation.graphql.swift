// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class AddNewWordMutation: GraphQLMutation {
  public static let operationName: String = "AddNewWord"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      mutation AddNewWord($word: WordInsertInput!, $kanjis: [KanjiUpsertInputPair!]!) {
        upsertKanjis(kanjis: $kanjis)
        addNewWord(word: $word) {
          __typename
          id
        }
      }
      """#
    ))

  public var word: WordInsertInput
  public var kanjis: [KanjiUpsertInputPair]

  public init(
    word: WordInsertInput,
    kanjis: [KanjiUpsertInputPair]
  ) {
    self.word = word
    self.kanjis = kanjis
  }

  public var __variables: Variables? { [
    "word": word,
    "kanjis": kanjis
  ] }

  public struct Data: JlptLearn.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("upsertKanjis", Bool.self, arguments: ["kanjis": .variable("kanjis")]),
      .field("addNewWord", AddNewWord.self, arguments: ["word": .variable("word")]),
    ] }

    public var upsertKanjis: Bool { __data["upsertKanjis"] }
    public var addNewWord: AddNewWord { __data["addNewWord"] }

    /// AddNewWord
    ///
    /// Parent Type: `Word`
    public struct AddNewWord: JlptLearn.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Word }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", JlptLearn.ID.self),
      ] }

      public var id: JlptLearn.ID { __data["id"] }
    }
  }
}
