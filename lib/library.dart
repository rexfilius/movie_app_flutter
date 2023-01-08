/// This is the barrel file I created to handle import statements needed
/// all over the app. With this file, I only have to import this one file,
/// and it helps to keep the 'import' sections of files clean.

/// Utility classes
export 'utils/app_routes.dart';
export 'utils/util_functions.dart';
export 'utils/util_extensions.dart';
export 'utils/app_colors.dart';
export 'utils/app_styles.dart';

/// Widgets used at different parts of the UI
export 'screens/widgets/util_widgets.dart';
export 'screens/widgets/card_now_showing.dart';
export 'screens/widgets/card_now_showing_tv.dart';
export 'screens/widgets/more_options_card.dart';
export 'screens/widgets/card_movie_summary.dart';
export 'screens/widgets/card_tv_show_summary.dart';
export 'screens/widgets/card_tv_show_trending_summary.dart';
export 'screens/widgets/generic_dialog.dart';
export 'screens/widgets/card_movie_entity_summary.dart';
export 'screens/widgets/card_tv_show_entity_summary.dart';

/// Model classes
export 'models/entity_movie.dart';
export 'models/entity_tv_show.dart';
export 'models/movie_search.dart';
export 'models/movie_result.dart';
export 'models/movie_upcoming.dart';
export 'models/movie_trending.dart';
export 'models/movie_now_playing.dart';
export 'models/movie_popular.dart';
export 'models/movie_top_rated.dart';
export 'models/tv_result.dart';
export 'models/tv_show_on_the_air.dart';
export 'models/tv_show_popular.dart';
export 'models/tv_show_top_rated.dart';
export 'models/tv_show_trending.dart';
export 'models/tv_trending_result.dart';
export 'models/tv_show_result.dart';

/// Data Sources - API and local database
export 'data/remote_source/movie_api.dart';
export 'data/remote_source/tv_show_api.dart';
export 'data/local_source/hive_database.dart';

/// Screens
export 'screens/home/screen_home.dart';
export 'screens/home/movie_search_delegate.dart';
export 'screens/movies/screen_movie.dart';
export 'screens/movies/screen_movie_popular.dart';
export 'screens/movies/screen_movie_top_rated.dart';
export 'screens/movies/screen_movie_trending.dart';
export 'screens/movies/screen_movie_upcoming.dart';
export 'screens/movies/screen_movie_detail.dart';
export 'screens/tv_show/screen_tv_show.dart';
export 'screens/tv_show/screen_tv_show_popular.dart';
export 'screens/tv_show/screen_tv_show_top_rated.dart';
export 'screens/tv_show/screen_tv_show_trending.dart';
export 'screens/tv_show/screen_tv_show_detail.dart';
export 'screens/explore/screen_explore.dart';
export 'screens/explore/screen_bookmark_movie.dart';
export 'screens/explore/screen_bookmark_tv_show.dart';
