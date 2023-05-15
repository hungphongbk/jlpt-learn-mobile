// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class IOSTagsQuery: GraphQLQuery {
  public static let operationName: String = "IOSTags"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      #"""
      query IOSTags {
        tags {
          __typename
          id
          label
        }
      }
      """#
    ))

  public init() {}

  public struct Data: JlptLearn.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("tags", [Tag]?.self),
    ] }

    public var tags: [Tag]? { __data["tags"] }

    /// Tag
    ///
    /// Parent Type: `Tag`
    public struct Tag: JlptLearn.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { JlptLearn.Objects.Tag }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("id", String.self),
        .field("label", String.self),
      ] }

      public var id: String { __data["id"] }
      public var label: String { __data["label"] }
    }
  }
}
