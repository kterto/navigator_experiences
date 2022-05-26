// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:navigator_experiences/src/nested_router/book_route_information_parser_nested.dart';
import 'package:navigator_experiences/src/nested_router/book_router_delegate_nested.dart';
import 'package:navigator_experiences/src/router/book_router_delegate.dart';

class NestedRouterApp extends StatefulWidget {
  const NestedRouterApp({super.key});

  @override
  _NestedRouterAppState createState() => _NestedRouterAppState();
}

class _NestedRouterAppState extends State<NestedRouterApp> {
  final BookRouterDelegateNested _routerDelegate = BookRouterDelegateNested();
  final BookRouteInformationParserNested _routeInformationParser =
      BookRouteInformationParserNested();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Books App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
