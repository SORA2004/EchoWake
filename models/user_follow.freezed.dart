// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_follow.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserFollow _$UserFollowFromJson(Map<String, dynamic> json) {
  return _UserFollow.fromJson(json);
}

/// @nodoc
mixin _$UserFollow {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get followId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserFollowCopyWith<UserFollow> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFollowCopyWith<$Res> {
  factory $UserFollowCopyWith(
          UserFollow value, $Res Function(UserFollow) then) =
      _$UserFollowCopyWithImpl<$Res, UserFollow>;
  @useResult
  $Res call({String? id, String userId, String followId});
}

/// @nodoc
class _$UserFollowCopyWithImpl<$Res, $Val extends UserFollow>
    implements $UserFollowCopyWith<$Res> {
  _$UserFollowCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? followId = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followId: null == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserFollowImplCopyWith<$Res>
    implements $UserFollowCopyWith<$Res> {
  factory _$$UserFollowImplCopyWith(
          _$UserFollowImpl value, $Res Function(_$UserFollowImpl) then) =
      __$$UserFollowImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String userId, String followId});
}

/// @nodoc
class __$$UserFollowImplCopyWithImpl<$Res>
    extends _$UserFollowCopyWithImpl<$Res, _$UserFollowImpl>
    implements _$$UserFollowImplCopyWith<$Res> {
  __$$UserFollowImplCopyWithImpl(
      _$UserFollowImpl _value, $Res Function(_$UserFollowImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? followId = null,
  }) {
    return _then(_$UserFollowImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      followId: null == followId
          ? _value.followId
          : followId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserFollowImpl implements _UserFollow {
  _$UserFollowImpl({this.id, required this.userId, required this.followId});

  factory _$UserFollowImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserFollowImplFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String followId;

  @override
  String toString() {
    return 'UserFollow(id: $id, userId: $userId, followId: $followId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserFollowImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.followId, followId) ||
                other.followId == followId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, followId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserFollowImplCopyWith<_$UserFollowImpl> get copyWith =>
      __$$UserFollowImplCopyWithImpl<_$UserFollowImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserFollowImplToJson(
      this,
    );
  }
}

abstract class _UserFollow implements UserFollow {
  factory _UserFollow(
      {final String? id,
      required final String userId,
      required final String followId}) = _$UserFollowImpl;

  factory _UserFollow.fromJson(Map<String, dynamic> json) =
      _$UserFollowImpl.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get followId;
  @override
  @JsonKey(ignore: true)
  _$$UserFollowImplCopyWith<_$UserFollowImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
