import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class ExpandableCard extends StatelessWidget {
  final String header;
  final List<Widget> children;
  final Color? color;

  const ExpandableCard({
    Key? key,
    required this.header,
    required this.children,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      padding: EdgeInsets.zero,
      color: color,
      child: ExpandableNotifier(
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
          ),
          header: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kMargin * 1.5,
              horizontal: kMargin,
            ),
            child: Text(
              header,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          collapsed: const SizedBox.shrink(),
          expanded: Padding(
            padding: const EdgeInsets.fromLTRB(kMargin, 0, kMargin, kMargin),
            child: MyListView(
              shrinkwrap: true,
              physics: const ScrollPhysics(),
              children: [
                const VerticalPadding(size: PaddingSize.small),
                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}