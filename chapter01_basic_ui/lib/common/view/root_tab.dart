import 'package:chapter01_basic_ui/common/const/colors.dart';
import 'package:chapter01_basic_ui/common/layout/default_layout.dart';
import 'package:chapter01_basic_ui/restaurant/view/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  int index = 0;
  late TabController tabController;

  // late : 나중에 이 값 입력 할건데 이 값을 부를때는 이 값이 선언이 되어 있을거야!
  // initState에서 바로 선언 하므로 late 키워드 사용 가능.
  // 그냥 nullable로 하면 이 controller를 사용할 때마다 널 처리 해줘야 함.

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    // vsync : 렌더링 위젯 , this 사용을 위해서는 with SingleTickerProviderStateMixin 필요
    tabController.addListener(tabListener);
  }

  @override
  void dispose() {
    tabController.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(() {
      // tab 바뀔때마다 현재 탭을 넣어줌
      index = tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '코팩 딜리버리',
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          RestaurantScreen(),
          Center(
              child: Container(
            child: Text('음식'),
          )),
          Center(
              child: Container(
            child: Text('주문'),
          )),
          Center(
              child: Container(
            child: Text('프로필'),
          )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: PRIMARY_COLOR,
        unselectedItemColor: BODY_TEXT_COLOR,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          tabController.animateTo(index);
        },
        currentIndex: index,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_outlined),
            label: '음식',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_outlined),
            label: '주문',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: '프로필',
          ),
        ],
      ),
    );
  }
}
