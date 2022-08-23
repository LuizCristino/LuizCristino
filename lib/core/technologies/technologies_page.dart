import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_pages/utils/classes/dev_skill.dart';
import 'package:github_pages/utils/hooks/use_breakpoint_value.dart';
import 'package:github_pages/widgets/dev_skill_card.dart';
import 'package:github_pages/widgets/split_view.dart';

class TechnologiesPage extends StatelessWidget {
  const TechnologiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final progressColor =
        Theme.of(context).colorScheme.primary.withOpacity(0.3);

    return SplitView(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context)
              .loadString('assets/data/dev_skills.json'),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }

            final skills = List<Map<dynamic, dynamic>>.from(
              json.decode(snapshot.data.toString()) as List,
            ).map((item) {
              return DevSkill.fromJson(Map<String, dynamic>.from(item));
            }).toList();

            /// Change number of rows based on breakpoint
            final crossAxisCount = useBreakpointsValue(
              const ValueByBreakpoint(
                mobile: 2,
                tablet: 3,
                computer: 4,
                fallback: 2,
              ),
              context,
            );

            return Padding(
              padding: const EdgeInsets.all(8),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 28 / 9,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: skills.length,
                itemBuilder: (BuildContext context, int index) {
                  final skill = skills[index];

                  return DevSkillCard(
                    skill: skill,
                    progressColor: progressColor,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
