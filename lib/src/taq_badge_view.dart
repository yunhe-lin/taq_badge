import 'package:flutter/material.dart';
import 'taq_badge_position.dart';
import 'taq_badge_position_view.dart';

class AQBadgeView extends StatelessWidget {

  final int count;
  final TAQPosition position;
  final Color badgeColor;
  final TextStyle style;
  @required
  final WidgetBuilder target;

  AQBadgeView(
    int count, 
    {
      this.target, 
      this.position=TAQPosition.topEnd, 
      this.style = const TextStyle(fontSize: 10, color: Colors.white),
      this.badgeColor: const Color(0xffff3c3c)
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
    double width = 24;
    if (detail.length == 3) {
      width = 36;
    }
    if (detail.length == 2) {
      width = 30;
    }
    Widget view = AQBadgePositionView(
            new Center(
                child: new Container(
                  height: 24,
                  width: width,
                padding: new EdgeInsets.all(3),
                decoration: new BoxDecoration(
                  color: Color(0xffff3c3c),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
                child: new Text(detail, textAlign: TextAlign.center,),
              ),
              ));
    return this.count > 0 ? view : new Container();
  }

  _showText() {
    if (count > 99) {
      return '99+';
    }
    return '$count';
  }
  
}
