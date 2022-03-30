import 'package:flutter/material.dart';
import 'package:simple_getx_project/features/home_movie/index.dart';
import 'package:simple_getx_project/features/widgets/index.dart';
import 'package:simple_getx_project/models/index.dart';
import 'package:get/get.dart';

class NowPlayingMoviesTab extends GetView<NowPlayingMoviesController> {
  const NowPlayingMoviesTab({Key? key}) : super(key: key);

  Future<void> refreshPage() async {}

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return RefreshIndicator(
      onRefresh: refreshPage,
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Center(
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: controller.scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                controller.obx(
                      (MovieWrapper? movieWrapper) {
                    if (movieWrapper != null) {
                      return ProductList(
                        productList: movieWrapper.results,
                        isMovie: true,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}