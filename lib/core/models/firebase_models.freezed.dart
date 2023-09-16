// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firebase_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DateCardData _$DateCardDataFromJson(Map<String, dynamic> json) {
  return _DateCardData.fromJson(json);
}

/// @nodoc
mixin _$DateCardData {
  int get age => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;
  int get likeCount => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DateCardDataCopyWith<DateCardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateCardDataCopyWith<$Res> {
  factory $DateCardDataCopyWith(
          DateCardData value, $Res Function(DateCardData) then) =
      _$DateCardDataCopyWithImpl<$Res, DateCardData>;
  @useResult
  $Res call(
      {int age,
      String description,
      List<String> images,
      int likeCount,
      String location,
      String name,
      List<String> tags});
}

/// @nodoc
class _$DateCardDataCopyWithImpl<$Res, $Val extends DateCardData>
    implements $DateCardDataCopyWith<$Res> {
  _$DateCardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = null,
    Object? description = null,
    Object? images = null,
    Object? likeCount = null,
    Object? location = null,
    Object? name = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DateCardDataCopyWith<$Res>
    implements $DateCardDataCopyWith<$Res> {
  factory _$$_DateCardDataCopyWith(
          _$_DateCardData value, $Res Function(_$_DateCardData) then) =
      __$$_DateCardDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int age,
      String description,
      List<String> images,
      int likeCount,
      String location,
      String name,
      List<String> tags});
}

/// @nodoc
class __$$_DateCardDataCopyWithImpl<$Res>
    extends _$DateCardDataCopyWithImpl<$Res, _$_DateCardData>
    implements _$$_DateCardDataCopyWith<$Res> {
  __$$_DateCardDataCopyWithImpl(
      _$_DateCardData _value, $Res Function(_$_DateCardData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? age = null,
    Object? description = null,
    Object? images = null,
    Object? likeCount = null,
    Object? location = null,
    Object? name = null,
    Object? tags = null,
  }) {
    return _then(_$_DateCardData(
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: null == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DateCardData implements _DateCardData {
  const _$_DateCardData(
      {required this.age,
      required this.description,
      required final List<String> images,
      required this.likeCount,
      required this.location,
      required this.name,
      required final List<String> tags})
      : _images = images,
        _tags = tags;

  factory _$_DateCardData.fromJson(Map<String, dynamic> json) =>
      _$$_DateCardDataFromJson(json);

  @override
  final int age;
  @override
  final String description;
  final List<String> _images;
  @override
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  final int likeCount;
  @override
  final String location;
  @override
  final String name;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'DateCardData(age: $age, description: $description, images: $images, likeCount: $likeCount, location: $location, name: $name, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DateCardData &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      age,
      description,
      const DeepCollectionEquality().hash(_images),
      likeCount,
      location,
      name,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DateCardDataCopyWith<_$_DateCardData> get copyWith =>
      __$$_DateCardDataCopyWithImpl<_$_DateCardData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DateCardDataToJson(
      this,
    );
  }
}

abstract class _DateCardData implements DateCardData {
  const factory _DateCardData(
      {required final int age,
      required final String description,
      required final List<String> images,
      required final int likeCount,
      required final String location,
      required final String name,
      required final List<String> tags}) = _$_DateCardData;

  factory _DateCardData.fromJson(Map<String, dynamic> json) =
      _$_DateCardData.fromJson;

  @override
  int get age;
  @override
  String get description;
  @override
  List<String> get images;
  @override
  int get likeCount;
  @override
  String get location;
  @override
  String get name;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$_DateCardDataCopyWith<_$_DateCardData> get copyWith =>
      throw _privateConstructorUsedError;
}
