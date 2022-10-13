// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'create_ticket_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateTicketState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateTicketResponse? createTicketResponse)
        initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel, String message)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateTicketStateCopyWith<$Res> {
  factory $CreateTicketStateCopyWith(
          CreateTicketState value, $Res Function(CreateTicketState) then) =
      _$CreateTicketStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreateTicketStateCopyWithImpl<$Res>
    implements $CreateTicketStateCopyWith<$Res> {
  _$CreateTicketStateCopyWithImpl(this._value, this._then);

  final CreateTicketState _value;
  // ignore: unused_field
  final $Res Function(CreateTicketState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  $Res call({CreateTicketResponse? createTicketResponse});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? createTicketResponse = freezed,
  }) {
    return _then(_$_Initial(
      createTicketResponse: createTicketResponse == freezed
          ? _value.createTicketResponse
          : createTicketResponse // ignore: cast_nullable_to_non_nullable
              as CreateTicketResponse?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.createTicketResponse});

  @override
  final CreateTicketResponse? createTicketResponse;

  @override
  String toString() {
    return 'CreateTicketState.initial(createTicketResponse: $createTicketResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other.createTicketResponse, createTicketResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(createTicketResponse));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateTicketResponse? createTicketResponse)
        initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel, String message)
        error,
  }) {
    return initial(createTicketResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
  }) {
    return initial?.call(createTicketResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(createTicketResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateTicketState {
  const factory _Initial({final CreateTicketResponse? createTicketResponse}) =
      _$_Initial;

  CreateTicketResponse? get createTicketResponse;
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
  $Res call({CreateTicketResponse? createModel});
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, (v) => _then(v as _$Success));

  @override
  _$Success get _value => super._value as _$Success;

  @override
  $Res call({
    Object? createModel = freezed,
  }) {
    return _then(_$Success(
      createModel: createModel == freezed
          ? _value.createModel
          : createModel // ignore: cast_nullable_to_non_nullable
              as CreateTicketResponse?,
    ));
  }
}

/// @nodoc

class _$Success implements Success {
  const _$Success({this.createModel});

  @override
  final CreateTicketResponse? createModel;

  @override
  String toString() {
    return 'CreateTicketState.success(createModel: $createModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success &&
            const DeepCollectionEquality()
                .equals(other.createModel, createModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(createModel));

  @JsonKey(ignore: true)
  @override
  _$$SuccessCopyWith<_$Success> get copyWith =>
      __$$SuccessCopyWithImpl<_$Success>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateTicketResponse? createTicketResponse)
        initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel, String message)
        error,
  }) {
    return success(createModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
  }) {
    return success?.call(createModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(createModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements CreateTicketState {
  const factory Success({final CreateTicketResponse? createModel}) = _$Success;

  CreateTicketResponse? get createModel;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<_$Success> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<$Res> {
  factory _$$ErrorCopyWith(_$Error value, $Res Function(_$Error) then) =
      __$$ErrorCopyWithImpl<$Res>;
  $Res call({CreateTicketResponse? createModel, String message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<$Res> extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$ErrorCopyWith<$Res> {
  __$$ErrorCopyWithImpl(_$Error _value, $Res Function(_$Error) _then)
      : super(_value, (v) => _then(v as _$Error));

  @override
  _$Error get _value => super._value as _$Error;

  @override
  $Res call({
    Object? createModel = freezed,
    Object? message = freezed,
  }) {
    return _then(_$Error(
      createModel: createModel == freezed
          ? _value.createModel
          : createModel // ignore: cast_nullable_to_non_nullable
              as CreateTicketResponse?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Error implements Error {
  const _$Error({this.createModel, required this.message});

  @override
  final CreateTicketResponse? createModel;
  @override
  final String message;

  @override
  String toString() {
    return 'CreateTicketState.error(createModel: $createModel, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error &&
            const DeepCollectionEquality()
                .equals(other.createModel, createModel) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createModel),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$ErrorCopyWith<_$Error> get copyWith =>
      __$$ErrorCopyWithImpl<_$Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateTicketResponse? createTicketResponse)
        initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel, String message)
        error,
  }) {
    return error(createModel, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
  }) {
    return error?.call(createModel, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateTicketResponse? createTicketResponse)? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(createModel, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Success value) success,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Success value)? success,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements CreateTicketState {
  const factory Error(
      {final CreateTicketResponse? createModel,
      required final String message}) = _$Error;

  CreateTicketResponse? get createModel;
  String get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<_$Error> get copyWith => throw _privateConstructorUsedError;
}
