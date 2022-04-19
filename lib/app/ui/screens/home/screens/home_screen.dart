import 'package:flutter/material.dart';
import 'package:movie_app_flutter/movie_app_lib.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _homeTabController = Get.put(HomeTabController());

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
          controller: _homeTabController.tabController,
          tabs: const <Widget>[
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
        controller: _homeTabController.tabController,
        children: const <Widget>[
          MoviesScreen(),
          MovieFavoritesScreen(),
        ],
      ),
    );
  }
}
