// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MobileGetOneKanjiQuery: GraphQLQuery {
  public static let operationName: String = "MobileGetOneKanji"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query MobileGetOneKanji($id: String!) {
        kanji(id: $id) {
          __typename
          id
          hv
        }
      }
      """#
    ))

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: JlptLearn.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("kanji", Kanji.self, arguments: ["id": .variable("id")]),
    ] }

    public var kanji: Kanji { __data["kanji"] }

    /// Kanji
    ///
    /// Parent Type: `Kanji`
    public struct Kanji: JlptLearn.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Kanji }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("hv", String?.self),
      ] }

      public var id: String { __data["id"] }
      public var hv: String? { __data["hv"] }
    }
  }
}
