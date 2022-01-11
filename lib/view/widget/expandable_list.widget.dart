import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  ExpandableList({Key? key}) : super(key: key);

  List<ExpandListViewItem> items = [
    ExpandListViewItem(
        item: _getWidget("text 1"), tabTitle: "Tab 1", leadingIcon: Icons.menu),
    ExpandListViewItem(
        item: _getWidget("text 2"),
        tabTitle: "Tab 2",
        leadingIcon: Icons.translate),
  ];

  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> {
  int _inx = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return GestureDetector(
            onTap: () {
              if (_inx == index) {
                setState(() {
                  _inx = -1;
                });
                return;
              }
              setState(() {
                _inx = index;
              });
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      item.leadingIcon,
                      size: 22,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      item.tabTitle,
                      style: textTheme.headline6,
                    ),
                  ],
                ),
                /*SizeTransition(
                  sizeFactor: _controller,
                  child: item.item,
                )*/
                ExpandableContainer(
                  child: item.item,
                  expanded: (_inx == index),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      child: child,
    );
  }
}

Widget _getWidget(text) {
  return Container(
    padding: EdgeInsets.all(10),
    alignment: Alignment.center,
    child: Text(text),
  );
}

class ExpandListViewItem {
  final Widget item;
  final String tabTitle;
  IconData? leadingIcon = Icons.menu;
  bool _isExpanded = false;

  ExpandListViewItem(
      {required this.item, required this.tabTitle, this.leadingIcon});
}
