import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;


class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void pop() {
    _navigatorKey.currentState!.pop();
  }

  Future pushNamed(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: args);
  }

  Future pushReplacement(String routeName, {Object? args}) {
    return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: args);
  }


GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;










}
