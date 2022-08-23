import 'package:flutter/material.dart';
import 'package:github_pages/utils/classes/dev_skill.dart';

class DevSkillCard extends StatelessWidget {
  const DevSkillCard({
    super.key,
    required this.skill,
    required this.progressColor,
  });

  final DevSkill skill;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    final percentage = skill.experience / 100;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 1,
            widthFactor: percentage,
            child: ColoredBox(color: progressColor),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Wrap(
              runAlignment: WrapAlignment.center,
              spacing: 8,
              children: [
                Icon(skill.iconData),
                Text(
                  skill.name,
                  style: const TextStyle(height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
