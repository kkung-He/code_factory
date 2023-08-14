import 'package:chapter01_basic_ui/common/const/data.dart';
import 'package:chapter01_basic_ui/restaurant/model/restaurant_model.dart';

class RestaurantDetailModel extends RestaurantModel {
  // 아에 따로 만들수도 있지만, RestaurantDetail 에 똑같은값들이 여러개 존재.
  // 그러므로 extends 사용
  final String detail;
  final List<RestaurantProductModel> products;

  RestaurantDetailModel({
    required super.id,
    required super.name,
    required super.thumbUrl,
    required super.tags,
    required super.priceRange,
    required super.ratings,
    required super.ratingsCount,
    required super.deliveryTime,
    required super.deliveryFee,
    required this.detail,
    required this.products,
  });

// 추가 해야할 값들 detail, products -> 추가 선언 필요
// products 는 해당 모델을 따로 만들기

  factory RestaurantDetailModel.fromJson({
    // json 이라는 이름으로 파라미터를 받아올거임
    // json 은 타입이 보통 Map<String, dynamic> 이다. 리스트 제외.
    required Map<String, dynamic> json,
  }) {
    // 클래스의 인스턴스를 반환
    return RestaurantDetailModel(
      id: json['id'],
      name: json['name'],
      thumbUrl: 'http://$ip${json['thumbUrl']}',
      tags: List<String>.from(json['tags']),
      priceRange: RestaruntPriceRange.values.firstWhere(
        (e) => e.name == json['priceRange'],
      ),
      ratings: json['ratings'],
      ratingsCount: json['ratingsCount'],
      deliveryTime: json['deliveryTime'],
      deliveryFee: json['deliveryFee'],
      detail: json['detail'],
      products: json['products'].map<RestaurantProductModel>(
        (x) => RestaurantProductModel(
          id: x['id'],
          name: x['name'],
          imgUrl: x['imgUrl'],
          detail: x['detail'],
          price: x['price'],
        ),
      ).toList(),
    );
  }
}

class RestaurantProductModel {
  final String id;
  final String name;
  final String imgUrl;
  final String detail;
  final int price;

  RestaurantProductModel({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.detail,
    required this.price,
  });
}
