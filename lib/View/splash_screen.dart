import 'dart:async';
import 'package:covid_app/View/world_state_screen.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late final AnimationController _controller =AnimationController(
    vsync: this,
    duration:const Duration(seconds: 3))..repeat();
  @override
  void initState() {
    Timer(const Duration(seconds: 3),
     ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>const WorldStateScreen())));
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
          const  SizedBox(
             height: 200,
             width: 200,
             child: Center(child: Image(image: AssetImage('images/virus.png')),),

            ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context,Widget? child) 
            {
              return Transform.rotate(
                angle: _controller.value*2.0*math.pi,
                child: child,
              );
            }),
            SizedBox(height: MediaQuery.of(context).size.height*.08,),
            const Align(
              alignment: Alignment.center,
              child: Text('Covid 19\nTracker App',
              textAlign: TextAlign.center,
               style: TextStyle(
               fontSize: 25,
               fontWeight: FontWeight.bold),),
            ),

          ],
        ),
      ),
    );
  }
}
