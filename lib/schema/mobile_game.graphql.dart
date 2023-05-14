// ignore_for_file: type=lint
import 'dart:async';
import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;
import 'schema.graphql.dart';

class Variables$Query$MobileGame {
  factory Variables$Query$MobileGame({
    Input$WordQueryInput? where,
    int? limit,
  }) =>
      Variables$Query$MobileGame._({
        if (where != null) r'where': where,
        if (limit != null) r'limit': limit,
      });

  Variables$Query$MobileGame._(this._$data);

  factory Variables$Query$MobileGame.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('where')) {
      final l$where = data['where'];
      result$data['where'] = l$where == null
          ? null
          : Input$WordQueryInput.fromJson((l$where as Map<String, dynamic>));
    }
    if (data.containsKey('limit')) {
      final l$limit = data['limit'];
      result$data['limit'] = (l$limit as int?);
    }
    return Variables$Query$MobileGame._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$WordQueryInput? get where => (_$data['where'] as Input$WordQueryInput?);
  int? get limit => (_$data['limit'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('where')) {
      final l$where = where;
      result$data['where'] = l$where?.toJson();
    }
    if (_$data.containsKey('limit')) {
      final l$limit = limit;
      result$data['limit'] = l$limit;
    }
    return result$data;
  }

  CopyWith$Variables$Query$MobileGame<Variables$Query$MobileGame>
      get copyWith => CopyWith$Variables$Query$MobileGame(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$MobileGame) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$where = where;
    final lOther$where = other.where;
    if (_$data.containsKey('where') != other._$data.containsKey('where')) {
      return false;
    }
    if (l$where != lOther$where) {
      return false;
    }
    final l$limit = limit;
    final lOther$limit = other.limit;
    if (_$data.containsKey('limit') != other._$data.containsKey('limit')) {
      return false;
    }
    if (l$limit != lOther$limit) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$where = where;
    final l$limit = limit;
    return Object.hashAll([
      _$data.containsKey('where') ? l$where : const {},
      _$data.containsKey('limit') ? l$limit : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$MobileGame<TRes> {
  factory CopyWith$Variables$Query$MobileGame(
    Variables$Query$MobileGame instance,
    TRes Function(Variables$Query$MobileGame) then,
  ) = _CopyWithImpl$Variables$Query$MobileGame;

  factory CopyWith$Variables$Query$MobileGame.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$MobileGame;

  TRes call({
    Input$WordQueryInput? where,
    int? limit,
  });
}

class _CopyWithImpl$Variables$Query$MobileGame<TRes>
    implements CopyWith$Variables$Query$MobileGame<TRes> {
  _CopyWithImpl$Variables$Query$MobileGame(
    this._instance,
    this._then,
  );

  final Variables$Query$MobileGame _instance;

  final TRes Function(Variables$Query$MobileGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? where = _undefined,
    Object? limit = _undefined,
  }) =>
      _then(Variables$Query$MobileGame._({
        ..._instance._$data,
        if (where != _undefined) 'where': (where as Input$WordQueryInput?),
        if (limit != _undefined) 'limit': (limit as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$MobileGame<TRes>
    implements CopyWith$Variables$Query$MobileGame<TRes> {
  _CopyWithStubImpl$Variables$Query$MobileGame(this._res);

  TRes _res;

  call({
    Input$WordQueryInput? where,
    int? limit,
  }) =>
      _res;
}

class Query$MobileGame {
  Query$MobileGame({
    this.words,
    this.$__typename = 'Query',
  });

  factory Query$MobileGame.fromJson(Map<String, dynamic> json) {
    final l$words = json['words'];
    final l$$__typename = json['__typename'];
    return Query$MobileGame(
      words: (l$words as List<dynamic>?)
          ?.map((e) =>
              Query$MobileGame$words.fromJson((e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MobileGame$words>? words;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$words = words;
    _resultData['words'] = l$words?.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$words = words;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$words == null ? null : Object.hashAll(l$words.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MobileGame) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$words = words;
    final lOther$words = other.words;
    if (l$words != null && lOther$words != null) {
      if (l$words.length != lOther$words.length) {
        return false;
      }
      for (int i = 0; i < l$words.length; i++) {
        final l$words$entry = l$words[i];
        final lOther$words$entry = lOther$words[i];
        if (l$words$entry != lOther$words$entry) {
          return false;
        }
      }
    } else if (l$words != lOther$words) {
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

extension UtilityExtension$Query$MobileGame on Query$MobileGame {
  CopyWith$Query$MobileGame<Query$MobileGame> get copyWith =>
      CopyWith$Query$MobileGame(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MobileGame<TRes> {
  factory CopyWith$Query$MobileGame(
    Query$MobileGame instance,
    TRes Function(Query$MobileGame) then,
  ) = _CopyWithImpl$Query$MobileGame;

  factory CopyWith$Query$MobileGame.stub(TRes res) =
      _CopyWithStubImpl$Query$MobileGame;

  TRes call({
    List<Query$MobileGame$words>? words,
    String? $__typename,
  });
  TRes words(
      Iterable<Query$MobileGame$words>? Function(
              Iterable<
                  CopyWith$Query$MobileGame$words<Query$MobileGame$words>>?)
          _fn);
}

class _CopyWithImpl$Query$MobileGame<TRes>
    implements CopyWith$Query$MobileGame<TRes> {
  _CopyWithImpl$Query$MobileGame(
    this._instance,
    this._then,
  );

  final Query$MobileGame _instance;

  final TRes Function(Query$MobileGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? words = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MobileGame(
        words: words == _undefined
            ? _instance.words
            : (words as List<Query$MobileGame$words>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes words(
          Iterable<Query$MobileGame$words>? Function(
                  Iterable<
                      CopyWith$Query$MobileGame$words<Query$MobileGame$words>>?)
              _fn) =>
      call(
          words:
              _fn(_instance.words?.map((e) => CopyWith$Query$MobileGame$words(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$MobileGame<TRes>
    implements CopyWith$Query$MobileGame<TRes> {
  _CopyWithStubImpl$Query$MobileGame(this._res);

  TRes _res;

  call({
    List<Query$MobileGame$words>? words,
    String? $__typename,
  }) =>
      _res;
  words(_fn) => _res;
}

const documentNodeQueryMobileGame = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MobileGame'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'where')),
        type: NamedTypeNode(
          name: NameNode(value: 'WordQueryInput'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'words'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'where'),
            value: VariableNode(name: NameNode(value: 'where')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'word'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'pronounce'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'explain'),
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
Query$MobileGame _parserFn$Query$MobileGame(Map<String, dynamic> data) =>
    Query$MobileGame.fromJson(data);
typedef OnQueryComplete$Query$MobileGame = FutureOr<void> Function(
  Map<String, dynamic>?,
  Query$MobileGame?,
);

class Options$Query$MobileGame extends graphql.QueryOptions<Query$MobileGame> {
  Options$Query$MobileGame({
    String? operationName,
    Variables$Query$MobileGame? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MobileGame? typedOptimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
    OnQueryComplete$Query$MobileGame? onComplete,
    graphql.OnQueryError? onError,
  })  : onCompleteWithParsed = onComplete,
        super(
          variables: variables?.toJson() ?? {},
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
                    data == null ? null : _parserFn$Query$MobileGame(data),
                  ),
          onError: onError,
          document: documentNodeQueryMobileGame,
          parserFn: _parserFn$Query$MobileGame,
        );

  final OnQueryComplete$Query$MobileGame? onCompleteWithParsed;

  @override
  List<Object?> get properties => [
        ...super.onComplete == null
            ? super.properties
            : super.properties.where((property) => property != onComplete),
        onCompleteWithParsed,
      ];
}

class WatchOptions$Query$MobileGame
    extends graphql.WatchQueryOptions<Query$MobileGame> {
  WatchOptions$Query$MobileGame({
    String? operationName,
    Variables$Query$MobileGame? variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Query$MobileGame? typedOptimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables?.toJson() ?? {},
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult ?? typedOptimisticResult?.toJson(),
          context: context,
          document: documentNodeQueryMobileGame,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$MobileGame,
        );
}

class FetchMoreOptions$Query$MobileGame extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$MobileGame({
    required graphql.UpdateQuery updateQuery,
    Variables$Query$MobileGame? variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables?.toJson() ?? {},
          document: documentNodeQueryMobileGame,
        );
}

extension ClientExtension$Query$MobileGame on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$MobileGame>> query$MobileGame(
          [Options$Query$MobileGame? options]) async =>
      await this.query(options ?? Options$Query$MobileGame());
  graphql.ObservableQuery<Query$MobileGame> watchQuery$MobileGame(
          [WatchOptions$Query$MobileGame? options]) =>
      this.watchQuery(options ?? WatchOptions$Query$MobileGame());
  void writeQuery$MobileGame({
    required Query$MobileGame data,
    Variables$Query$MobileGame? variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(document: documentNodeQueryMobileGame),
          variables: variables?.toJson() ?? const {},
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$MobileGame? readQuery$MobileGame({
    Variables$Query$MobileGame? variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(document: documentNodeQueryMobileGame),
        variables: variables?.toJson() ?? const {},
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Query$MobileGame.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$MobileGame> useQuery$MobileGame(
        [Options$Query$MobileGame? options]) =>
    graphql_flutter.useQuery(options ?? Options$Query$MobileGame());
graphql.ObservableQuery<Query$MobileGame> useWatchQuery$MobileGame(
        [WatchOptions$Query$MobileGame? options]) =>
    graphql_flutter.useWatchQuery(options ?? WatchOptions$Query$MobileGame());

class Query$MobileGame$Widget extends graphql_flutter.Query<Query$MobileGame> {
  Query$MobileGame$Widget({
    widgets.Key? key,
    Options$Query$MobileGame? options,
    required graphql_flutter.QueryBuilder<Query$MobileGame> builder,
  }) : super(
          key: key,
          options: options ?? Options$Query$MobileGame(),
          builder: builder,
        );
}

class Query$MobileGame$words {
  Query$MobileGame$words({
    required this.word,
    required this.pronounce,
    required this.explain,
    this.$__typename = 'Word',
  });

  factory Query$MobileGame$words.fromJson(Map<String, dynamic> json) {
    final l$word = json['word'];
    final l$pronounce = json['pronounce'];
    final l$explain = json['explain'];
    final l$$__typename = json['__typename'];
    return Query$MobileGame$words(
      word: (l$word as String),
      pronounce: (l$pronounce as String),
      explain: (l$explain as String),
      $__typename: (l$$__typename as String),
    );
  }

  final String word;

  final String pronounce;

  final String explain;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$word = word;
    _resultData['word'] = l$word;
    final l$pronounce = pronounce;
    _resultData['pronounce'] = l$pronounce;
    final l$explain = explain;
    _resultData['explain'] = l$explain;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$word = word;
    final l$pronounce = pronounce;
    final l$explain = explain;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$word,
      l$pronounce,
      l$explain,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$MobileGame$words) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$word = word;
    final lOther$word = other.word;
    if (l$word != lOther$word) {
      return false;
    }
    final l$pronounce = pronounce;
    final lOther$pronounce = other.pronounce;
    if (l$pronounce != lOther$pronounce) {
      return false;
    }
    final l$explain = explain;
    final lOther$explain = other.explain;
    if (l$explain != lOther$explain) {
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

extension UtilityExtension$Query$MobileGame$words on Query$MobileGame$words {
  CopyWith$Query$MobileGame$words<Query$MobileGame$words> get copyWith =>
      CopyWith$Query$MobileGame$words(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MobileGame$words<TRes> {
  factory CopyWith$Query$MobileGame$words(
    Query$MobileGame$words instance,
    TRes Function(Query$MobileGame$words) then,
  ) = _CopyWithImpl$Query$MobileGame$words;

  factory CopyWith$Query$MobileGame$words.stub(TRes res) =
      _CopyWithStubImpl$Query$MobileGame$words;

  TRes call({
    String? word,
    String? pronounce,
    String? explain,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MobileGame$words<TRes>
    implements CopyWith$Query$MobileGame$words<TRes> {
  _CopyWithImpl$Query$MobileGame$words(
    this._instance,
    this._then,
  );

  final Query$MobileGame$words _instance;

  final TRes Function(Query$MobileGame$words) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? word = _undefined,
    Object? pronounce = _undefined,
    Object? explain = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MobileGame$words(
        word: word == _undefined || word == null
            ? _instance.word
            : (word as String),
        pronounce: pronounce == _undefined || pronounce == null
            ? _instance.pronounce
            : (pronounce as String),
        explain: explain == _undefined || explain == null
            ? _instance.explain
            : (explain as String),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Query$MobileGame$words<TRes>
    implements CopyWith$Query$MobileGame$words<TRes> {
  _CopyWithStubImpl$Query$MobileGame$words(this._res);

  TRes _res;

  call({
    String? word,
    String? pronounce,
    String? explain,
    String? $__typename,
  }) =>
      _res;
}
