// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ticket_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TicketDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(TicketResultResponse? ticketDetailModel) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketDetailInitial value) initial,
    required TResult Function(TicketDetailSuccess value) success,
    required TResult Function(TicketDetailError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailStateCopyWith<$Res> {
  factory $TicketDetailStateCopyWith(
          TicketDetailState value, $Res Function(TicketDetailState) then) =
      _$TicketDetailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TicketDetailStateCopyWithImpl<$Res>
    implements $TicketDetailStateCopyWith<$Res> {
  _$TicketDetailStateCopyWithImpl(this._value, this._then);

  final TicketDetailState _value;
  // ignore: unused_field
  final $Res Function(TicketDetailState) _then;
}

/// @nodoc
abstract class _$$TicketDetailInitialCopyWith<$Res> {
  factory _$$TicketDetailInitialCopyWith(_$TicketDetailInitial value,
          $Res Function(_$TicketDetailInitial) then) =
      __$$TicketDetailInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TicketDetailInitialCopyWithImpl<$Res>
    extends _$TicketDetailStateCopyWithImpl<$Res>
    implements _$$TicketDetailInitialCopyWith<$Res> {
  __$$TicketDetailInitialCopyWithImpl(
      _$TicketDetailInitial _value, $Res Function(_$TicketDetailInitial) _then)
      : super(_value, (v) => _then(v as _$TicketDetailInitial));

  @override
  _$TicketDetailInitial get _value => super._value as _$TicketDetailInitial;
}

/// @nodoc

class _$TicketDetailInitial implements TicketDetailInitial {
  const _$TicketDetailInitial();

  @override
  String toString() {
    return 'TicketDetailState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TicketDetailInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(TicketResultResponse? ticketDetailModel) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
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
    required TResult Function(TicketDetailInitial value) initial,
    required TResult Function(TicketDetailSuccess value) success,
    required TResult Function(TicketDetailError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TicketDetailInitial implements TicketDetailState {
  const factory TicketDetailInitial() = _$TicketDetailInitial;
}

/// @nodoc
abstract class _$$TicketDetailSuccessCopyWith<$Res> {
  factory _$$TicketDetailSuccessCopyWith(_$TicketDetailSuccess value,
          $Res Function(_$TicketDetailSuccess) then) =
      __$$TicketDetailSuccessCopyWithImpl<$Res>;
  $Res call({TicketResultResponse? ticketDetailModel});
}

/// @nodoc
class __$$TicketDetailSuccessCopyWithImpl<$Res>
    extends _$TicketDetailStateCopyWithImpl<$Res>
    implements _$$TicketDetailSuccessCopyWith<$Res> {
  __$$TicketDetailSuccessCopyWithImpl(
      _$TicketDetailSuccess _value, $Res Function(_$TicketDetailSuccess) _then)
      : super(_value, (v) => _then(v as _$TicketDetailSuccess));

  @override
  _$TicketDetailSuccess get _value => super._value as _$TicketDetailSuccess;

  @override
  $Res call({
    Object? ticketDetailModel = freezed,
  }) {
    return _then(_$TicketDetailSuccess(
      ticketDetailModel: ticketDetailModel == freezed
          ? _value.ticketDetailModel
          : ticketDetailModel // ignore: cast_nullable_to_non_nullable
              as TicketResultResponse?,
    ));
  }
}

/// @nodoc

class _$TicketDetailSuccess implements TicketDetailSuccess {
  const _$TicketDetailSuccess({this.ticketDetailModel});

  @override
  final TicketResultResponse? ticketDetailModel;

  @override
  String toString() {
    return 'TicketDetailState.success(ticketDetailModel: $ticketDetailModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailSuccess &&
            const DeepCollectionEquality()
                .equals(other.ticketDetailModel, ticketDetailModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(ticketDetailModel));

  @JsonKey(ignore: true)
  @override
  _$$TicketDetailSuccessCopyWith<_$TicketDetailSuccess> get copyWith =>
      __$$TicketDetailSuccessCopyWithImpl<_$TicketDetailSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(TicketResultResponse? ticketDetailModel) success,
    required TResult Function(String message) error,
  }) {
    return success(ticketDetailModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
  }) {
    return success?.call(ticketDetailModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(ticketDetailModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketDetailInitial value) initial,
    required TResult Function(TicketDetailSuccess value) success,
    required TResult Function(TicketDetailError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class TicketDetailSuccess implements TicketDetailState {
  const factory TicketDetailSuccess(
      {final TicketResultResponse? ticketDetailModel}) = _$TicketDetailSuccess;

  TicketResultResponse? get ticketDetailModel;
  @JsonKey(ignore: true)
  _$$TicketDetailSuccessCopyWith<_$TicketDetailSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TicketDetailErrorCopyWith<$Res> {
  factory _$$TicketDetailErrorCopyWith(
          _$TicketDetailError value, $Res Function(_$TicketDetailError) then) =
      __$$TicketDetailErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$TicketDetailErrorCopyWithImpl<$Res>
    extends _$TicketDetailStateCopyWithImpl<$Res>
    implements _$$TicketDetailErrorCopyWith<$Res> {
  __$$TicketDetailErrorCopyWithImpl(
      _$TicketDetailError _value, $Res Function(_$TicketDetailError) _then)
      : super(_value, (v) => _then(v as _$TicketDetailError));

  @override
  _$TicketDetailError get _value => super._value as _$TicketDetailError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$TicketDetailError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TicketDetailError implements TicketDetailError {
  const _$TicketDetailError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TicketDetailState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$TicketDetailErrorCopyWith<_$TicketDetailError> get copyWith =>
      __$$TicketDetailErrorCopyWithImpl<_$TicketDetailError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(TicketResultResponse? ticketDetailModel) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(TicketResultResponse? ticketDetailModel)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TicketDetailInitial value) initial,
    required TResult Function(TicketDetailSuccess value) success,
    required TResult Function(TicketDetailError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TicketDetailInitial value)? initial,
    TResult Function(TicketDetailSuccess value)? success,
    TResult Function(TicketDetailError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TicketDetailError implements TicketDetailState {
  const factory TicketDetailError({required final String message}) =
      _$TicketDetailError;

  String get message;
  @JsonKey(ignore: true)
  _$$TicketDetailErrorCopyWith<_$TicketDetailError> get copyWith =>
      throw _privateConstructorUsedError;
}
