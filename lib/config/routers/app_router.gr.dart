// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:github_pages/core/errors/not_found_page.dart' as _i5;
import 'package:github_pages/core/home/home_page.dart' as _i1;
import 'package:github_pages/core/interests/interests_page.dart' as _i3;
import 'package:github_pages/core/road_map/road_map_page.dart' as _i4;
import 'package:github_pages/core/technologies/technologies_page.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomePageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    TechnologiesPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.TechnologiesPage());
    },
    InterestsPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.InterestsPage());
    },
    RoadMapPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.RoadMapPage());
    },
    NotFoundPageRoute.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.NotFoundPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(HomePageRoute.name, path: '/'),
        _i6.RouteConfig(TechnologiesPageRoute.name, path: '/technologies'),
        _i6.RouteConfig(InterestsPageRoute.name, path: '/interests'),
        _i6.RouteConfig(RoadMapPageRoute.name, path: '/road-map'),
        _i6.RouteConfig(NotFoundPageRoute.name, path: '*')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomePageRoute extends _i6.PageRouteInfo<void> {
  const HomePageRoute() : super(HomePageRoute.name, path: '/');

  static const String name = 'HomePageRoute';
}

/// generated route for
/// [_i2.TechnologiesPage]
class TechnologiesPageRoute extends _i6.PageRouteInfo<void> {
  const TechnologiesPageRoute()
      : super(TechnologiesPageRoute.name, path: '/technologies');

  static const String name = 'TechnologiesPageRoute';
}

/// generated route for
/// [_i3.InterestsPage]
class InterestsPageRoute extends _i6.PageRouteInfo<void> {
  const InterestsPageRoute()
      : super(InterestsPageRoute.name, path: '/interests');

  static const String name = 'InterestsPageRoute';
}

/// generated route for
/// [_i4.RoadMapPage]
class RoadMapPageRoute extends _i6.PageRouteInfo<void> {
  const RoadMapPageRoute() : super(RoadMapPageRoute.name, path: '/road-map');

  static const String name = 'RoadMapPageRoute';
}

/// generated route for
/// [_i5.NotFoundPage]
class NotFoundPageRoute extends _i6.PageRouteInfo<void> {
  const NotFoundPageRoute() : super(NotFoundPageRoute.name, path: '*');

  static const String name = 'NotFoundPageRoute';
}
