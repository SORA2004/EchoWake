// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      audioUrl: json['audioUrl'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
      photoURL: json['photoURL'] as String?,
      likeCount: json['likeCount'] as int,
      viewCount: json['viewCount'] as int,
      downloadCount: json['downloadCount'] as int,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updatedAt'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'title': instance.title,
      'audioUrl': instance.audioUrl,
      'thumbnailUrl': instance.thumbnailUrl,
      'photoURL': instance.photoURL,
      'likeCount': instance.likeCount,
      'viewCount': instance.viewCount,
      'downloadCount': instance.downloadCount,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'updatedAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
