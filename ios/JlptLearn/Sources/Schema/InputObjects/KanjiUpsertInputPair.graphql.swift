// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct KanjiUpsertInputPair: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    hv: String,
    id: String
  ) {
    __data = InputDict([
      "hv": hv,
      "id": id
    ])
  }

  public var hv: String {
    get { __data["hv"] }
    set { __data["hv"] = newValue }
  }

  public var id: String {
    get { __data["id"] }
    set { __data["id"] = newValue }
  }
}
