import 'package:dokan/utils/appearance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableList extends StatefulWidget {
  const ExpandableList({Key? key, required this.items}) : super(key: key);

  final List<ExpandListViewItem> items;

  @override
  _ExpandableListState createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList>
    with SingleTickerProviderStateMixin {
  int _inx = -1;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    super.initState();
  }

  onExpend(index) {
    if (_controller.isAnimating) return;
    if (_controller.isCompleted) {
      _controller.reverse().then((value) => setState(() {
            _inx = -1;
          }));
      return;
    }
    setState(() {
      _inx = index;
      _controller.forward();
    });
  }

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
          return Column(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: MyColors.filedIcon,
                  splashFactory: NoSplash.splashFactory,
                ),
                onPressed: () => onExpend(index),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Row(
                          children: [
                            Image.asset(
                              item.leadingIcon,
                              width: 28,
                              height: 28,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Flexible(
                                child: Text(
                              item.tabTitle,
                              style: textTheme.headline6,
                            )),
                          ],
                        )),
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 24,
                    ),
                  ],
                ),
              ),
              SizeTransition(
                sizeFactor: _animation,
                child: _inx == index ? item.item : SizedBox(),
              ),
              (index != widget.items.length - 1)
                  ? Divider(
                      color: MyColors.textHint.shade200,
                      indent: 10,
                      endIndent: 10,
                      thickness: 2,
                    )
                  : SizedBox()
            ],
          );
        },
      ),
    );
  }
}

class ExpandListViewItem {
  final Widget item;
  final String tabTitle;
  final String leadingIcon;

  ExpandListViewItem(
      {required this.item,
      required this.tabTitle,
      this.leadingIcon = "assets/imgs/user_ic.png"});
}
