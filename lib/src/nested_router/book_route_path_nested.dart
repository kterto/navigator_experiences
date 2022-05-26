// Routes
abstract class BookRoutePathNested {}

class BooksListPath extends BookRoutePathNested {}

class BooksSettingsPath extends BookRoutePathNested {}

class BooksDetailsPath extends BookRoutePathNested {
  final int id;

  BooksDetailsPath(this.id);
}
