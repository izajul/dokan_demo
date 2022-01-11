import 'package:dokan/utils/appearance.dart';
import 'package:dokan/view/screens/home.screen.dart';
import 'package:dokan/view/screens/profile.screen.dart';
import 'package:dokan/view/widget/custom_shape.widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const routeName = "/home";
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _myPage = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _myPage,
          onPageChanged: (inx) {
            setState(() {
              _currentPage = inx;
            });
          },
          children: [HomeScreen(), Profile()],
        ),
      ),

      floatingActionButton: Transform.translate(
        offset: Offset(0, 6),
        child: SizedBox(
          width: 60,
          height: 60,
          child: FloatingActionButton(
            //Floating action button on Scaffold
            elevation: 3,

            backgroundColor: MyColors.primaryAccent,
            onPressed: () {
              //code to execute on button press
            },
            child: const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 30,
            ), //icon inside button
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: BottomAppBar(
        //bottom navigation bar on scaffold
        elevation: 0,
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        notchMargin:
            0, //notche margin between floating button and bottom appbar
        child: Container(
          height: 65,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: BottomAppBarBorderShape(),
            shadows: const [
              BoxShadow(color: MyColors.shadow, blurRadius: 20, spreadRadius: 0)
            ],
          ),
          child: Row(
            //children inside bottom appbar
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Image.asset(
                  "assets/imgs/home_ic.png",
                  width: 25,
                  height: 25,
                  color: _currentPage == 0 ? MyColors.primary : null,
                ),
                onPressed: () {
                  _myPage.jumpToPage(0);
                },
              ),
              IconButton(
                icon: Image.asset(
                  "assets/imgs/category_ic.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {},
              ),
              SizedBox(),
              IconButton(
                icon: Image.asset(
                  "assets/imgs/cart_ic.png",
                  width: 25,
                  height: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Image.asset("assets/imgs/user_ic.png",
                    width: 25,
                    height: 25,
                    color: _currentPage == 1 ? MyColors.primary : null),
                onPressed: () {
                  _myPage.jumpToPage(1);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
