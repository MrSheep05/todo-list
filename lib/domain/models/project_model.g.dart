// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      status:
          const StringTaskStatusConverter().fromJson(json['status'] as String?),
      timestamp: const StringDateTimeConverter()
          .fromJson(json['timestamp'] as String?),
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'status': const StringTaskStatusConverter().toJson(instance.status),
      'timestamp': const StringDateTimeConverter().toJson(instance.timestamp),
    };
