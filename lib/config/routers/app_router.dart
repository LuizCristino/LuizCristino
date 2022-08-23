import 'package:auto_route/annotations.dart';
import 'package:github_pages/core/errors/not_found_page.dart';
import 'package:github_pages/core/home/home_page.dart';
import 'package:github_pages/core/interests/interests_page.dart';
import 'package:github_pages/core/road_map/road_map_page.dart';
import 'package:github_pages/core/technologies/technologies_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage),
    AutoRoute(path: '/technologies', page: TechnologiesPage),
    AutoRoute(path: '/interests', page: InterestsPage),
    AutoRoute(path: '/road-map', page: RoadMapPage),
    AutoRoute(path: '*', page: NotFoundPage),
  ],
)
class $AppRouter {}
