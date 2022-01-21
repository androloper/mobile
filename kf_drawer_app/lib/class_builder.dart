import 'package:kf_drawer_app/fifth_page.dart';
import 'package:kf_drawer_app/first_page.dart';
import 'package:kf_drawer_app/fourth_page.dart';
import 'package:kf_drawer_app/second_page.dart';
import 'package:kf_drawer_app/seventh_page.dart';
import 'package:kf_drawer_app/sixth_page.dart';
import 'package:kf_drawer_app/third_page.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor as Constructor<Object>;
}

class ClassBuilder {
  static void registerClasses() {
    register<FirstPage>(() => FirstPage());
    register<SecondPage>(() => SecondPage());
    register<ThirdPage>(() => ThirdPage());
    register<FourthPage>(() => FourthPage());
    register<FifthPage>(() => FifthPage());
    register<SixthPage>(() => SixthPage());
    register<SeventhPage>(() => SeventhPage());
  }

  static dynamic fromString(String type) {
    if (_constructors[type] != null) return _constructors[type]!();
  }
}