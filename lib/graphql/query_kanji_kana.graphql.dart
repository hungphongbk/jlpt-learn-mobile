import 'package:gql/ast.dart';

class Query$MobileQueryForGame {
  Query$MobileQueryForGame({
    this.words,
    this.$__typename = 'Query',
  });

  factory Query$MobileQueryForGame.fromJson(Map<String, dynamic> json) {
    final l$words = json['words'];
    final l$$__typename = json['__typename'];
    return Query$MobileQueryForGame(
      words: (l$words as List<dynamic>?)
          ?.map((e) => Query$MobileQueryForGame$words.fromJson(
              (e as Map<String, dynamic>)))
          .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Query$MobileQueryForGame$words>? words;

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
    if (!(other is Query$MobileQueryForGame) ||
        runtimeType != other.runtimeType) {
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

extension UtilityExtension$Query$MobileQueryForGame
    on Query$MobileQueryForGame {
  CopyWith$Query$MobileQueryForGame<Query$MobileQueryForGame> get copyWith =>
      CopyWith$Query$MobileQueryForGame(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Query$MobileQueryForGame<TRes> {
  factory CopyWith$Query$MobileQueryForGame(
    Query$MobileQueryForGame instance,
    TRes Function(Query$MobileQueryForGame) then,
  ) = _CopyWithImpl$Query$MobileQueryForGame;

  factory CopyWith$Query$MobileQueryForGame.stub(TRes res) =
      _CopyWithStubImpl$Query$MobileQueryForGame;

  TRes call({
    List<Query$MobileQueryForGame$words>? words,
    String? $__typename,
  });
  TRes words(
      Iterable<Query$MobileQueryForGame$words>? Function(
              Iterable<
                  CopyWith$Query$MobileQueryForGame$words<
                      Query$MobileQueryForGame$words>>?)
          _fn);
}

class _CopyWithImpl$Query$MobileQueryForGame<TRes>
    implements CopyWith$Query$MobileQueryForGame<TRes> {
  _CopyWithImpl$Query$MobileQueryForGame(
    this._instance,
    this._then,
  );

  final Query$MobileQueryForGame _instance;

  final TRes Function(Query$MobileQueryForGame) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? words = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MobileQueryForGame(
        words: words == _undefined
            ? _instance.words
            : (words as List<Query$MobileQueryForGame$words>?),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes words(
          Iterable<Query$MobileQueryForGame$words>? Function(
                  Iterable<
                      CopyWith$Query$MobileQueryForGame$words<
                          Query$MobileQueryForGame$words>>?)
              _fn) =>
      call(
          words: _fn(_instance.words
              ?.map((e) => CopyWith$Query$MobileQueryForGame$words(
                    e,
                    (i) => i,
                  )))?.toList());
}

class _CopyWithStubImpl$Query$MobileQueryForGame<TRes>
    implements CopyWith$Query$MobileQueryForGame<TRes> {
  _CopyWithStubImpl$Query$MobileQueryForGame(this._res);

  TRes _res;

  call({
    List<Query$MobileQueryForGame$words>? words,
    String? $__typename,
  }) =>
      _res;
  words(_fn) => _res;
}

const documentNodeQueryMobileQueryForGame = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'MobileQueryForGame'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'words'),
        alias: null,
        arguments: [],
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

class Query$MobileQueryForGame$words {
  Query$MobileQueryForGame$words({
    required this.word,
    required this.pronounce,
    required this.explain,
    this.$__typename = 'Word',
  });

  factory Query$MobileQueryForGame$words.fromJson(Map<String, dynamic> json) {
    final l$word = json['word'];
    final l$pronounce = json['pronounce'];
    final l$explain = json['explain'];
    final l$$__typename = json['__typename'];
    return Query$MobileQueryForGame$words(
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
    if (!(other is Query$MobileQueryForGame$words) ||
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

extension UtilityExtension$Query$MobileQueryForGame$words
    on Query$MobileQueryForGame$words {
  CopyWith$Query$MobileQueryForGame$words<Query$MobileQueryForGame$words>
      get copyWith => CopyWith$Query$MobileQueryForGame$words(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$MobileQueryForGame$words<TRes> {
  factory CopyWith$Query$MobileQueryForGame$words(
    Query$MobileQueryForGame$words instance,
    TRes Function(Query$MobileQueryForGame$words) then,
  ) = _CopyWithImpl$Query$MobileQueryForGame$words;

  factory CopyWith$Query$MobileQueryForGame$words.stub(TRes res) =
      _CopyWithStubImpl$Query$MobileQueryForGame$words;

  TRes call({
    String? word,
    String? pronounce,
    String? explain,
    String? $__typename,
  });
}

class _CopyWithImpl$Query$MobileQueryForGame$words<TRes>
    implements CopyWith$Query$MobileQueryForGame$words<TRes> {
  _CopyWithImpl$Query$MobileQueryForGame$words(
    this._instance,
    this._then,
  );

  final Query$MobileQueryForGame$words _instance;

  final TRes Function(Query$MobileQueryForGame$words) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? word = _undefined,
    Object? pronounce = _undefined,
    Object? explain = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$MobileQueryForGame$words(
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

class _CopyWithStubImpl$Query$MobileQueryForGame$words<TRes>
    implements CopyWith$Query$MobileQueryForGame$words<TRes> {
  _CopyWithStubImpl$Query$MobileQueryForGame$words(this._res);

  TRes _res;

  call({
    String? word,
    String? pronounce,
    String? explain,
    String? $__typename,
  }) =>
      _res;
}
