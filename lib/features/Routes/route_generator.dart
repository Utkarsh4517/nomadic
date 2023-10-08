import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nomadic/features/navbar/bloc/nav_bar_bloc.dart';
import 'package:nomadic/features/navbar/ui/nav_bar.dart';

class RouteGenerator {
  final navigationBloc = NavBarBloc();
  Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<NavBarBloc>.value(
            value: navigationBloc,
            child: const NavBar(),
          ),
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('Error')),
      );
    });
  }
}
