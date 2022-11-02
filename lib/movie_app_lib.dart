/// This is the barrel file I created to handle import statements needed
/// all over the app. With this file, I only have to import this one file,
/// and it helps to keep the 'import' sections of files clean.

/// Routes
export 'utils/routes/app_routes.dart';
export 'utils/routes/app_routes_map.dart';

/// App themes
export 'utils/apptheme/app_colors.dart';
export 'utils/apptheme/app_styles.dart';

/// Utility classes
export 'utils/util_functions.dart';
export 'utils/util_widgets.dart';
export 'utils/util_extensions.dart';

/// Data - Model classes for API and Database
export 'models/movie_search.dart';
export 'models/movie.dart';
export 'models/movie_result.dart';
export 'models/movie_upcoming.dart';
export 'models/movie_trending.dart';

/// Data - Network
export 'data/remote_source/movie_api.dart';

/// Data - Database
export 'data/local_source/hive_database.dart';

/// Home Screen
export 'screens/home/home_screen.dart';
export 'screens/home/components/movie_search_delegate.dart';

/// Movies Screen
export 'screens/movies/movies_screen.dart';
export 'screens/movies/components/upcoming_movies_list.dart';
export 'screens/movies/components/trending_movies_list.dart';
export 'screens/movies/components/upcoming_movie_card.dart';
export 'screens/movies/components/trending_movie_card.dart';

/// Movie Favorites Screen
export 'screens/movie_bookmark/movie_bookmark.dart';
export 'screens/movie_bookmark/components/movie_database_list.dart';
export 'screens/movie_bookmark/components/favorite_movie_card.dart';

/// Movie Detail Screen
export 'screens/movie_detail/movie_detail.dart';
export 'screens/movie_detail/components/save_movie.dart';
export 'screens/movie_detail/components/delete_movie.dart';
