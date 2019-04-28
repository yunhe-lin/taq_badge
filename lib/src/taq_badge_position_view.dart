import 'package:flutter/material.dart';
import 'package:taq_badge/src/taq_badge_position.dart';

class AQBadgePositionView extends StatelessWidget {

  final TAQPosition position;
  @required
  final Widget badge;

  AQBadgePositionView(this.badge, {this.position = TAQPosition.topEnd}) 
  : assert(badge != null);

  @override
  Widget build(BuildContext context) {
    Positioned p;
    switch(position) {
      case TAQPosition.topStart:
        p =  new Positioned(top: 0, left: 0, child: badge);
        break;
      case TAQPosition.topEnd:
        p =  new Positioned(top: 0, right: 0, child: badge);
        break;
      case TAQPosition.center:
        p =  new Positioned(child: badge);
        break;
      case TAQPosition.bottomStart:
        p =  new Positioned(bottom: 0, left: 0, child: badge);
        break;
      case TAQPosition.bottomEnd:
        p =  new Positioned(bottom: 0, right: 0, child: badge);
        break;
    }
    return Container(child: p);
  }
}