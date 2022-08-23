// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dev_skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DevSkill _$DevSkillFromJson(Map<String, dynamic> json) => DevSkill(
      name: json['name'] as String,
      type: $enumDecode(_$SkillTypeEnumMap, json['type']),
      icon: json['icon'] as String,
      experience: (json['experience'] as num).toDouble(),
      languages: (json['languages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$DevSkillToJson(DevSkill instance) => <String, dynamic>{
      'name': instance.name,
      'type': _$SkillTypeEnumMap[instance.type]!,
      'icon': instance.icon,
      'experience': instance.experience,
      'languages': instance.languages,
    };

const _$SkillTypeEnumMap = {
  SkillType.frontend: 'frontend',
  SkillType.backend: 'backend',
  SkillType.mobile: 'mobile',
  SkillType.tool: 'tool',
  SkillType.database: 'database',
};
