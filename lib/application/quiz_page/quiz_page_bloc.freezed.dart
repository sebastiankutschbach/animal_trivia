// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'quiz_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QuizPageEventTearOff {
  const _$QuizPageEventTearOff();

  RandomAnimalsRequested randomAnimalsRequested() {
    return const RandomAnimalsRequested();
  }
}

/// @nodoc
const $QuizPageEvent = _$QuizPageEventTearOff();

/// @nodoc
mixin _$QuizPageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() randomAnimalsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? randomAnimalsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? randomAnimalsRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RandomAnimalsRequested value)
        randomAnimalsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RandomAnimalsRequested value)? randomAnimalsRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RandomAnimalsRequested value)? randomAnimalsRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuizPageEventCopyWith<$Res> {
  factory $QuizPageEventCopyWith(
          QuizPageEvent value, $Res Function(QuizPageEvent) then) =
      _$QuizPageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QuizPageEventCopyWithImpl<$Res>
    implements $QuizPageEventCopyWith<$Res> {
  _$QuizPageEventCopyWithImpl(this._value, this._then);

  final QuizPageEvent _value;
  // ignore: unused_field
  final $Res Function(QuizPageEvent) _then;
}

/// @nodoc
abstract class $RandomAnimalsRequestedCopyWith<$Res> {
  factory $RandomAnimalsRequestedCopyWith(RandomAnimalsRequested value,
          $Res Function(RandomAnimalsRequested) then) =
      _$RandomAnimalsRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class _$RandomAnimalsRequestedCopyWithImpl<$Res>
    extends _$QuizPageEventCopyWithImpl<$Res>
    implements $RandomAnimalsRequestedCopyWith<$Res> {
  _$RandomAnimalsRequestedCopyWithImpl(RandomAnimalsRequested _value,
      $Res Function(RandomAnimalsRequested) _then)
      : super(_value, (v) => _then(v as RandomAnimalsRequested));

  @override
  RandomAnimalsRequested get _value => super._value as RandomAnimalsRequested;
}

/// @nodoc

class _$RandomAnimalsRequested implements RandomAnimalsRequested {
  const _$RandomAnimalsRequested();

  @override
  String toString() {
    return 'QuizPageEvent.randomAnimalsRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RandomAnimalsRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() randomAnimalsRequested,
  }) {
    return randomAnimalsRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? randomAnimalsRequested,
  }) {
    return randomAnimalsRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? randomAnimalsRequested,
    required TResult orElse(),
  }) {
    if (randomAnimalsRequested != null) {
      return randomAnimalsRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RandomAnimalsRequested value)
        randomAnimalsRequested,
  }) {
    return randomAnimalsRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(RandomAnimalsRequested value)? randomAnimalsRequested,
  }) {
    return randomAnimalsRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RandomAnimalsRequested value)? randomAnimalsRequested,
    required TResult orElse(),
  }) {
    if (randomAnimalsRequested != null) {
      return randomAnimalsRequested(this);
    }
    return orElse();
  }
}

abstract class RandomAnimalsRequested implements QuizPageEvent {
  const factory RandomAnimalsRequested() = _$RandomAnimalsRequested;
}
