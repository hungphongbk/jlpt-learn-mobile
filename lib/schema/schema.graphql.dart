// ignore_for_file: type=lint
class Input$ArrayStringComparator {
  factory Input$ArrayStringComparator({
    List<String>? arrayContains,
    List<String>? arrayContainsAny,
  }) =>
      Input$ArrayStringComparator._({
        if (arrayContains != null) r'arrayContains': arrayContains,
        if (arrayContainsAny != null) r'arrayContainsAny': arrayContainsAny,
      });

  Input$ArrayStringComparator._(this._$data);

  factory Input$ArrayStringComparator.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('arrayContains')) {
      final l$arrayContains = data['arrayContains'];
      result$data['arrayContains'] = (l$arrayContains as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    if (data.containsKey('arrayContainsAny')) {
      final l$arrayContainsAny = data['arrayContainsAny'];
      result$data['arrayContainsAny'] = (l$arrayContainsAny as List<dynamic>?)
          ?.map((e) => (e as String))
          .toList();
    }
    return Input$ArrayStringComparator._(result$data);
  }

  Map<String, dynamic> _$data;

  List<String>? get arrayContains => (_$data['arrayContains'] as List<String>?);
  List<String>? get arrayContainsAny =>
      (_$data['arrayContainsAny'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('arrayContains')) {
      final l$arrayContains = arrayContains;
      result$data['arrayContains'] = l$arrayContains?.map((e) => e).toList();
    }
    if (_$data.containsKey('arrayContainsAny')) {
      final l$arrayContainsAny = arrayContainsAny;
      result$data['arrayContainsAny'] =
          l$arrayContainsAny?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$ArrayStringComparator<Input$ArrayStringComparator>
      get copyWith => CopyWith$Input$ArrayStringComparator(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$ArrayStringComparator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$arrayContains = arrayContains;
    final lOther$arrayContains = other.arrayContains;
    if (_$data.containsKey('arrayContains') !=
        other._$data.containsKey('arrayContains')) {
      return false;
    }
    if (l$arrayContains != null && lOther$arrayContains != null) {
      if (l$arrayContains.length != lOther$arrayContains.length) {
        return false;
      }
      for (int i = 0; i < l$arrayContains.length; i++) {
        final l$arrayContains$entry = l$arrayContains[i];
        final lOther$arrayContains$entry = lOther$arrayContains[i];
        if (l$arrayContains$entry != lOther$arrayContains$entry) {
          return false;
        }
      }
    } else if (l$arrayContains != lOther$arrayContains) {
      return false;
    }
    final l$arrayContainsAny = arrayContainsAny;
    final lOther$arrayContainsAny = other.arrayContainsAny;
    if (_$data.containsKey('arrayContainsAny') !=
        other._$data.containsKey('arrayContainsAny')) {
      return false;
    }
    if (l$arrayContainsAny != null && lOther$arrayContainsAny != null) {
      if (l$arrayContainsAny.length != lOther$arrayContainsAny.length) {
        return false;
      }
      for (int i = 0; i < l$arrayContainsAny.length; i++) {
        final l$arrayContainsAny$entry = l$arrayContainsAny[i];
        final lOther$arrayContainsAny$entry = lOther$arrayContainsAny[i];
        if (l$arrayContainsAny$entry != lOther$arrayContainsAny$entry) {
          return false;
        }
      }
    } else if (l$arrayContainsAny != lOther$arrayContainsAny) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$arrayContains = arrayContains;
    final l$arrayContainsAny = arrayContainsAny;
    return Object.hashAll([
      _$data.containsKey('arrayContains')
          ? l$arrayContains == null
              ? null
              : Object.hashAll(l$arrayContains.map((v) => v))
          : const {},
      _$data.containsKey('arrayContainsAny')
          ? l$arrayContainsAny == null
              ? null
              : Object.hashAll(l$arrayContainsAny.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$ArrayStringComparator<TRes> {
  factory CopyWith$Input$ArrayStringComparator(
    Input$ArrayStringComparator instance,
    TRes Function(Input$ArrayStringComparator) then,
  ) = _CopyWithImpl$Input$ArrayStringComparator;

  factory CopyWith$Input$ArrayStringComparator.stub(TRes res) =
      _CopyWithStubImpl$Input$ArrayStringComparator;

  TRes call({
    List<String>? arrayContains,
    List<String>? arrayContainsAny,
  });
}

class _CopyWithImpl$Input$ArrayStringComparator<TRes>
    implements CopyWith$Input$ArrayStringComparator<TRes> {
  _CopyWithImpl$Input$ArrayStringComparator(
    this._instance,
    this._then,
  );

  final Input$ArrayStringComparator _instance;

  final TRes Function(Input$ArrayStringComparator) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? arrayContains = _undefined,
    Object? arrayContainsAny = _undefined,
  }) =>
      _then(Input$ArrayStringComparator._({
        ..._instance._$data,
        if (arrayContains != _undefined)
          'arrayContains': (arrayContains as List<String>?),
        if (arrayContainsAny != _undefined)
          'arrayContainsAny': (arrayContainsAny as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$ArrayStringComparator<TRes>
    implements CopyWith$Input$ArrayStringComparator<TRes> {
  _CopyWithStubImpl$Input$ArrayStringComparator(this._res);

  TRes _res;

  call({
    List<String>? arrayContains,
    List<String>? arrayContainsAny,
  }) =>
      _res;
}

class Input$KanjiUpsertInput {
  factory Input$KanjiUpsertInput({required String hv}) =>
      Input$KanjiUpsertInput._({
        r'hv': hv,
      });

  Input$KanjiUpsertInput._(this._$data);

  factory Input$KanjiUpsertInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$hv = data['hv'];
    result$data['hv'] = (l$hv as String);
    return Input$KanjiUpsertInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get hv => (_$data['hv'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$hv = hv;
    result$data['hv'] = l$hv;
    return result$data;
  }

  CopyWith$Input$KanjiUpsertInput<Input$KanjiUpsertInput> get copyWith =>
      CopyWith$Input$KanjiUpsertInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$KanjiUpsertInput) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$hv = hv;
    final lOther$hv = other.hv;
    if (l$hv != lOther$hv) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$hv = hv;
    return Object.hashAll([l$hv]);
  }
}

abstract class CopyWith$Input$KanjiUpsertInput<TRes> {
  factory CopyWith$Input$KanjiUpsertInput(
    Input$KanjiUpsertInput instance,
    TRes Function(Input$KanjiUpsertInput) then,
  ) = _CopyWithImpl$Input$KanjiUpsertInput;

  factory CopyWith$Input$KanjiUpsertInput.stub(TRes res) =
      _CopyWithStubImpl$Input$KanjiUpsertInput;

  TRes call({String? hv});
}

class _CopyWithImpl$Input$KanjiUpsertInput<TRes>
    implements CopyWith$Input$KanjiUpsertInput<TRes> {
  _CopyWithImpl$Input$KanjiUpsertInput(
    this._instance,
    this._then,
  );

  final Input$KanjiUpsertInput _instance;

  final TRes Function(Input$KanjiUpsertInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({Object? hv = _undefined}) => _then(Input$KanjiUpsertInput._({
        ..._instance._$data,
        if (hv != _undefined && hv != null) 'hv': (hv as String),
      }));
}

class _CopyWithStubImpl$Input$KanjiUpsertInput<TRes>
    implements CopyWith$Input$KanjiUpsertInput<TRes> {
  _CopyWithStubImpl$Input$KanjiUpsertInput(this._res);

  TRes _res;

  call({String? hv}) => _res;
}

class Input$StringComparator {
  factory Input$StringComparator({
    String? eq,
    List<String>? $in,
    String? neq,
    List<String>? notIn,
  }) =>
      Input$StringComparator._({
        if (eq != null) r'eq': eq,
        if ($in != null) r'in': $in,
        if (neq != null) r'neq': neq,
        if (notIn != null) r'notIn': notIn,
      });

  Input$StringComparator._(this._$data);

  factory Input$StringComparator.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('eq')) {
      final l$eq = data['eq'];
      result$data['eq'] = (l$eq as String?);
    }
    if (data.containsKey('in')) {
      final l$$in = data['in'];
      result$data['in'] =
          (l$$in as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    if (data.containsKey('neq')) {
      final l$neq = data['neq'];
      result$data['neq'] = (l$neq as String?);
    }
    if (data.containsKey('notIn')) {
      final l$notIn = data['notIn'];
      result$data['notIn'] =
          (l$notIn as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    return Input$StringComparator._(result$data);
  }

  Map<String, dynamic> _$data;

  String? get eq => (_$data['eq'] as String?);
  List<String>? get $in => (_$data['in'] as List<String>?);
  String? get neq => (_$data['neq'] as String?);
  List<String>? get notIn => (_$data['notIn'] as List<String>?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('eq')) {
      final l$eq = eq;
      result$data['eq'] = l$eq;
    }
    if (_$data.containsKey('in')) {
      final l$$in = $in;
      result$data['in'] = l$$in?.map((e) => e).toList();
    }
    if (_$data.containsKey('neq')) {
      final l$neq = neq;
      result$data['neq'] = l$neq;
    }
    if (_$data.containsKey('notIn')) {
      final l$notIn = notIn;
      result$data['notIn'] = l$notIn?.map((e) => e).toList();
    }
    return result$data;
  }

  CopyWith$Input$StringComparator<Input$StringComparator> get copyWith =>
      CopyWith$Input$StringComparator(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$StringComparator) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$eq = eq;
    final lOther$eq = other.eq;
    if (_$data.containsKey('eq') != other._$data.containsKey('eq')) {
      return false;
    }
    if (l$eq != lOther$eq) {
      return false;
    }
    final l$$in = $in;
    final lOther$$in = other.$in;
    if (_$data.containsKey('in') != other._$data.containsKey('in')) {
      return false;
    }
    if (l$$in != null && lOther$$in != null) {
      if (l$$in.length != lOther$$in.length) {
        return false;
      }
      for (int i = 0; i < l$$in.length; i++) {
        final l$$in$entry = l$$in[i];
        final lOther$$in$entry = lOther$$in[i];
        if (l$$in$entry != lOther$$in$entry) {
          return false;
        }
      }
    } else if (l$$in != lOther$$in) {
      return false;
    }
    final l$neq = neq;
    final lOther$neq = other.neq;
    if (_$data.containsKey('neq') != other._$data.containsKey('neq')) {
      return false;
    }
    if (l$neq != lOther$neq) {
      return false;
    }
    final l$notIn = notIn;
    final lOther$notIn = other.notIn;
    if (_$data.containsKey('notIn') != other._$data.containsKey('notIn')) {
      return false;
    }
    if (l$notIn != null && lOther$notIn != null) {
      if (l$notIn.length != lOther$notIn.length) {
        return false;
      }
      for (int i = 0; i < l$notIn.length; i++) {
        final l$notIn$entry = l$notIn[i];
        final lOther$notIn$entry = lOther$notIn[i];
        if (l$notIn$entry != lOther$notIn$entry) {
          return false;
        }
      }
    } else if (l$notIn != lOther$notIn) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$eq = eq;
    final l$$in = $in;
    final l$neq = neq;
    final l$notIn = notIn;
    return Object.hashAll([
      _$data.containsKey('eq') ? l$eq : const {},
      _$data.containsKey('in')
          ? l$$in == null
              ? null
              : Object.hashAll(l$$in.map((v) => v))
          : const {},
      _$data.containsKey('neq') ? l$neq : const {},
      _$data.containsKey('notIn')
          ? l$notIn == null
              ? null
              : Object.hashAll(l$notIn.map((v) => v))
          : const {},
    ]);
  }
}

abstract class CopyWith$Input$StringComparator<TRes> {
  factory CopyWith$Input$StringComparator(
    Input$StringComparator instance,
    TRes Function(Input$StringComparator) then,
  ) = _CopyWithImpl$Input$StringComparator;

  factory CopyWith$Input$StringComparator.stub(TRes res) =
      _CopyWithStubImpl$Input$StringComparator;

  TRes call({
    String? eq,
    List<String>? $in,
    String? neq,
    List<String>? notIn,
  });
}

class _CopyWithImpl$Input$StringComparator<TRes>
    implements CopyWith$Input$StringComparator<TRes> {
  _CopyWithImpl$Input$StringComparator(
    this._instance,
    this._then,
  );

  final Input$StringComparator _instance;

  final TRes Function(Input$StringComparator) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? eq = _undefined,
    Object? $in = _undefined,
    Object? neq = _undefined,
    Object? notIn = _undefined,
  }) =>
      _then(Input$StringComparator._({
        ..._instance._$data,
        if (eq != _undefined) 'eq': (eq as String?),
        if ($in != _undefined) 'in': ($in as List<String>?),
        if (neq != _undefined) 'neq': (neq as String?),
        if (notIn != _undefined) 'notIn': (notIn as List<String>?),
      }));
}

class _CopyWithStubImpl$Input$StringComparator<TRes>
    implements CopyWith$Input$StringComparator<TRes> {
  _CopyWithStubImpl$Input$StringComparator(this._res);

  TRes _res;

  call({
    String? eq,
    List<String>? $in,
    String? neq,
    List<String>? notIn,
  }) =>
      _res;
}

class Input$WordInsertInput {
  factory Input$WordInsertInput({
    required String explain,
    required String pronounce,
    List<String>? tags,
    required String word,
  }) =>
      Input$WordInsertInput._({
        r'explain': explain,
        r'pronounce': pronounce,
        if (tags != null) r'tags': tags,
        r'word': word,
      });

  Input$WordInsertInput._(this._$data);

  factory Input$WordInsertInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$explain = data['explain'];
    result$data['explain'] = (l$explain as String);
    final l$pronounce = data['pronounce'];
    result$data['pronounce'] = (l$pronounce as String);
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] =
          (l$tags as List<dynamic>?)?.map((e) => (e as String)).toList();
    }
    final l$word = data['word'];
    result$data['word'] = (l$word as String);
    return Input$WordInsertInput._(result$data);
  }

  Map<String, dynamic> _$data;

  String get explain => (_$data['explain'] as String);
  String get pronounce => (_$data['pronounce'] as String);
  List<String>? get tags => (_$data['tags'] as List<String>?);
  String get word => (_$data['word'] as String);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$explain = explain;
    result$data['explain'] = l$explain;
    final l$pronounce = pronounce;
    result$data['pronounce'] = l$pronounce;
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.map((e) => e).toList();
    }
    final l$word = word;
    result$data['word'] = l$word;
    return result$data;
  }

  CopyWith$Input$WordInsertInput<Input$WordInsertInput> get copyWith =>
      CopyWith$Input$WordInsertInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$WordInsertInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$explain = explain;
    final lOther$explain = other.explain;
    if (l$explain != lOther$explain) {
      return false;
    }
    final l$pronounce = pronounce;
    final lOther$pronounce = other.pronounce;
    if (l$pronounce != lOther$pronounce) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
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
    final l$word = word;
    final lOther$word = other.word;
    if (l$word != lOther$word) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$explain = explain;
    final l$pronounce = pronounce;
    final l$tags = tags;
    final l$word = word;
    return Object.hashAll([
      l$explain,
      l$pronounce,
      _$data.containsKey('tags')
          ? l$tags == null
              ? null
              : Object.hashAll(l$tags.map((v) => v))
          : const {},
      l$word,
    ]);
  }
}

abstract class CopyWith$Input$WordInsertInput<TRes> {
  factory CopyWith$Input$WordInsertInput(
    Input$WordInsertInput instance,
    TRes Function(Input$WordInsertInput) then,
  ) = _CopyWithImpl$Input$WordInsertInput;

  factory CopyWith$Input$WordInsertInput.stub(TRes res) =
      _CopyWithStubImpl$Input$WordInsertInput;

  TRes call({
    String? explain,
    String? pronounce,
    List<String>? tags,
    String? word,
  });
}

class _CopyWithImpl$Input$WordInsertInput<TRes>
    implements CopyWith$Input$WordInsertInput<TRes> {
  _CopyWithImpl$Input$WordInsertInput(
    this._instance,
    this._then,
  );

  final Input$WordInsertInput _instance;

  final TRes Function(Input$WordInsertInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? explain = _undefined,
    Object? pronounce = _undefined,
    Object? tags = _undefined,
    Object? word = _undefined,
  }) =>
      _then(Input$WordInsertInput._({
        ..._instance._$data,
        if (explain != _undefined && explain != null)
          'explain': (explain as String),
        if (pronounce != _undefined && pronounce != null)
          'pronounce': (pronounce as String),
        if (tags != _undefined) 'tags': (tags as List<String>?),
        if (word != _undefined && word != null) 'word': (word as String),
      }));
}

class _CopyWithStubImpl$Input$WordInsertInput<TRes>
    implements CopyWith$Input$WordInsertInput<TRes> {
  _CopyWithStubImpl$Input$WordInsertInput(this._res);

  TRes _res;

  call({
    String? explain,
    String? pronounce,
    List<String>? tags,
    String? word,
  }) =>
      _res;
}

class Input$WordQueryInput {
  factory Input$WordQueryInput({
    Input$ArrayStringComparator? tags,
    Input$StringComparator? word,
  }) =>
      Input$WordQueryInput._({
        if (tags != null) r'tags': tags,
        if (word != null) r'word': word,
      });

  Input$WordQueryInput._(this._$data);

  factory Input$WordQueryInput.fromJson(Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    if (data.containsKey('tags')) {
      final l$tags = data['tags'];
      result$data['tags'] = l$tags == null
          ? null
          : Input$ArrayStringComparator.fromJson(
              (l$tags as Map<String, dynamic>));
    }
    if (data.containsKey('word')) {
      final l$word = data['word'];
      result$data['word'] = l$word == null
          ? null
          : Input$StringComparator.fromJson((l$word as Map<String, dynamic>));
    }
    return Input$WordQueryInput._(result$data);
  }

  Map<String, dynamic> _$data;

  Input$ArrayStringComparator? get tags =>
      (_$data['tags'] as Input$ArrayStringComparator?);
  Input$StringComparator? get word =>
      (_$data['word'] as Input$StringComparator?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    if (_$data.containsKey('tags')) {
      final l$tags = tags;
      result$data['tags'] = l$tags?.toJson();
    }
    if (_$data.containsKey('word')) {
      final l$word = word;
      result$data['word'] = l$word?.toJson();
    }
    return result$data;
  }

  CopyWith$Input$WordQueryInput<Input$WordQueryInput> get copyWith =>
      CopyWith$Input$WordQueryInput(
        this,
        (i) => i,
      );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Input$WordQueryInput) || runtimeType != other.runtimeType) {
      return false;
    }
    final l$tags = tags;
    final lOther$tags = other.tags;
    if (_$data.containsKey('tags') != other._$data.containsKey('tags')) {
      return false;
    }
    if (l$tags != lOther$tags) {
      return false;
    }
    final l$word = word;
    final lOther$word = other.word;
    if (_$data.containsKey('word') != other._$data.containsKey('word')) {
      return false;
    }
    if (l$word != lOther$word) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$tags = tags;
    final l$word = word;
    return Object.hashAll([
      _$data.containsKey('tags') ? l$tags : const {},
      _$data.containsKey('word') ? l$word : const {},
    ]);
  }
}

abstract class CopyWith$Input$WordQueryInput<TRes> {
  factory CopyWith$Input$WordQueryInput(
    Input$WordQueryInput instance,
    TRes Function(Input$WordQueryInput) then,
  ) = _CopyWithImpl$Input$WordQueryInput;

  factory CopyWith$Input$WordQueryInput.stub(TRes res) =
      _CopyWithStubImpl$Input$WordQueryInput;

  TRes call({
    Input$ArrayStringComparator? tags,
    Input$StringComparator? word,
  });
  CopyWith$Input$ArrayStringComparator<TRes> get tags;
  CopyWith$Input$StringComparator<TRes> get word;
}

class _CopyWithImpl$Input$WordQueryInput<TRes>
    implements CopyWith$Input$WordQueryInput<TRes> {
  _CopyWithImpl$Input$WordQueryInput(
    this._instance,
    this._then,
  );

  final Input$WordQueryInput _instance;

  final TRes Function(Input$WordQueryInput) _then;

  static const _undefined = <dynamic, dynamic>{};

  TRes call({
    Object? tags = _undefined,
    Object? word = _undefined,
  }) =>
      _then(Input$WordQueryInput._({
        ..._instance._$data,
        if (tags != _undefined) 'tags': (tags as Input$ArrayStringComparator?),
        if (word != _undefined) 'word': (word as Input$StringComparator?),
      }));
  CopyWith$Input$ArrayStringComparator<TRes> get tags {
    final local$tags = _instance.tags;
    return local$tags == null
        ? CopyWith$Input$ArrayStringComparator.stub(_then(_instance))
        : CopyWith$Input$ArrayStringComparator(
            local$tags, (e) => call(tags: e));
  }

  CopyWith$Input$StringComparator<TRes> get word {
    final local$word = _instance.word;
    return local$word == null
        ? CopyWith$Input$StringComparator.stub(_then(_instance))
        : CopyWith$Input$StringComparator(local$word, (e) => call(word: e));
  }
}

class _CopyWithStubImpl$Input$WordQueryInput<TRes>
    implements CopyWith$Input$WordQueryInput<TRes> {
  _CopyWithStubImpl$Input$WordQueryInput(this._res);

  TRes _res;

  call({
    Input$ArrayStringComparator? tags,
    Input$StringComparator? word,
  }) =>
      _res;
  CopyWith$Input$ArrayStringComparator<TRes> get tags =>
      CopyWith$Input$ArrayStringComparator.stub(_res);
  CopyWith$Input$StringComparator<TRes> get word =>
      CopyWith$Input$StringComparator.stub(_res);
}

const possibleTypesMap = <String, Set<String>>{};
