import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:github_pages/utils/classes/json_map.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dev_skill.g.dart';

@JsonEnum()
enum SkillType { frontend, backend, mobile, tool, database }

@immutable
@JsonSerializable()
class DevSkill extends Equatable {
  /// {@macro dev_skill}
  const DevSkill({
    required this.name,
    required this.type,
    required this.icon,
    required this.experience,
    this.languages = const [],
  });

  final String name;
  final SkillType type;
  final String icon;
  final double experience;
  final List<String> languages;

  /// Returns a copy of this dev skill with the given values updated.
  ///
  /// {@macro dev_skill}
  DevSkill copyWith({
    String? name,
    SkillType? type,
    String? icon,
    double? experience,
    List<String>? languages,
  }) {
    return DevSkill(
      name: name ?? this.name,
      type: type ?? this.type,
      icon: icon ?? this.icon,
      experience: experience ?? this.experience,
      languages: languages ?? this.languages,
    );
  }

  /// Deserializes the given [JsonMap] into a [DevSkill].
  static DevSkill fromJson(JsonMap json) => _$DevSkillFromJson(json);

  /// Converts this [DevSkill] into a [JsonMap].
  JsonMap toJson() => _$DevSkillToJson(this);

  @override
  List<Object?> get props => [name, type, icon, experience, languages];

  IconData? get iconData {
    try {
      return IconData(
        int.parse(icon),
        fontFamily: 'DevIcons',
        fontPackage: 'dev_icons',
      );
    } catch (e) {
      return null;
    }
  }
}
