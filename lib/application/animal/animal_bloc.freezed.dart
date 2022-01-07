// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'animal_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnimalEventTearOff {
  const _$AnimalEventTearOff();

  RandomAnimalRequested randomAnimalRequested() {
    return const RandomAnimalRequested();
  }
}

/// @nodoc
const $AnimalEvent = _$AnimalEventTearOff();

/// @nodoc
mixin _$AnimalEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() randomAnimalRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? randomAnimalRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? randomAnimalRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RandomAnimalRequested value)
        randomAnimalRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RandomAnimalRequested value)? randomAnimalRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RandomAnimalRequested value)? randomAnimalRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalEventCopyWith<$Res> {
  factory $AnimalEventCopyWith(
          AnimalEvent value, $Res Function(AnimalEvent) then) =
      _$AnimalEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AnimalEventCopyWithImpl<$Res> implements $AnimalEventCopyWith<$Res> {
  _$AnimalEventCopyWithImpl(this._value, this._then);

  final AnimalEvent _value;
  // ignore: unused_field
  final $Res Function(AnimalEvent) _then;
}

/// @nodoc
abstract class $RandomAnimalRequestedCopyWith<$Res> {
  factory $RandomAnimalRequestedCopyWith(RandomAnimalRequested value,
          $Res Function(RandomAnimalRequested) then) =
      _$RandomAnimalRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RandomAnimalRequestedCopyWithImpl<$Res>
    extends _$AnimalEventCopyWithImpl<$Res>
    implements $RandomAnimalRequestedCopyWith<$Res> {
  _$RandomAnimalRequestedCopyWithImpl(
      RandomAnimalRequested _value, $Res Function(RandomAnimalRequested) _then)
      : super(_value, (v) => _then(v as RandomAnimalRequested));

  @override
  RandomAnimalRequested get _value => super._value as RandomAnimalRequested;
}

/// @nodoc

class _$RandomAnimalRequested implements RandomAnimalRequested {
  const _$RandomAnimalRequested();

  @override
  String toString() {
    return 'AnimalEvent.randomAnimalRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RandomAnimalRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() randomAnimalRequested,
  }) {
    return randomAnimalRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? randomAnimalRequested,
  }) {
    return randomAnimalRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? randomAnimalRequested,
    required TResult orElse(),
  }) {
    if (randomAnimalRequested != null) {
      return randomAnimalRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RandomAnimalRequested value)
        randomAnimalRequested,
  }) {
    return randomAnimalRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RandomAnimalRequested value)? randomAnimalRequested,
  }) {
    return randomAnimalRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RandomAnimalRequested value)? randomAnimalRequested,
    required TResult orElse(),
  }) {
    if (randomAnimalRequested != null) {
      return randomAnimalRequested(this);
    }
    return orElse();
  }
}

abstract class RandomAnimalRequested implements AnimalEvent {
  const factory RandomAnimalRequested() = _$RandomAnimalRequested;
}

/// @nodoc
class _$AnimalStateTearOff {
  const _$AnimalStateTearOff();

  _AnimalState call({required Option<Either<Failure, Animal>> animal}) {
    return _AnimalState(
      animal: animal,
    );
  }
}

/// @nodoc
const $AnimalState = _$AnimalStateTearOff();

/// @nodoc
mixin _$AnimalState {
  Option<Either<Failure, Animal>> get animal =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnimalStateCopyWith<AnimalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnimalStateCopyWith<$Res> {
  factory $AnimalStateCopyWith(
          AnimalState value, $Res Function(AnimalState) then) =
      _$AnimalStateCopyWithImpl<$Res>;
  $Res call({Option<Either<Failure, Animal>> animal});
}

/// @nodoc
class _$AnimalStateCopyWithImpl<$Res> implements $AnimalStateCopyWith<$Res> {
  _$AnimalStateCopyWithImpl(this._value, this._then);

  final AnimalState _value;
  // ignore: unused_field
  final $Res Function(AnimalState) _then;

  @override
  $Res call({
    Object? animal = freezed,
  }) {
    return _then(_value.copyWith(
      animal: animal == freezed
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Animal>>,
    ));
  }
}

/// @nodoc
abstract class _$AnimalStateCopyWith<$Res>
    implements $AnimalStateCopyWith<$Res> {
  factory _$AnimalStateCopyWith(
          _AnimalState value, $Res Function(_AnimalState) then) =
      __$AnimalStateCopyWithImpl<$Res>;
  @override
  $Res call({Option<Either<Failure, Animal>> animal});
}

/// @nodoc
class __$AnimalStateCopyWithImpl<$Res> extends _$AnimalStateCopyWithImpl<$Res>
    implements _$AnimalStateCopyWith<$Res> {
  __$AnimalStateCopyWithImpl(
      _AnimalState _value, $Res Function(_AnimalState) _then)
      : super(_value, (v) => _then(v as _AnimalState));

  @override
  _AnimalState get _value => super._value as _AnimalState;

  @override
  $Res call({
    Object? animal = freezed,
  }) {
    return _then(_AnimalState(
      animal: animal == freezed
          ? _value.animal
          : animal // ignore: cast_nullable_to_non_nullable
              as Option<Either<Failure, Animal>>,
    ));
  }
}

/// @nodoc

class _$_AnimalState implements _AnimalState {
  _$_AnimalState({required this.animal});

  @override
  final Option<Either<Failure, Animal>> animal;

  @override
  String toString() {
    return 'AnimalState(animal: $animal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AnimalState &&
            const DeepCollectionEquality().equals(other.animal, animal));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(animal));

  @JsonKey(ignore: true)
  @override
  _$AnimalStateCopyWith<_AnimalState> get copyWith =>
      __$AnimalStateCopyWithImpl<_AnimalState>(this, _$identity);
}

abstract class _AnimalState implements AnimalState {
  factory _AnimalState({required Option<Either<Failure, Animal>> animal}) =
      _$_AnimalState;

  @override
  Option<Either<Failure, Animal>> get animal;
  @override
  @JsonKey(ignore: true)
  _$AnimalStateCopyWith<_AnimalState> get copyWith =>
      throw _privateConstructorUsedError;
}
