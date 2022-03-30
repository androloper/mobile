import 'package:get/get.dart';
import 'package:simple_getx_project/features/detail/index.dart';
import 'package:simple_getx_project/features/home_movie/index.dart';
import 'package:simple_getx_project/features/home_tv/index.dart';
import 'package:simple_getx_project/features/start/index.dart';
import 'package:simple_getx_project/routes/index.dart';

class AppPages {
  static final List<GetPage<dynamic>> routes = <GetPage<dynamic>>[
    GetPage<StartScreen>(
      name: AppRoutes.START,
      page: () => const StartScreen(),
      binding: StartBinding(),
      preventDuplicates: true,
    ),
    GetPage<HomeMovieScreen>(
      name: AppRoutes.HOME_MOVIE,
      page: () => const HomeMovieScreen(),
      transition: Transition.fadeIn,
      binding: HomeMovieBinding(),
      preventDuplicates: true,
    ),
    GetPage<HomeTvScreen>(
      name: AppRoutes.HOME_TV,
      page: () => const HomeTvScreen(),
      transition: Transition.fadeIn,
      binding: HomeTvBinding(),
      preventDuplicates: true,
    ),
    GetPage<DetailScreen>(
      name: AppRoutes.DETAIL,
      page: () => const DetailScreen(),
      transition: Transition.fadeIn,
      binding: DetailPageBinding(),
      preventDuplicates: true,
    ),
  ];
}