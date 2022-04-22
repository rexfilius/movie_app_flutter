import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: AppColors.white,
            ),
            onPressed: () async {
              showSearch(
                context: context,
                delegate: MovieSearchDelegate(),
              );
            },
          ),
        ],
        backgroundColor: AppColors.black,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Movies',
                style: AppStyles.movieTitleText,
              ),
            ),
            Tab(
              child: Text(
                'My List',
                style: AppStyles.movieTitleText,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          MoviesScreen(),
          MovieFavoritesScreen(),
        ],
      ),
    );
  }
}
