import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';
import '../langauge.dart';


 // Import your main screen

// class SplashScreen extends StatefulWidget {
  

//   SplashScreen({super.key });
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Navigate to the main screen after 3 seconds
// //     Future.delayed( const Duration(seconds: 3), () {
// //       Navigator.of(context).pushReplacement(
// //         MaterialPageRoute(builder: (_) => Login()),
// //       );
// //     });
// //   }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
 
//   @override
// /*************  ✨ Codeium Command ⭐  *************/
//   /// Initializes the state of the [SplashScreen].
//   ///
//   /// This method is responsible for:
//   ///
//   /// 1. Initializing the animation controller with a duration of 3 seconds.
//   /// 2. Defining a tween animation that starts from 0.0 and ends at 1.0.
//   /// 3. Starting the animation by calling [_controller.forward].
//   /// 4. Scheduling a timer that will trigger after 3 seconds and navigate to the
//   ///    [widget] by calling [Navigator.of(context).pushReplacement].
//   ///
//   /// This method is called when the [SplashScreen] is inserted into the tree.
// /******  50cce340-2efb-40c0-bac7-e2de93686771  *******/
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward();

//     Future.delayed(Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) =>  Login()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Image.asset(ImageAsset.fristpage,height: 380,width: 200,)
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.green, // Set your background color
  //     body: Center(
  //       child:Image.asset(ImageAsset.fristpage,height: 380,width: 200,)
  //     ),
  //   );
  // }

//=================== animation in splashscreen

// class SplashScreen extends StatefulWidget {
//   Widget screen;

//   SplashScreen({super.key ,required this.screen});
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// // class _SplashScreenState extends State<SplashScreen> {
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Navigate to the main screen after 3 seconds
// //     Future.delayed( const Duration(seconds: 3), () {
// //       Navigator.of(context).pushReplacement(
// //         MaterialPageRoute(builder: (_) => Login()),
// //       );
// //     });
// //   }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
 
//   @override
// /*************  ✨ Codeium Command ⭐  *************/
//   /// Initializes the state of the [SplashScreen].
//   ///
//   /// This method is responsible for:
//   ///
//   /// 1. Initializing the animation controller with a duration of 3 seconds.
//   /// 2. Defining a tween animation that starts from 0.0 and ends at 1.0.
//   /// 3. Starting the animation by calling [_controller.forward].
//   /// 4. Scheduling a timer that will trigger after 3 seconds and navigate to the
//   ///    [widget] by calling [Navigator.of(context).pushReplacement].
//   ///
//   /// This method is called when the [SplashScreen] is inserted into the tree.
// /******  50cce340-2efb-40c0-bac7-e2de93686771  *******/
// void pushReplacementScreen( Widget screen) {
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(builder: (context) => screen),
//   );
// }
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       duration: Duration(seconds: 3),
//       vsync: this,
//     );
//     _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
//     _controller.forward();

//     Future.delayed(Duration(seconds: 3), ( ) {
//       pushReplacementScreen(widget. screen);
//       // Navigator.of(context).pushReplacement(
//       //   MaterialPageRoute(builder: (_) =>  Login()),
//       // );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Image.asset(ImageAsset.one,height: 380,width: 200,)
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
//==================

class SplashScreen extends StatefulWidget {
  // Widget screen;

  SplashScreen({super.key 
  
  // ,required this.screen
  });
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to the main screen after 3 seconds
//     Future.delayed( const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => Login()),
//       );
//     });
//   }

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
 
  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Initializes the state of the [SplashScreen].
  ///
  /// This method is responsible for:
  ///
  /// 1. Initializing the animation controller with a duration of 3 seconds.
  /// 2. Defining a tween animation that starts from 0.0 and ends at 1.0.
  /// 3. Starting the animation by calling [_controller.forward].
  /// 4. Scheduling a timer that will trigger after 3 seconds and navigate to the
  ///    [widget] by calling [Navigator.of(context).pushReplacement].
  ///
  /// This method is called when the [SplashScreen] is inserted into the tree.
/******  50cce340-2efb-40c0-bac7-e2de93686771  *******/
void pushReplacementScreen( Widget screen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();

    Future.delayed(Duration(seconds: 3), ( ) {
      // pushReplacementScreen(widget. screen);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) =>  Language()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Image.asset(ImageAsset.one,height: 380,width: 200,)
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}