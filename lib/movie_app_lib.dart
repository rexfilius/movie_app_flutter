/// This is the barrel file I created to handle import statements needed all
/// over the app. With this file, I only have to import this one file and it
/// helps to keep the 'import' sections of files simple.

/// Routes
export 'app/routes/app_routes.dart';
export 'app/routes/app_routes_map.dart';

/// App themes
export 'app/ui/apptheme/app_colors.dart';
export 'app/ui/apptheme/app_styles.dart';

/// Utility classes
export 'app/utils/util_functions.dart';

/// Data - Network
export 'app/data/network/models/movie_result.dart';
export 'app/data/network/models/movies_upcoming.dart';
export 'app/data/network/models/movies_trending.dart';
export 'app/data/network/api/movie_api.dart';

/// Data - Database
export 'app/data/database/model/movie.dart';
export 'app/data/database/hivedb/hive_database.dart';

/// Home Screen
export 'app/ui/screens/home/home_screen.dart';

/// Movies Screen
export 'app/ui/screens/movies/screens/movies_screen.dart';
export 'app/ui/screens/movies/components/movies_upcoming_builder.dart';
export 'app/ui/screens/movies/components/movies_trending_builder.dart';
export 'app/ui/screens/movies/components/upcoming_movie_card.dart';
export 'app/ui/screens/movies/components/trending_movie_card.dart';

/// Movie Favorites Screen
export 'app/ui/screens/movie_favorite/screens/movie_favorites.dart';
export 'app/ui/screens/movie_favorite/components/movie_database_list.dart';
export 'app/ui/screens/movie_favorite/components/favorite_movie_card.dart';

/// Movie Detail Screen
export 'app/ui/screens/movie_detail/screens/movie_detail.dart';
