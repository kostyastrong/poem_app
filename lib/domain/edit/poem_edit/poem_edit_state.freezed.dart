// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poem_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PoemEditState {
  int? get poemEditIndex => throw _privateConstructorUsedError;
  TextAlign get align => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PoemEditStateCopyWith<PoemEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoemEditStateCopyWith<$Res> {
  factory $PoemEditStateCopyWith(
          PoemEditState value, $Res Function(PoemEditState) then) =
      _$PoemEditStateCopyWithImpl<$Res, PoemEditState>;
  @useResult
  $Res call({int? poemEditIndex, TextAlign align});
}

/// @nodoc
class _$PoemEditStateCopyWithImpl<$Res, $Val extends PoemEditState>
    implements $PoemEditStateCopyWith<$Res> {
  _$PoemEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poemEditIndex = freezed,
    Object? align = null,
  }) {
    return _then(_value.copyWith(
      poemEditIndex: freezed == poemEditIndex
          ? _value.poemEditIndex
          : poemEditIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      align: null == align
          ? _value.align
          : align // ignore: cast_nullable_to_non_nullable
              as TextAlign,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PoemEditStateCopyWith<$Res>
    implements $PoemEditStateCopyWith<$Res> {
  factory _$$_PoemEditStateCopyWith(
          _$_PoemEditState value, $Res Function(_$_PoemEditState) then) =
      __$$_PoemEditStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? poemEditIndex, TextAlign align});
}

/// @nodoc
class __$$_PoemEditStateCopyWithImpl<$Res>
    extends _$PoemEditStateCopyWithImpl<$Res, _$_PoemEditState>
    implements _$$_PoemEditStateCopyWith<$Res> {
  __$$_PoemEditStateCopyWithImpl(
      _$_PoemEditState _value, $Res Function(_$_PoemEditState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poemEditIndex = freezed,
    Object? align = null,
  }) {
    return _then(_$_PoemEditState(
      poemEditIndex: freezed == poemEditIndex
          ? _value.poemEditIndex
          : poemEditIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      align: null == align
          ? _value.align
          : align // ignore: cast_nullable_to_non_nullable
              as TextAlign,
    ));
  }
}

/// @nodoc

class _$_PoemEditState implements _PoemEditState {
  const _$_PoemEditState({this.poemEditIndex, this.align = TextAlign.left});

  @override
  final int? poemEditIndex;
  @override
  @JsonKey()
  final TextAlign align;

  @override
  String toString() {
    return 'PoemEditState(poemEditIndex: $poemEditIndex, align: $align)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PoemEditState &&
            (identical(other.poemEditIndex, poemEditIndex) ||
                other.poemEditIndex == poemEditIndex) &&
            (identical(other.align, align) || other.align == align));
  }

  @override
  int get hashCode => Object.hash(runtimeType, poemEditIndex, align);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PoemEditStateCopyWith<_$_PoemEditState> get copyWith =>
      __$$_PoemEditStateCopyWithImpl<_$_PoemEditState>(this, _$identity);
}

abstract class _PoemEditState implements PoemEditState {
  const factory _PoemEditState(
      {final int? poemEditIndex, final TextAlign align}) = _$_PoemEditState;

  @override
  int? get poemEditIndex;
  @override
  TextAlign get align;
  @override
  @JsonKey(ignore: true)
  _$$_PoemEditStateCopyWith<_$_PoemEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
