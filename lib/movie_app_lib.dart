/// This is the barrel file created to handle import statements needed all
/// over the app. With this file, you only have to import this one file and it
/// helps to keep the 'import' sections of files simple.

/// App themes
export 'app/ui/apptheme/app_colors.dart';
export 'app/ui/apptheme/app_styles.dart';

/// Utility classes
export 'app/utils/util_functions.dart';
export 'app/utils/util_extensions.dart';
export 'app/utils/util_widgets.dart';

/// Classes related to the State Management library - GetX
export 'app/state_management/controllers/upcoming_movie_controller.dart';
export 'app/state_management/controllers/trending_movie_controller.dart';
export 'app/state_management/controllers/home_tab_controller.dart';
export 'app/state_management/controllers/movie_search_controller.dart';
export 'app/state_management/routes/app_routes.dart';
export 'app/state_management/routes/app_pages.dart';

/// Data - Network
export 'app/data/network/models/movie_result.dart';
export 'app/data/network/models/movies_upcoming.dart';
export 'app/data/network/models/movies_trending.dart';
export 'app/data/network/models/movies_search.dart';
export 'app/data/network/api/movie_api.dart';

/// Data - Database
export 'app/data/database/model/movie.dart';
export 'app/data/database/hivedb/hive_database.dart';

/// Home Screen
export 'app/ui/screens/home/screens/home_screen.dart';
export 'app/ui/screens/home/components/movie_search_delegate.dart';
export 'app/ui/screens/home/components/movie_search_delegate2.dart';

/// Movies Screen
export 'app/ui/screens/movies/screens/movies_screen.dart';
export 'app/ui/screens/movies/components/upcoming_movies_list.dart';
export 'app/ui/screens/movies/components/trending_movies_list.dart';
export 'app/ui/screens/movies/components/upcoming_movie_card.dart';
export 'app/ui/screens/movies/components/trending_movie_card.dart';

/// Movie Favorites Screen
export 'app/ui/screens/movie_favorite/screens/movie_favorites.dart';
export 'app/ui/screens/movie_favorite/components/movie_database_list.dart';
export 'app/ui/screens/movie_favorite/components/favorite_movie_card.dart';

/// Movie Detail Screen
export 'app/ui/screens/movie_detail/screens/movie_detail.dart';
export 'app/ui/screens/movie_detail/components/save_movie.dart';
export 'app/ui/screens/movie_detail/components/delete_movie.dart';
