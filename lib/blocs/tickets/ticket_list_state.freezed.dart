// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TicketResultResponse>? ticketList) success,
    required TResult Function(List<TicketListModel>? ticketList, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketListInitial value) initial,
    required TResult Function(TicketListSuccess value) success,
    required TResult Function(TicketListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketListStateCopyWith<$Res> {
  factory $TicketListStateCopyWith(
          TicketListState value, $Res Function(TicketListState) then) =
      _$TicketListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TicketListStateCopyWithImpl<$Res>
    implements $TicketListStateCopyWith<$Res> {
  _$TicketListStateCopyWithImpl(this._value, this._then);

  final TicketListState _value;
  // ignore: unused_field
  final $Res Function(TicketListState) _then;
}

/// @nodoc
abstract class _$$TicketListInitialCopyWith<$Res> {
  factory _$$TicketListInitialCopyWith(
          _$TicketListInitial value, $Res Function(_$TicketListInitial) then) =
      __$$TicketListInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketListInitialCopyWithImpl<$Res>
    extends _$TicketListStateCopyWithImpl<$Res>
    implements _$$TicketListInitialCopyWith<$Res> {
  __$$TicketListInitialCopyWithImpl(
      _$TicketListInitial _value, $Res Function(_$TicketListInitial) _then)
      : super(_value, (v) => _then(v as _$TicketListInitial));

  @override
  _$TicketListInitial get _value => super._value as _$TicketListInitial;
}

/// @nodoc

class _$TicketListInitial implements TicketListInitial {
  const _$TicketListInitial();

  @override
  String toString() {
    return 'TicketListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketListInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TicketResultResponse>? ticketList) success,
    required TResult Function(List<TicketListModel>? ticketList, String message)
        error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketListInitial value) initial,
    required TResult Function(TicketListSuccess value) success,
    required TResult Function(TicketListError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TicketListInitial implements TicketListState {
  const factory TicketListInitial() = _$TicketListInitial;
}

/// @nodoc
abstract class _$$TicketListSuccessCopyWith<$Res> {
  factory _$$TicketListSuccessCopyWith(
          _$TicketListSuccess value, $Res Function(_$TicketListSuccess) then) =
      __$$TicketListSuccessCopyWithImpl<$Res>;
  $Res call({List<TicketResultResponse>? ticketList});
}

/// @nodoc
class __$$TicketListSuccessCopyWithImpl<$Res>
    extends _$TicketListStateCopyWithImpl<$Res>
    implements _$$TicketListSuccessCopyWith<$Res> {
  __$$TicketListSuccessCopyWithImpl(
      _$TicketListSuccess _value, $Res Function(_$TicketListSuccess) _then)
      : super(_value, (v) => _then(v as _$TicketListSuccess));

  @override
  _$TicketListSuccess get _value => super._value as _$TicketListSuccess;

  @override
  $Res call({
    Object? ticketList = freezed,
  }) {
    return _then(_$TicketListSuccess(
      ticketList: ticketList == freezed
          ? _value._ticketList
          : ticketList // ignore: cast_nullable_to_non_nullable
              as List<TicketResultResponse>?,
    ));
  }
}

/// @nodoc

class _$TicketListSuccess implements TicketListSuccess {
  const _$TicketListSuccess({final List<TicketResultResponse>? ticketList})
      : _ticketList = ticketList;

  final List<TicketResultResponse>? _ticketList;
  @override
  List<TicketResultResponse>? get ticketList {
    final value = _ticketList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TicketListState.success(ticketList: $ticketList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketListSuccess &&
            const DeepCollectionEquality()
                .equals(other._ticketList, _ticketList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ticketList));

  @JsonKey(ignore: true)
  @override
  _$$TicketListSuccessCopyWith<_$TicketListSuccess> get copyWith =>
      __$$TicketListSuccessCopyWithImpl<_$TicketListSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TicketResultResponse>? ticketList) success,
    required TResult Function(List<TicketListModel>? ticketList, String message)
        error,
  }) {
    return success(ticketList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
  }) {
    return success?.call(ticketList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(ticketList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketListInitial value) initial,
    required TResult Function(TicketListSuccess value) success,
    required TResult Function(TicketListError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TicketListSuccess implements TicketListState {
  const factory TicketListSuccess(
      {final List<TicketResultResponse>? ticketList}) = _$TicketListSuccess;

  List<TicketResultResponse>? get ticketList;
  @JsonKey(ignore: true)
  _$$TicketListSuccessCopyWith<_$TicketListSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TicketListErrorCopyWith<$Res> {
  factory _$$TicketListErrorCopyWith(
          _$TicketListError value, $Res Function(_$TicketListError) then) =
      __$$TicketListErrorCopyWithImpl<$Res>;
  $Res call({List<TicketListModel>? ticketList, String message});
}

/// @nodoc
class __$$TicketListErrorCopyWithImpl<$Res>
    extends _$TicketListStateCopyWithImpl<$Res>
    implements _$$TicketListErrorCopyWith<$Res> {
  __$$TicketListErrorCopyWithImpl(
      _$TicketListError _value, $Res Function(_$TicketListError) _then)
      : super(_value, (v) => _then(v as _$TicketListError));

  @override
  _$TicketListError get _value => super._value as _$TicketListError;

  @override
  $Res call({
    Object? ticketList = freezed,
    Object? message = freezed,
  }) {
    return _then(_$TicketListError(
      ticketList: ticketList == freezed
          ? _value._ticketList
          : ticketList // ignore: cast_nullable_to_non_nullable
              as List<TicketListModel>?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TicketListError implements TicketListError {
  const _$TicketListError(
      {final List<TicketListModel>? ticketList, required this.message})
      : _ticketList = ticketList;

  final List<TicketListModel>? _ticketList;
  @override
  List<TicketListModel>? get ticketList {
    final value = _ticketList;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String message;

  @override
  String toString() {
    return 'TicketListState.error(ticketList: $ticketList, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketListError &&
            const DeepCollectionEquality()
                .equals(other._ticketList, _ticketList) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ticketList),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$TicketListErrorCopyWith<_$TicketListError> get copyWith =>
      __$$TicketListErrorCopyWithImpl<_$TicketListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<TicketResultResponse>? ticketList) success,
    required TResult Function(List<TicketListModel>? ticketList, String message)
        error,
  }) {
    return error(ticketList, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
  }) {
    return error?.call(ticketList, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<TicketResultResponse>? ticketList)? success,
    TResult Function(List<TicketListModel>? ticketList, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(ticketList, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketListInitial value) initial,
    required TResult Function(TicketListSuccess value) success,
    required TResult Function(TicketListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketListInitial value)? initial,
    TResult Function(TicketListSuccess value)? success,
    TResult Function(TicketListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TicketListError implements TicketListState {
  const factory TicketListError(
      {final List<TicketListModel>? ticketList,
      required final String message}) = _$TicketListError;

  List<TicketListModel>? get ticketList;
  String get message;
  @JsonKey(ignore: true)
  _$$TicketListErrorCopyWith<_$TicketListError> get copyWith =>
      throw _privateConstructorUsedError;
}
