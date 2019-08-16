import 'package:flutter/material.dart';
import 'package:taq_badge/src/taq_badge_position.dart';

class AQBadgePositionView extends StatelessWidget {

  final TAQPosition position;
  final EdgeInsets padding;

  @required
  final Widget badge;

  AQBadgePositionView(this.badge, {this.position = TAQPosition.topEnd, this.padding = const EdgeInsets.all(0)}) 
  : assert(badge != null);

  @override
  Widget build(BuildContext context) {
    Positioned p;
    switch(position) {
      case TAQPosition.topStart:
        p =  new Positioned(top: this.padding.top, left: this.padding.left, child: badge);
        break;
      case TAQPosition.topEnd:
        p =  new Positioned(top: this.padding.top, right: this.padding.right, child: badge);
        break;
      case TAQPosition.center:
        p =  new Positioned(child: badge);
        break;
      case TAQPosition.bottomStart:
        p =  new Positioned(bottom: this.padding.bottom, left: this.padding.left, child: badge);
        break;
      case TAQPosition.bottomEnd:
        p =  new Positioned(bottom: this.padding.bottom, right: this.padding.right, child: badge);
        break;
    }
    return Container(child: p);
  }
}