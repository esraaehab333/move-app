import 'package:move_app/movies/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.voteAverage,
      required super.relaesDate});
  factory MovieModel.fromjson(Map<String, dynamic> json) => MovieModel(
      id: json["id"],
      title: json["title"],
      backdropPath: json["backdrop_path"],
      genreIds: List<int>.from(json["genre_ids"].map((e) => e)),
      overview: json["overview"],
      voteAverage: json["vote_average"],
      relaesDate: json["release_date"]);
}
