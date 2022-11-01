import 'package:movies_app/movies/domain/entities/recommendations.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backDropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String, dynamic> json) {
    return RecommendationModel(
        backDropPath: json['backdrop_path'] ?? '/jsoz1HlxczSuTx0mDl2h0lxy36l.jpg',
        id: json['id']);
  }
}
