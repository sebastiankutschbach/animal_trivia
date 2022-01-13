// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'trivia_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TriviaPageEventTearOff {
  const _$TriviaPageEventTearOff();

  RandomAnimalRequested randomAnimalRequested() {
    return const RandomAnimalRequested();
  }
}

/// @nodoc
const $TriviaPageEvent = _$TriviaPageEventTearOff();

/// @nodoc
mixin _$TriviaPageEvent {
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
abstract class $TriviaPageEventCopyWith<$Res> {
  factory $TriviaPageEventCopyWith(
          TriviaPageEvent value, $Res Function(TriviaPageEvent) then) =
      _$TriviaPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TriviaPageEventCopyWithImpl<$Res>
    implements $TriviaPageEventCopyWith<$Res> {
  _$TriviaPageEventCopyWithImpl(this._value, this._then);

  final TriviaPageEvent _value;
  // ignore: unused_field
  final $Res Function(TriviaPageEvent) _then;
}

/// @nodoc
abstract class $RandomAnimalRequestedCopyWith<$Res> {
  factory $RandomAnimalRequestedCopyWith(RandomAnimalRequested value,
          $Res Function(RandomAnimalRequested) then) =
      _$RandomAnimalRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RandomAnimalRequestedCopyWithImpl<$Res>
    extends _$TriviaPageEventCopyWithImpl<$Res>
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
    return 'TriviaPageEvent.randomAnimalRequested()';
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

abstract class RandomAnimalRequested implements TriviaPageEvent {
  const factory RandomAnimalRequested() = _$RandomAnimalRequested;
}
