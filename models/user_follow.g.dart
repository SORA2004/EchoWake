// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_follow.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserFollowImpl _$$UserFollowImplFromJson(Map<String, dynamic> json) =>
    _$UserFollowImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      followId: json['followId'] as String,
    );

Map<String, dynamic> _$$UserFollowImplToJson(_$UserFollowImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'followId': instance.followId,
    };
