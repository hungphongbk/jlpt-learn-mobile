// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Query$FlutterAllMetadata {
  Query$FlutterAllMetadata({
    this.tags,
    this.$__typename = 'Query',
  });

  factory Query$FlutterAllMetadata.fromJson(Map<String, dynamic> json) {
    final l$tags = json['tags'];
    final l$$__typename = json['__typename'];
    return Query$FlutterAllMetadata(
      tags: (l$tags as List<dynamic>?)
          ?.map((e) => Query$FlutterAllMetadata$tags.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$FlutterAllMetadata$tags>? tags;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$tags = tags;
    _resultData['tags'] = l$tags?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$tags = tags;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$tags == null ? null : Object.hashAll(l$tags.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FlutterAllMetadata) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (l$tags != null && lOther$tags != null) {
      if (l$tags.length != lOther$tags.length) {
        return false;
      }
      for (int i = 0; i < l$tags.length; i++) {
        final l$tags$entry = l$tags[i];
        final lOther$tags$entry = lOther$tags[i];
        if (l$tags$entry != lOther$tags$entry) {
          return false;
        }
      }
    } else if (l$tags != lOther$tags) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FlutterAllMetadata
    on Query$FlutterAllMetadata {
  CopyWith$Query$FlutterAllMetadata<Query$FlutterAllMetadata> get copyWith =>
      CopyWith$Query$FlutterAllMetadata(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$FlutterAllMetadata<TRes> {
  factory CopyWith$Query$FlutterAllMetadata(
    Query$FlutterAllMetadata instance,
    TRes Function(Query$FlutterAllMetadata) then,
  ) = _CopyWithImpl$Query$FlutterAllMetadata;

  factory CopyWith$Query$FlutterAllMetadata.stub(TRes res) =
      _CopyWithStubImpl$Query$FlutterAllMetadata;

  TRes call({
    List<Query$FlutterAllMetadata$tags>? tags,
    String? $__typename,
  });
  TRes tags(
      Iterable<Query$FlutterAllMetadata$tags>? Function(
              Iterable<
                  CopyWith$Query$FlutterAllMetadata$tags<
                      Query$FlutterAllMetadata$tags>>?)
          _fn);
}

class _CopyWithImpl$Query$FlutterAllMetadata<TRes>
    implements CopyWith$Query$FlutterAllMetadata<TRes> {
  _CopyWithImpl$Query$FlutterAllMetadata(
    this._instance,
    this._then,
  );

  final Query$FlutterAllMetadata _instance;

  final TRes Function(Query$FlutterAllMetadata) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tags = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FlutterAllMetadata(
        tags: tags == _undefined
            ? _instance.tags
            : (tags as List<Query$FlutterAllMetadata$tags>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes tags(
          Iterable<Query$FlutterAllMetadata$tags>? Function(
                  Iterable<
                      CopyWith$Query$FlutterAllMetadata$tags<
                          Query$FlutterAllMetadata$tags>>?)
              _fn) =>
      call(
          tags: _fn(
              _instance.tags?.map((e) => CopyWith$Query$FlutterAllMetadata$tags(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$FlutterAllMetadata<TRes>
    implements CopyWith$Query$FlutterAllMetadata<TRes> {
  _CopyWithStubImpl$Query$FlutterAllMetadata(this._res);

  TRes _res;

  call({
    List<Query$FlutterAllMetadata$tags>? tags,
    String? $__typename,
  }) =>
      _res;
  tags(_fn) => _res;
}

const documentNodeQueryFlutterAllMetadata = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'FlutterAllMetadata'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'tags'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'label'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
]);
Query$FlutterAllMetadata _parserFn$Query$FlutterAllMetadata(
        Map<String, dynamic> data) =>
    Query$FlutterAllMetadata.fromJson(data);
typedef OnQueryComplete$Query$FlutterAllMetadata = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$FlutterAllMetadata?,
);

class Options$Query$FlutterAllMetadata
    extends graphql.QueryOptions<Query$FlutterAllMetadata> {
  Options$Query$FlutterAllMetadata({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FlutterAllMetadata? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$FlutterAllMetadata? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          pollInterval: pollInterval,
          context: context,
          onComplete: onComplete == null
              ? null
              : (data) => onComplete(
                    data,
                    data == null
                        ? null
                        : _parserFn$Query$FlutterAllMetadata(data),
                  ),
          onError: onError,
          document: documentNodeQueryFlutterAllMetadata,
          parserFn: _parserFn$Query$FlutterAllMetadata,
        );

  final OnQueryComplete$Query$FlutterAllMetadata? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$FlutterAllMetadata
    extends graphql.WatchQueryOptions<Query$FlutterAllMetadata> {
  WatchOptions$Query$FlutterAllMetadata({
    String? operationName,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$FlutterAllMetadata? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryFlutterAllMetadata,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$FlutterAllMetadata,
        );
}

class FetchMoreOptions$Query$FlutterAllMetadata
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$FlutterAllMetadata(
      {required graphql.UpdateQuery updateQuery})
      : super(
          updateQuery: updateQuery,
          document: documentNodeQueryFlutterAllMetadata,
        );
}

extension ClientExtension$Query$FlutterAllMetadata on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$FlutterAllMetadata>>
      query$FlutterAllMetadata(
              [Options$Query$FlutterAllMetadata? options]) async =>
          await this.query(options ?? Options$Query$FlutterAllMetadata());
  graphql.ObservableQuery<Query$FlutterAllMetadata>
      watchQuery$FlutterAllMetadata(
              [WatchOptions$Query$FlutterAllMetadata? options]) =>
          this.watchQuery(options ?? WatchOptions$Query$FlutterAllMetadata());
  void writeQuery$FlutterAllMetadata({
    required Query$FlutterAllMetadata data,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
            operation: graphql.Operation(
                document: documentNodeQueryFlutterAllMetadata)),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$FlutterAllMetadata? readQuery$FlutterAllMetadata(
      {bool optimistic = true}) {
    final result = this.readQuery(
      graphql.Request(
          operation:
              graphql.Operation(document: documentNodeQueryFlutterAllMetadata)),
      optimistic: optimistic,
    );
    return result == null ? null : Query$FlutterAllMetadata.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$FlutterAllMetadata>
    useQuery$FlutterAllMetadata([Options$Query$FlutterAllMetadata? options]) =>
        graphql_flutter.useQuery(options ?? Options$Query$FlutterAllMetadata());
graphql.ObservableQuery<Query$FlutterAllMetadata>
    useWatchQuery$FlutterAllMetadata(
            [WatchOptions$Query$FlutterAllMetadata? options]) =>
        graphql_flutter
            .useWatchQuery(options ?? WatchOptions$Query$FlutterAllMetadata());

class Query$FlutterAllMetadata$Widget
    extends graphql_flutter.Query<Query$FlutterAllMetadata> {
  Query$FlutterAllMetadata$Widget({
    widgets.Key? key,
    Options$Query$FlutterAllMetadata? options,
    required graphql_flutter.QueryBuilder<Query$FlutterAllMetadata> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$FlutterAllMetadata(),
          builder: builder,
        );
}

class Query$FlutterAllMetadata$tags {
  Query$FlutterAllMetadata$tags({
    required this.id,
    required this.label,
    this.$__typename = 'Tag',
  });

  factory Query$FlutterAllMetadata$tags.fromJson(Map<String, dynamic> json) {
    final l$id = json['id'];
    final l$label = json['label'];
    final l$$__typename = json['__typename'];
    return Query$FlutterAllMetadata$tags(
      id: (l$id as String),
      label: (l$label as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String id;

  final String label;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$id = id;
    _resultData['id'] = l$id;
    final l$label = label;
    _resultData['label'] = l$label;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$id = id;
    final l$label = label;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$id,
      l$label,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$FlutterAllMetadata$tags) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$id = id;
    final lOther$id = other.id;
    if (l$id != lOther$id) {
      return false;
    }
    final l$label = label;
    final lOther$label = other.label;
    if (l$label != lOther$label) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$FlutterAllMetadata$tags
    on Query$FlutterAllMetadata$tags {
  CopyWith$Query$FlutterAllMetadata$tags<Query$FlutterAllMetadata$tags>
      get copyWith => CopyWith$Query$FlutterAllMetadata$tags(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$FlutterAllMetadata$tags<TRes> {
  factory CopyWith$Query$FlutterAllMetadata$tags(
    Query$FlutterAllMetadata$tags instance,
    TRes Function(Query$FlutterAllMetadata$tags) then,
  ) = _CopyWithImpl$Query$FlutterAllMetadata$tags;

  factory CopyWith$Query$FlutterAllMetadata$tags.stub(TRes res) =
      _CopyWithStubImpl$Query$FlutterAllMetadata$tags;

  TRes call({
    String? id,
    String? label,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$FlutterAllMetadata$tags<TRes>
    implements CopyWith$Query$FlutterAllMetadata$tags<TRes> {
  _CopyWithImpl$Query$FlutterAllMetadata$tags(
    this._instance,
    this._then,
  );

  final Query$FlutterAllMetadata$tags _instance;

  final TRes Function(Query$FlutterAllMetadata$tags) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? id = _undefined,
    Object? label = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$FlutterAllMetadata$tags(
        id: id == _undefined || id == null ? _instance.id : (id as String),
        label: label == _undefined || label == null
            ? _instance.label
            : (label as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$FlutterAllMetadata$tags<TRes>
    implements CopyWith$Query$FlutterAllMetadata$tags<TRes> {
  _CopyWithStubImpl$Query$FlutterAllMetadata$tags(this._res);

  TRes _res;

  call({
    String? id,
    String? label,
    String? $__typename,
  }) =>
      _res;
}
