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
    required TResult Function() initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel) load,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateTicketInitial value) initial,
    required TResult Function(CreateTicketSuccess value) success,
    required TResult Function(CreateTicketLoad value) load,
    required TResult Function(CreateTicketError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
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
abstract class _$$CreateTicketInitialCopyWith<$Res> {
  factory _$$CreateTicketInitialCopyWith(_$CreateTicketInitial value,
          $Res Function(_$CreateTicketInitial) then) =
      __$$CreateTicketInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateTicketInitialCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$CreateTicketInitialCopyWith<$Res> {
  __$$CreateTicketInitialCopyWithImpl(
      _$CreateTicketInitial _value, $Res Function(_$CreateTicketInitial) _then)
      : super(_value, (v) => _then(v as _$CreateTicketInitial));

  @override
  _$CreateTicketInitial get _value => super._value as _$CreateTicketInitial;
}

/// @nodoc

class _$CreateTicketInitial implements CreateTicketInitial {
  const _$CreateTicketInitial();

  @override
  String toString() {
    return 'CreateTicketState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateTicketInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel) load,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
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
    required TResult Function(CreateTicketInitial value) initial,
    required TResult Function(CreateTicketSuccess value) success,
    required TResult Function(CreateTicketLoad value) load,
    required TResult Function(CreateTicketError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class CreateTicketInitial implements CreateTicketState {
  const factory CreateTicketInitial() = _$CreateTicketInitial;
}

/// @nodoc
abstract class _$$CreateTicketSuccessCopyWith<$Res> {
  factory _$$CreateTicketSuccessCopyWith(_$CreateTicketSuccess value,
          $Res Function(_$CreateTicketSuccess) then) =
      __$$CreateTicketSuccessCopyWithImpl<$Res>;
  $Res call({CreateTicketResponse? createModel});
}

/// @nodoc
class __$$CreateTicketSuccessCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$CreateTicketSuccessCopyWith<$Res> {
  __$$CreateTicketSuccessCopyWithImpl(
      _$CreateTicketSuccess _value, $Res Function(_$CreateTicketSuccess) _then)
      : super(_value, (v) => _then(v as _$CreateTicketSuccess));

  @override
  _$CreateTicketSuccess get _value => super._value as _$CreateTicketSuccess;

  @override
  $Res call({
    Object? createModel = freezed,
  }) {
    return _then(_$CreateTicketSuccess(
      createModel: createModel == freezed
          ? _value.createModel
          : createModel // ignore: cast_nullable_to_non_nullable
              as CreateTicketResponse?,
    ));
  }
}

/// @nodoc

class _$CreateTicketSuccess implements CreateTicketSuccess {
  const _$CreateTicketSuccess({this.createModel});

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
            other is _$CreateTicketSuccess &&
            const DeepCollectionEquality()
                .equals(other.createModel, createModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(createModel));

  @JsonKey(ignore: true)
  @override
  _$$CreateTicketSuccessCopyWith<_$CreateTicketSuccess> get copyWith =>
      __$$CreateTicketSuccessCopyWithImpl<_$CreateTicketSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel) load,
    required TResult Function(String message) error,
  }) {
    return success(createModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
  }) {
    return success?.call(createModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
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
    required TResult Function(CreateTicketInitial value) initial,
    required TResult Function(CreateTicketSuccess value) success,
    required TResult Function(CreateTicketLoad value) load,
    required TResult Function(CreateTicketError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CreateTicketSuccess implements CreateTicketState {
  const factory CreateTicketSuccess({final CreateTicketResponse? createModel}) =
      _$CreateTicketSuccess;

  CreateTicketResponse? get createModel;
  @JsonKey(ignore: true)
  _$$CreateTicketSuccessCopyWith<_$CreateTicketSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTicketLoadCopyWith<$Res> {
  factory _$$CreateTicketLoadCopyWith(
          _$CreateTicketLoad value, $Res Function(_$CreateTicketLoad) then) =
      __$$CreateTicketLoadCopyWithImpl<$Res>;
  $Res call({CreateTicketResponse? createModel});
}

/// @nodoc
class __$$CreateTicketLoadCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$CreateTicketLoadCopyWith<$Res> {
  __$$CreateTicketLoadCopyWithImpl(
      _$CreateTicketLoad _value, $Res Function(_$CreateTicketLoad) _then)
      : super(_value, (v) => _then(v as _$CreateTicketLoad));

  @override
  _$CreateTicketLoad get _value => super._value as _$CreateTicketLoad;

  @override
  $Res call({
    Object? createModel = freezed,
  }) {
    return _then(_$CreateTicketLoad(
      createModel: createModel == freezed
          ? _value.createModel
          : createModel // ignore: cast_nullable_to_non_nullable
              as CreateTicketResponse?,
    ));
  }
}

/// @nodoc

class _$CreateTicketLoad implements CreateTicketLoad {
  const _$CreateTicketLoad({this.createModel});

  @override
  final CreateTicketResponse? createModel;

  @override
  String toString() {
    return 'CreateTicketState.load(createModel: $createModel)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketLoad &&
            const DeepCollectionEquality()
                .equals(other.createModel, createModel));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(createModel));

  @JsonKey(ignore: true)
  @override
  _$$CreateTicketLoadCopyWith<_$CreateTicketLoad> get copyWith =>
      __$$CreateTicketLoadCopyWithImpl<_$CreateTicketLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel) load,
    required TResult Function(String message) error,
  }) {
    return load(createModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
  }) {
    return load?.call(createModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(createModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateTicketInitial value) initial,
    required TResult Function(CreateTicketSuccess value) success,
    required TResult Function(CreateTicketLoad value) load,
    required TResult Function(CreateTicketError value) error,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class CreateTicketLoad implements CreateTicketState {
  const factory CreateTicketLoad({final CreateTicketResponse? createModel}) =
      _$CreateTicketLoad;

  CreateTicketResponse? get createModel;
  @JsonKey(ignore: true)
  _$$CreateTicketLoadCopyWith<_$CreateTicketLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTicketErrorCopyWith<$Res> {
  factory _$$CreateTicketErrorCopyWith(
          _$CreateTicketError value, $Res Function(_$CreateTicketError) then) =
      __$$CreateTicketErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$$CreateTicketErrorCopyWithImpl<$Res>
    extends _$CreateTicketStateCopyWithImpl<$Res>
    implements _$$CreateTicketErrorCopyWith<$Res> {
  __$$CreateTicketErrorCopyWithImpl(
      _$CreateTicketError _value, $Res Function(_$CreateTicketError) _then)
      : super(_value, (v) => _then(v as _$CreateTicketError));

  @override
  _$CreateTicketError get _value => super._value as _$CreateTicketError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$CreateTicketError(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateTicketError implements CreateTicketError {
  const _$CreateTicketError({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'CreateTicketState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTicketError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$CreateTicketErrorCopyWith<_$CreateTicketError> get copyWith =>
      __$$CreateTicketErrorCopyWithImpl<_$CreateTicketError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CreateTicketResponse? createModel) success,
    required TResult Function(CreateTicketResponse? createModel) load,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CreateTicketResponse? createModel)? success,
    TResult Function(CreateTicketResponse? createModel)? load,
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
    required TResult Function(CreateTicketInitial value) initial,
    required TResult Function(CreateTicketSuccess value) success,
    required TResult Function(CreateTicketLoad value) load,
    required TResult Function(CreateTicketError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateTicketInitial value)? initial,
    TResult Function(CreateTicketSuccess value)? success,
    TResult Function(CreateTicketLoad value)? load,
    TResult Function(CreateTicketError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class CreateTicketError implements CreateTicketState {
  const factory CreateTicketError({required final String message}) =
      _$CreateTicketError;

  String get message;
  @JsonKey(ignore: true)
  _$$CreateTicketErrorCopyWith<_$CreateTicketError> get copyWith =>
      throw _privateConstructorUsedError;
}
