/// This is the barrel file I created to handle import statements needed
/// all over the app. With this file, I only have to import this one file,
/// and it helps to keep the 'import' sections of files clean.

/// Utility classes
export 'src/utils/app_routes.dart';
export 'src/utils/util_functions.dart';
export 'src/utils/util_extensions.dart';
export 'src/utils/app_colors.dart';
export 'src/utils/app_styles.dart';
export 'src/utils/animation/animate_now_showing_list.dart';
export 'src/utils/animation/animate_movie_summary_list.dart';
export 'src/utils/animation/custom_splash_animation.dart';
export 'src/utils/animation/shimmer_animation.dart';
export 'src/utils/animation/shimmer_animator.dart';
export 'src/utils/animation/animate_tv_show_summary_list.dart';

/// Widgets used at different parts of the UI
export 'src/screens/widgets/util_widgets.dart';
export 'src/screens/widgets/card_now_showing.dart';
export 'src/screens/widgets/card_now_showing_tv.dart';
export 'src/screens/widgets/more_options_card.dart';
export 'src/screens/widgets/card_movie_summary.dart';
export 'src/screens/widgets/card_tv_show_summary.dart';
export 'src/screens/widgets/generic_dialog.dart';
export 'src/screens/widgets/card_movie_entity_summary.dart';
export 'src/screens/widgets/card_tv_show_entity_summary.dart';
export 'src/screens/widgets/card_explore.dart';

/// Model classes
export 'src/models/entity_movie.dart';
export 'src/models/entity_tv_show.dart';
export 'src/models/movie_search.dart';
export 'src/models/movie_result.dart';
export 'src/models/movie_upcoming.dart';
export 'src/models/movie_trending.dart';
export 'src/models/movie_now_playing.dart';
export 'src/models/movie_popular.dart';
export 'src/models/movie_top_rated.dart';
export 'src/models/tv_result.dart';
export 'src/models/tv_show_on_the_air.dart';
export 'src/models/tv_show_popular.dart';

/// Data Sources - API and local database
export 'src/data/remote_source/movie_api.dart';
export 'src/data/remote_source/tv_show_api.dart';
export 'src/data/local_source/hive_database.dart';

/// Screens
export 'src/screens/home/screen_home.dart';
export 'src/screens/home/movie_search_delegate.dart';
export 'src/screens/movies/screen_movie.dart';
export 'src/screens/movies/screen_movie_popular.dart';
export 'src/screens/movies/screen_movie_top_rated.dart';
export 'src/screens/movies/screen_movie_trending.dart';
export 'src/screens/movies/screen_movie_upcoming.dart';
export 'src/screens/movies/screen_movie_detail.dart';
export 'src/screens/tv_show/screen_tv_show_popular.dart';
export 'src/screens/tv_show/screen_tv_show_detail.dart';
export 'src/screens/tv_show/screen_tv_show_on_the_air.dart';
export 'src/screens/explore/screen_explore.dart';
export 'src/screens/explore/screen_bookmark_movie.dart';
export 'src/screens/explore/screen_bookmark_tv_show.dart';
