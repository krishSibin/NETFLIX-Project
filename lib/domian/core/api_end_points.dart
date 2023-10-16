import 'package:netflixproject/core/strings.dart';
import 'package:netflixproject/infrastructure/api_key.dart';

class ApiEndPoints {
  static const apiEndPoints = "$baseUrl/trending/all/day?api_key=$apiKey";
  static const search = "$baseUrl/search/movie?api_key=$apiKey";
  static const hotAndNewComingSoon = '$baseUrl/discover/movie?api_key=$apiKey';
  static const hotAndNewEveryonesWatching =
      '$baseUrl/discover/tv?api_key=$apiKey';
}
