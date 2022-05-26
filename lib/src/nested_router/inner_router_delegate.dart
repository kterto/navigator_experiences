import 'package:flutter/material.dart';
import 'package:navigator_experiences/src/models/book.dart';
import 'package:navigator_experiences/src/nested_router/book_app_state.dart';
import 'package:navigator_experiences/src/nested_router/book_route_path_nested.dart';
import 'package:navigator_experiences/src/pages/book_details_screen.dart';
import 'package:navigator_experiences/src/pages/books_list_screen.dart';
import 'package:navigator_experiences/src/pages/fade_animation_page.dart';
import 'package:navigator_experiences/src/pages/settings_screen.dart';

class InnerRouterDelegate extends RouterDelegate<BookRoutePathNested>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<BookRoutePathNested> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  BooksAppState get appState => _appState;
  BooksAppState _appState;
  set appState(BooksAppState value) {
    if (value == _appState) {
      return;
    }
    _appState = value;
    notifyListeners();
  }

  InnerRouterDelegate(this._appState);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (appState.selectedIndex == 0) ...[
          FadeAnimationPage(
            child: BooksListScreen(
              books: appState.books,
              onTapped: _handleBookTapped,
            ),
            key: const ValueKey('BooksListPage'),
          ),
          if (appState.selectedBook != null)
            MaterialPage(
              key: ValueKey(appState.selectedBook),
              child: BookDetailsScreen(book: appState.selectedBook!),
            ),
        ] else
          const FadeAnimationPage(
            child: SettingsScreen(),
            key: ValueKey('SettingsPage'),
          ),
      ],
      onPopPage: (route, result) {
        appState.selectedBook = null;
        notifyListeners();
        return route.didPop(result);
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BookRoutePathNested configuration) async {
    // This is not required for inner router delegate because it does not
    // parse route
    assert(false);
  }

  void _handleBookTapped(Book book) {
    appState.selectedBook = book;
    notifyListeners();
  }
}
