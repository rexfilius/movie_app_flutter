/// This is the barrel file I created to handle import statements needed all
/// over the app. With this file, I only have to import this one file and it
/// helps to keep the 'import' sections of files simple.

/// Routes
export 'private/routes/app_routes.dart';
export 'private/routes/app_routes_map.dart';

/// App themes
export 'private/ui/apptheme/app_colors.dart';
export 'private/ui/apptheme/app_styles.dart';

/// Utility classes
export 'private/utils/util_functions.dart';
export 'private/utils/util_widgets.dart';
export 'private/utils/util_extensions.dart';

/// Data - Network
export 'private/data/network/models/movie_result.dart';
export 'private/data/network/models/movies_upcoming.dart';
export 'private/data/network/models/movies_trending.dart';
export 'private/data/network/models/movies_search.dart';
export 'private/data/network/api/movie_api.dart';

/// Data - Database
export 'private/data/database/model/movie.dart';
export 'private/data/database/hivedb/hive_database.dart';

/// Home Screen
export 'private/ui/screens/home/screens/home_screen.dart';
export 'private/ui/screens/home/components/movie_search_delegate.dart';

/// Movies Screen
export 'private/ui/screens/movies/screens/movies_screen.dart';
export 'private/ui/screens/movies/components/upcoming_movies_list.dart';
export 'private/ui/screens/movies/components/trending_movies_list.dart';
export 'private/ui/screens/movies/components/upcoming_movie_card.dart';
export 'private/ui/screens/movies/components/trending_movie_card.dart';

/// Movie Favorites Screen
export 'private/ui/screens/movie_favorite/screens/movie_favorites.dart';
export 'private/ui/screens/movie_favorite/components/movie_database_list.dart';
export 'private/ui/screens/movie_favorite/components/favorite_movie_card.dart';

/// Movie Detail Screen
export 'private/ui/screens/movie_detail/screens/movie_detail.dart';
export 'private/ui/screens/movie_detail/components/save_movie.dart';
export 'private/ui/screens/movie_detail/components/delete_movie.dart';
