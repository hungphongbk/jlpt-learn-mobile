// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct WordInsertInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    explain: String,
    pronounce: String,
    tags: GraphQLNullable<[String]> = nil,
    word: String
  ) {
    __data = InputDict([
      "explain": explain,
      "pronounce": pronounce,
      "tags": tags,
      "word": word
    ])
  }

  public var explain: String {
    get { __data["explain"] }
    set { __data["explain"] = newValue }
  }

  public var pronounce: String {
    get { __data["pronounce"] }
    set { __data["pronounce"] = newValue }
  }

  public var tags: GraphQLNullable<[String]> {
    get { __data["tags"] }
    set { __data["tags"] = newValue }
  }

  public var word: String {
    get { __data["word"] }
    set { __data["word"] = newValue }
  }
}
