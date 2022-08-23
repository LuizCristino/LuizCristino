import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:github_pages/config/routers/app_router.gr.dart';
import 'package:github_pages/constants/external_links.dart';
import 'package:github_pages/constants/texts.dart';
import 'package:github_pages/utils/classes/drawer_contact.dart';
import 'package:github_pages/utils/classes/drawer_route.dart';
import 'package:github_pages/widgets/circle_icon_button.dart';
import 'package:github_pages/widgets/drawer_list_tile.dart';
import 'package:intl/intl.dart';
import 'package:universal_html/html.dart' as html;

final List<DrawerContact> contacts = [
  DrawerContact(
    icon: FontAwesomeIcons.github,
    onPressed: () {
      html.window.open(ExternalLinks.github, '_blank');
    },
  ),
  DrawerContact(
    icon: FontAwesomeIcons.gitlab,
    onPressed: () {
      html.window.open(ExternalLinks.gitlab, '_blank');
    },
  ),
  DrawerContact(
    icon: FontAwesomeIcons.linkedin,
    onPressed: () {
      html.window.open(ExternalLinks.linkedIn, '_blank');
    },
  ),
  DrawerContact(
    icon: FontAwesomeIcons.at,
    onPressed: () {
      html.window.open('mailto:{$ExternalLinks.email}', '_blank');
    },
  ),
];

final List<DrawerRoute> routes = [
  const DrawerRoute(
    path: '/',
    route: HomePageRoute(),
    title: 'Home',
    activeIcon: Icons.home,
    inactiveIcon: Icons.home_outlined,
  ),
  const DrawerRoute(
    path: '/technologies',
    route: TechnologiesPageRoute(),
    title: 'Technologies',
    activeIcon: Icons.extension,
    inactiveIcon: Icons.extension_outlined,
  ),
  const DrawerRoute(
    path: '/interests',
    route: InterestsPageRoute(),
    title: 'Interests',
    activeIcon: Icons.interests,
    inactiveIcon: Icons.interests_outlined,
  ),
  const DrawerRoute(
    path: '/road-map',
    route: RoadMapPageRoute(),
    title: 'Road map',
    activeIcon: Icons.map,
    inactiveIcon: Icons.map_outlined,
  ),
];

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            builderHeader(context),
            builderItems(context),
          ],
        ),
      ),
    );
  }
}

Widget builderHeader(BuildContext context) {
  final theme = Theme.of(context);
  final mediaQuery = MediaQuery.of(context);

  final color = theme.colorScheme.primary;

  /// Get current date day and divides by number of profile pictures
  /// after that completes number with 0 until it has 3 characters
  final number = (int.parse(DateFormat('dd').format(DateTime.now())) % 8)
      .toString()
      .padLeft(3, '0');

  return Container(
    color: color,
    padding: EdgeInsets.only(top: mediaQuery.padding.top),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        children: <Widget>[
          CircleAvatar(
            radius: 48,
            backgroundImage:
                AssetImage('assets/images/profiles/profile_$number.png'),
          ),
          const Text(
            Texts.author,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.4,
            ),
          ),
          Wrap(
            spacing: 4,
            children: contacts
                .map<Widget>(
                  (contact) => CircleIconButton(
                    icon: FaIcon(contact.icon),
                    onPressed: contact.onPressed,
                  ),
                )
                .toList(),
          )
        ],
      ),
    ),
  );
}

Widget builderItems(BuildContext context) {
  final scaffold = Scaffold.of(context);
  final theme = Theme.of(context);
  final color = theme.colorScheme.primary;

  final currentPath = context.topRoute.path;

  void closeDrawer(VoidCallback callback) {
    // TODO(myself): Fix drawer closing animation when in mobile
    if (scaffold.isDrawerOpen) {
      scaffold.closeDrawer();
    }

    callback();
  }

  return Padding(
    padding: const EdgeInsets.all(8),
    child: Wrap(
      runSpacing: 8,
      children: routes
          .map<Widget>(
            (route) => DrawerListTile(
              leading: Icon(route.getIcon(currentPath)),
              title: Text(route.title),
              onTap: () {
                closeDrawer(() => context.router.replace(route.route));
              },
              tileColor:
                  route.isActive(currentPath) ? color.withOpacity(0.3) : null,
            ),
          )
          .toList(),
    ),
  );
}
