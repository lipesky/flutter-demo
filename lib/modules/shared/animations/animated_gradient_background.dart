import 'package:flutter/material.dart';

class AnimatedGradientBackground extends StatefulWidget {

  final Widget? child;

  const AnimatedGradientBackground({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  _AnimateGradientdBackgroundState createState() => _AnimateGradientdBackgroundState();
}

class _AnimateGradientdBackgroundState extends State<AnimatedGradientBackground>  with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late List<Color> colors = List.from([
    Colors.red, 
    Colors.yellow.shade200,
    Colors.blue, 
  ]);
  //Animation<Color> colorsAnimation = ColorTween();
  late Animation<double> firstColorBreakpoint;
  late List<Color> _colors;
  late List<double> bps;
  @override
  void initState(){
    this._colors = this.colors.map((e) => [e, e, e]).reduce((a, b) => a + b).toList()..removeLast()..removeAt(0);
    this.bps = this.genBps(this._colors.length);
    this.controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    this.firstColorBreakpoint = Tween<double>(begin: 0.5, end: 0).animate(controller)
    ..addListener(() => setState(() {}))
    ..addStatusListener((status) {
      if(this.firstColorBreakpoint.value == 0){
        this.colors = this.colors..add(this.colors.removeAt(0));
        this.controller
          ..reset()
          ..forward();
      }
    });
    this.controller.forward();
    super.initState();
  }

  List<double> genBps(int len){
    List<double> result = [];
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final double firstBp = this.firstColorBreakpoint.value;
    const width = 0.2;
    //print(_colors);
    ///print(bps);
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [...this.colors, this.colors.first],
          stops: [0, firstBp, firstBp + 0.5, 1],
        ),
      ),
      child: this.widget.child,
    );
  }
}