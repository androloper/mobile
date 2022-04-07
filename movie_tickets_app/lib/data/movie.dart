import 'package:flutter/material.dart';
import 'movie_cast.dart';

class Movie {
  int? id;
  String? name;
  List<String>? genre;
  double? rating;
  String? storyLine;
  Image? image;
  Image? imageText;
  String? videoClipPath;
  String? videoClipReflectionPath;
  List<MovieCast>? castList = [];

  Movie(
      {this.id,
        this.genre,
        this.name,
        this.rating,
        this.storyLine,
        this.image,
        this.imageText,
        this.castList,
        this.videoClipPath,
        this.videoClipReflectionPath});
}