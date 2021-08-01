import 'package:flutter/material.dart';
import '../../widgets/widget.dart';

class Markets extends StatefulWidget {
  final bool isCollapsed;
  final Duration duration;
  final Animation<double> scaleAnimation;
  final Function menuOpen;
  const Markets(
      {Key key,
      this.isCollapsed,
      this.duration,
      this.scaleAnimation,
      this.menuOpen})
      : super(key: key);

  @override
  _MarketsState createState() => _MarketsState();
}

class _MarketsState extends State<Markets> {
  double screenWidth;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return AnimatedPositioned(
      duration: widget.duration,
      top: 0,
      bottom: 0,
      left: widget.isCollapsed ? 0 : 0.45 * screenWidth,
      right: widget.isCollapsed ? 0 : -0.55 * screenWidth,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Material(
          animationDuration: widget.duration,
          borderRadius: widget.isCollapsed ? null : BorderRadius.circular(20),
          elevation: 8,
          color: Color(0xffF6F6F9),
          child: Container(
            child: Column(
              children: [
                MyAppBar(
                  isCollapsed: widget.isCollapsed,
                  menuOpen: widget.menuOpen,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "Mağazalar Sehifesi",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
