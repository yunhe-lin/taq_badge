import 'package:flutter/material.dart';
import 'taq_badge_position.dart';
import 'taq_badge_position_view.dart';

class AQBadgeView extends StatelessWidget {

  final int count;
  final TAQPosition position;
  final Color badgeColor;
  final TextStyle style;
  final EdgeInsets padding;
  @required
  final WidgetBuilder target;

  AQBadgeView(
    int count, 
    {
      this.target, 
      this.position=TAQPosition.topEnd, 
      this.style = const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
      this.badgeColor: const Color(0xE5ff3c3c),
      this.padding = const EdgeInsets.fromLTRB(5, 0, 5, 0)
    }
  ) : this.count = count < 0 ? 0 : count;

  @override
  Widget build(BuildContext context) {
    return _getBadgeView(context);
  }

  _getBadgeView(BuildContext context) {
    return new Container(
      child: Stack(
        overflow: Overflow.visible,
        alignment: AlignmentDirectional.center,
        
        children: <Widget>[
          this.target(context),
          _badgeDetailView()
        ],
      ),
    );
  }

  _badgeDetailView() {
    String detail = _showText();
    double width = 16;
    if (detail.length == 3) {
      width = 24;
    }
    if (detail.length == 2) {
      width = 19;
    }
    Widget view = AQBadgePositionView(
            new Center(
                child: new Container(
                  height: 16,
                  width: width,
                  margin: EdgeInsets.all(3),
                decoration: new BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: new Text(detail, textAlign: TextAlign.center, style: this.style,)
                )
              ),
              ),
              padding: this.padding,);
    return this.count > 0 ? view : new Container();
  }

  _showText() {
    if (count > 99) {
      return '99+';
    }
    return '$count';
  }
  
}
