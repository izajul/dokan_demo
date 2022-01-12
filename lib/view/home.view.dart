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

const Icon _searchIc = Icon(
  Icons.search,
  size: 28,
);

const _appTitle = Text(
  "Product List",
  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
);

class _HomeState extends State<Home> {
  Widget appBarTitle = _appTitle;
  Icon actionIcon = _searchIc;

  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  bool _IsSearching = false;
  String _searchText = "";

  final PageController _myPage = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentPage == 0 ? buildBar(context) : null,
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

  buildBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: appBarTitle,
      actions: <Widget>[
        IconButton(
          padding: const EdgeInsets.all(0),
          icon: actionIcon,
          onPressed: () {
            setState(() {
              if (actionIcon.icon == Icons.search) {
                actionIcon = const Icon(
                  Icons.close,
                );
                appBarTitle = TextField(
                  controller: _searchQuery,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: MyColors.textDark),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search Product",
                  ),
                );
                _handleSearchStart();
              } else {
                _handleSearchEnd();
              }
            });
          },
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      actionIcon = _searchIc;
      _IsSearching = false;
      _searchQuery.clear();
      appBarTitle = _appTitle;
    });
  }
}
