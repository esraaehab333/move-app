class AppConstances {
  static const String basurl = "https://api.themoviedb.org/3/";
  static const String apiKey = "ce8786bc57ceba7a6510bb73fe732506";
  static const String nowPlayingMoviePath =
      "$basurl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath =
      "$basurl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviePath =
      "$basurl/movie/top_rated?api_key=$apiKey";
}
