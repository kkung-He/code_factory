import 'package:chapter01_basic_ui/common/const/data.dart';
import 'package:chapter01_basic_ui/restaurant/model/restaurant_model.dart';
import 'package:chapter01_basic_ui/restaurant/component/restaurant_card.dart';
import 'package:chapter01_basic_ui/restaurant/view/restaurant_detail_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  Future<List> paginateRestaurant() async {
    final dio = Dio();

    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);

    final resp = await dio.get(
      'http://$ip/restaurant',
      options: Options(
        headers: {
          'authorization': 'Bearer $accessToken',
        },
      ),
    );

    return resp.data['data'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List>(
              future: paginateRestaurant(),
              builder: (context, AsyncSnapshot<List> snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, index) {
                    final item = snapshot.data![index];
                    // parsed : 변환됐다.
                    final pItem = RestaurantModel.fromJson(json: item);
                    // final pItem = RestaurantModel(
                    //   id: item['id'],
                    //   name: item['name'],
                    //   thumbUrl: 'http://$ip${item['thumbUrl']}',
                    //   tags: List<String>.from(item['tags']),
                    //   priceRange: RestaruntPriceRange.values.firstWhere((e) =>
                    //   e.name == item['priceRange'],
                    //   ),
                    //   ratings: item['ratings'],
                    //   ratingsCount: item['ratingsCount'],
                    //   deliveryTime: item['deliveryTime'],
                    //   deliveryFee: item['deliveryFee'],
                    // );
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RestaurantDetailScreen(
                              id: pItem.id,
                            ),
                          ),
                        );
                      },
                      child: RestaurantCard.fromRestaurantModel(
                        model: pItem,
                      ),
                    );
                  },
                  separatorBuilder: (_, index) {
                    return SizedBox(
                      height: 10.0,
                    );
                  },
                );
              },
            )),
      ),
    );
  }
}
