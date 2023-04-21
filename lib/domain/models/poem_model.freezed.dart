// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PoemModel _$PoemModelFromJson(Map<String, dynamic> json) {
  return _PoemModel.fromJson(json);
}

/// @nodoc
mixin _$PoemModel {
  int get index => throw _privateConstructorUsedError; // index in db
  String get title => throw _privateConstructorUsedError;
  String get poem => throw _privateConstructorUsedError;
  int get lastEdited => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PoemModelCopyWith<PoemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoemModelCopyWith<$Res> {
  factory $PoemModelCopyWith(PoemModel value, $Res Function(PoemModel) then) =
      _$PoemModelCopyWithImpl<$Res, PoemModel>;
  @useResult
  $Res call({int index, String title, String poem, int lastEdited});
}

/// @nodoc
class _$PoemModelCopyWithImpl<$Res, $Val extends PoemModel>
    implements $PoemModelCopyWith<$Res> {
  _$PoemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? poem = null,
    Object? lastEdited = null,
  }) {
    return _then(_value.copyWith(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      poem: null == poem
          ? _value.poem
          : poem // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: null == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PoemModelCopyWith<$Res> implements $PoemModelCopyWith<$Res> {
  factory _$$_PoemModelCopyWith(
          _$_PoemModel value, $Res Function(_$_PoemModel) then) =
      __$$_PoemModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int index, String title, String poem, int lastEdited});
}

/// @nodoc
class __$$_PoemModelCopyWithImpl<$Res>
    extends _$PoemModelCopyWithImpl<$Res, _$_PoemModel>
    implements _$$_PoemModelCopyWith<$Res> {
  __$$_PoemModelCopyWithImpl(
      _$_PoemModel _value, $Res Function(_$_PoemModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
    Object? title = null,
    Object? poem = null,
    Object? lastEdited = null,
  }) {
    return _then(_$_PoemModel(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      poem: null == poem
          ? _value.poem
          : poem // ignore: cast_nullable_to_non_nullable
              as String,
      lastEdited: null == lastEdited
          ? _value.lastEdited
          : lastEdited // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PoemModel implements _PoemModel {
  _$_PoemModel(
      {required this.index,
      this.title = "",
      this.poem = "",
      required this.lastEdited});

  factory _$_PoemModel.fromJson(Map<String, dynamic> json) =>
      _$$_PoemModelFromJson(json);

  @override
  final int index;
// index in db
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String poem;
  @override
  final int lastEdited;

  @override
  String toString() {
    return 'PoemModel(index: $index, title: $title, poem: $poem, lastEdited: $lastEdited)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PoemModel &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.poem, poem) || other.poem == poem) &&
            (identical(other.lastEdited, lastEdited) ||
                other.lastEdited == lastEdited));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, index, title, poem, lastEdited);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PoemModelCopyWith<_$_PoemModel> get copyWith =>
      __$$_PoemModelCopyWithImpl<_$_PoemModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PoemModelToJson(
      this,
    );
  }
}

abstract class _PoemModel implements PoemModel {
  factory _PoemModel(
      {required final int index,
      final String title,
      final String poem,
      required final int lastEdited}) = _$_PoemModel;

  factory _PoemModel.fromJson(Map<String, dynamic> json) =
      _$_PoemModel.fromJson;

  @override
  int get index;
  @override // index in db
  String get title;
  @override
  String get poem;
  @override
  int get lastEdited;
  @override
  @JsonKey(ignore: true)
  _$$_PoemModelCopyWith<_$_PoemModel> get copyWith =>
      throw _privateConstructorUsedError;
}
