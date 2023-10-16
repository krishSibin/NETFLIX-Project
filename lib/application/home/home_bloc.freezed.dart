// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMovieData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMovieData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMovieData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMovieData value) getMovieData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMovieData value)? getMovieData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMovieData value)? getMovieData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetMovieDataCopyWith<$Res> {
  factory _$$GetMovieDataCopyWith(
          _$GetMovieData value, $Res Function(_$GetMovieData) then) =
      __$$GetMovieDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMovieDataCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetMovieData>
    implements _$$GetMovieDataCopyWith<$Res> {
  __$$GetMovieDataCopyWithImpl(
      _$GetMovieData _value, $Res Function(_$GetMovieData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMovieData implements GetMovieData {
  const _$GetMovieData();

  @override
  String toString() {
    return 'HomeEvent.getMovieData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMovieData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getMovieData,
  }) {
    return getMovieData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getMovieData,
  }) {
    return getMovieData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getMovieData,
    required TResult orElse(),
  }) {
    if (getMovieData != null) {
      return getMovieData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMovieData value) getMovieData,
  }) {
    return getMovieData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMovieData value)? getMovieData,
  }) {
    return getMovieData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMovieData value)? getMovieData,
    required TResult orElse(),
  }) {
    if (getMovieData != null) {
      return getMovieData(this);
    }
    return orElse();
  }
}

abstract class GetMovieData implements HomeEvent {
  const factory GetMovieData() = _$GetMovieData;
}

/// @nodoc
mixin _$HomeState {
  String get stateId => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  List<ComingSoonResult> get releasedInPastYrList =>
      throw _privateConstructorUsedError;
  List<ComingSoonResult> get trendingNow => throw _privateConstructorUsedError;
  List<ComingSoonResult> get tenseDrama => throw _privateConstructorUsedError;
  List<ComingSoonResult> get southIndianCinema =>
      throw _privateConstructorUsedError;
  List<EveryonesWatchingResult> get tvTop10List =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {String stateId,
      bool isLoading,
      bool isError,
      List<ComingSoonResult> releasedInPastYrList,
      List<ComingSoonResult> trendingNow,
      List<ComingSoonResult> tenseDrama,
      List<ComingSoonResult> southIndianCinema,
      List<EveryonesWatchingResult> tvTop10List});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? releasedInPastYrList = null,
    Object? trendingNow = null,
    Object? tenseDrama = null,
    Object? southIndianCinema = null,
    Object? tvTop10List = null,
  }) {
    return _then(_value.copyWith(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      releasedInPastYrList: null == releasedInPastYrList
          ? _value.releasedInPastYrList
          : releasedInPastYrList // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      trendingNow: null == trendingNow
          ? _value.trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tenseDrama: null == tenseDrama
          ? _value.tenseDrama
          : tenseDrama // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      southIndianCinema: null == southIndianCinema
          ? _value.southIndianCinema
          : southIndianCinema // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tvTop10List: null == tvTop10List
          ? _value.tvTop10List
          : tvTop10List // ignore: cast_nullable_to_non_nullable
              as List<EveryonesWatchingResult>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String stateId,
      bool isLoading,
      bool isError,
      List<ComingSoonResult> releasedInPastYrList,
      List<ComingSoonResult> trendingNow,
      List<ComingSoonResult> tenseDrama,
      List<ComingSoonResult> southIndianCinema,
      List<EveryonesWatchingResult> tvTop10List});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stateId = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? releasedInPastYrList = null,
    Object? trendingNow = null,
    Object? tenseDrama = null,
    Object? southIndianCinema = null,
    Object? tvTop10List = null,
  }) {
    return _then(_$_HomeState(
      stateId: null == stateId
          ? _value.stateId
          : stateId // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      releasedInPastYrList: null == releasedInPastYrList
          ? _value._releasedInPastYrList
          : releasedInPastYrList // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      trendingNow: null == trendingNow
          ? _value._trendingNow
          : trendingNow // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tenseDrama: null == tenseDrama
          ? _value._tenseDrama
          : tenseDrama // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      southIndianCinema: null == southIndianCinema
          ? _value._southIndianCinema
          : southIndianCinema // ignore: cast_nullable_to_non_nullable
              as List<ComingSoonResult>,
      tvTop10List: null == tvTop10List
          ? _value._tvTop10List
          : tvTop10List // ignore: cast_nullable_to_non_nullable
              as List<EveryonesWatchingResult>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required this.stateId,
      required this.isLoading,
      required this.isError,
      required final List<ComingSoonResult> releasedInPastYrList,
      required final List<ComingSoonResult> trendingNow,
      required final List<ComingSoonResult> tenseDrama,
      required final List<ComingSoonResult> southIndianCinema,
      required final List<EveryonesWatchingResult> tvTop10List})
      : _releasedInPastYrList = releasedInPastYrList,
        _trendingNow = trendingNow,
        _tenseDrama = tenseDrama,
        _southIndianCinema = southIndianCinema,
        _tvTop10List = tvTop10List;

  @override
  final String stateId;
  @override
  final bool isLoading;
  @override
  final bool isError;
  final List<ComingSoonResult> _releasedInPastYrList;
  @override
  List<ComingSoonResult> get releasedInPastYrList {
    if (_releasedInPastYrList is EqualUnmodifiableListView)
      return _releasedInPastYrList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_releasedInPastYrList);
  }

  final List<ComingSoonResult> _trendingNow;
  @override
  List<ComingSoonResult> get trendingNow {
    if (_trendingNow is EqualUnmodifiableListView) return _trendingNow;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_trendingNow);
  }

  final List<ComingSoonResult> _tenseDrama;
  @override
  List<ComingSoonResult> get tenseDrama {
    if (_tenseDrama is EqualUnmodifiableListView) return _tenseDrama;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tenseDrama);
  }

  final List<ComingSoonResult> _southIndianCinema;
  @override
  List<ComingSoonResult> get southIndianCinema {
    if (_southIndianCinema is EqualUnmodifiableListView)
      return _southIndianCinema;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_southIndianCinema);
  }

  final List<EveryonesWatchingResult> _tvTop10List;
  @override
  List<EveryonesWatchingResult> get tvTop10List {
    if (_tvTop10List is EqualUnmodifiableListView) return _tvTop10List;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tvTop10List);
  }

  @override
  String toString() {
    return 'HomeState(stateId: $stateId, isLoading: $isLoading, isError: $isError, releasedInPastYrList: $releasedInPastYrList, trendingNow: $trendingNow, tenseDrama: $tenseDrama, southIndianCinema: $southIndianCinema, tvTop10List: $tvTop10List)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.stateId, stateId) || other.stateId == stateId) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            const DeepCollectionEquality()
                .equals(other._releasedInPastYrList, _releasedInPastYrList) &&
            const DeepCollectionEquality()
                .equals(other._trendingNow, _trendingNow) &&
            const DeepCollectionEquality()
                .equals(other._tenseDrama, _tenseDrama) &&
            const DeepCollectionEquality()
                .equals(other._southIndianCinema, _southIndianCinema) &&
            const DeepCollectionEquality()
                .equals(other._tvTop10List, _tvTop10List));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      stateId,
      isLoading,
      isError,
      const DeepCollectionEquality().hash(_releasedInPastYrList),
      const DeepCollectionEquality().hash(_trendingNow),
      const DeepCollectionEquality().hash(_tenseDrama),
      const DeepCollectionEquality().hash(_southIndianCinema),
      const DeepCollectionEquality().hash(_tvTop10List));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final String stateId,
      required final bool isLoading,
      required final bool isError,
      required final List<ComingSoonResult> releasedInPastYrList,
      required final List<ComingSoonResult> trendingNow,
      required final List<ComingSoonResult> tenseDrama,
      required final List<ComingSoonResult> southIndianCinema,
      required final List<EveryonesWatchingResult> tvTop10List}) = _$_HomeState;

  @override
  String get stateId;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  List<ComingSoonResult> get releasedInPastYrList;
  @override
  List<ComingSoonResult> get trendingNow;
  @override
  List<ComingSoonResult> get tenseDrama;
  @override
  List<ComingSoonResult> get southIndianCinema;
  @override
  List<EveryonesWatchingResult> get tvTop10List;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
