// 모델로 받아온 json  / map 의 값들을 클래스의 인스턴스로 반환해주는 작업은 무조건 !! 해야하는 작업이다. -> 반복 작업
import '../../common/const/data.dart';

enum RestaruntPriceRange {
  expensive,
  medium,
  cheap,
}

class RestaurantModel {
  final String id;
  final String name;
  final String thumbUrl;
  final List<String> tags;
  final RestaruntPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson({
    // json 이라는 이름으로 파라미터를 받아올거임
    // json 은 타입이 보통 Map<String, dynamic> 이다. 리스트 제외.
    required Map<String, dynamic> json,
  }) {
    // 클래스의 인스턴스를 반환
    return RestaurantModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json['tags']),
      priceRange: RestaruntPriceRange.values.firstWhere((e) =>
      e.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
    );
  }
}
