// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == JlptLearn.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == JlptLearn.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == JlptLearn.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == JlptLearn.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> Object? {
    switch typename {
    case "Mutation": return JlptLearn.Objects.Mutation
    case "Word": return JlptLearn.Objects.Word
    case "Query": return JlptLearn.Objects.Query
    case "Kanji": return JlptLearn.Objects.Kanji
    case "JDictAPIResult": return JlptLearn.Objects.JDictAPIResult
    case "JDictWord": return JlptLearn.Objects.JDictWord
    case "JDictKanji": return JlptLearn.Objects.JDictKanji
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
