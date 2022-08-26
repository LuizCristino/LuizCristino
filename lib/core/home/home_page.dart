import 'package:flutter/material.dart';
import 'package:github_pages/widgets/split_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    const sizedBox = SizedBox(height: 8);

    final petProjects = List<String>.from([
      'Own OTS (Open Tibia Server) with custom spells made in LUA',
      'An app to rename every file in a folder. (Using regex to find and replace)',
      'A lore app with DotA champions (Java)'
    ]);

    final degrees = List<String>.from([
      'Computer Engineering',
      'Technology in systems development and analysis'
    ]);

    return SplitView(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello World! ... Sorry force of habit.',
                style: textTheme.headline5,
              ),
              sizedBox,
              Text(
                "Hi, my name is Luiz, I've started programming in 2000, as a hobby, at that time I did some pet projects like:",
                style: textTheme.headline6,
              ),
              sizedBox,
              buildPetProjects(petProjects),
              sizedBox,
              Text(
                "Since then, I've being studying and honing my skills, selected this world as my carrier path and went after my two degrees:",
                style: textTheme.headline6,
              ),
              sizedBox,
              buildDegrees(degrees),
              sizedBox,
              Text(
                "Currently, I've being working with Web and hybrid mobile apps (mostly React Native and some Flutter), Android is something I've being in love with since Froyo, and this love and knowledge proved useful when I had to build a bridge between Android and React Native.",
                style: textTheme.headline6,
              ),
              sizedBox,
              Text(
                "My next step is to start a Master Degree in IA, always loved how it works and what can be done with it, right now I'm only self-taught in this area.",
                style: textTheme.headline6,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDegrees(List<String> degrees) {
    return Row(
      children: degrees
          .map<Widget>(
            (e) => Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.workspace_premium_outlined,
                    ),
                    title: Text(e),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildPetProjects(List<String> petProjects) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: petProjects
          .map<Widget>(
            (e) => Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: const Icon(
                      Icons.new_releases_outlined,
                    ),
                    title: Text(e),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
