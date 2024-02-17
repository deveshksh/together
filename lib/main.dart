// import 'package:flutter/material.dart';
import 'discovery_page.dart';
import 'theme.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Discovery App',
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF880E4F, pinkColorScheme),
        hintColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black87),
          bodyText2: TextStyle(color: Colors.black87),
        ),
      ),
      home: DiscoveryPage(),
    );
  }
}





// for light mode uncomment this 
// -----------------------------------------------
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(), // Set the theme to dark mode
//       home: DiscoveryPage(),
//     );
//   }
// }

// class DiscoveryPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Discovery Page'),
//       ),
//       body: ListView.builder(
//         itemCount: 40,
//         itemBuilder: (context, index) {
//           return Card(
//             margin: EdgeInsets.all(8.0),
//             elevation: 4.0,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: _generateRandomGradient(),
//                 borderRadius: BorderRadius.circular(12.0),
//               ),
//               child: ListTile(
//                 title: Text('Sample Item $index'),
//                 subtitle: Text('Description of Sample item $index'),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Gradient _generateRandomGradient() {
//   final random = Random();
//   final List<Color> colors = [
//     Colors.red,
//     Colors.blue,
//     Colors.pink,
//     Colors.green,
//     Colors.yellow,
//     Color.fromARGB(255, 199, 45, 94), // Bright pink
//     Color(0xFFF05151), // Bright red
//     Color.fromARGB(192, 193, 70, 199), // Bright purple
//     Color.fromARGB(255, 255, 98, 35), // Bright orange
//     Color.fromARGB(255, 255, 181, 71), // Brighter orange
//     Color.fromARGB(255, 67, 194, 116), // Bright green
//     Color.fromARGB(255, 45, 137, 239), // Brighter blue
//     Color.fromARGB(255, 158, 0, 0), // Deep red
//     Color.fromARGB(255, 204, 51, 255), // Hot pink
//     Color.fromARGB(255, 255, 102, 178), // Flamingo pink
//     Color.fromARGB(255, 0, 204, 153), // Aquamarine
//     Color.fromARGB(255, 255, 153, 51), // Tangerine
//     Color.fromARGB(255, 0, 102, 204), // Sapphire blue
//     Color.fromARGB(255, 255, 0, 102), // Magenta
//     Color.fromARGB(255, 51, 102, 0), // Forest green
//     Color.fromARGB(255, 255, 102, 0), // Sunburst orange
//     Color.fromARGB(255, 102, 0, 153), // Plum purple
//     Color.fromARGB(255, 255, 0, 255), // Electric purple
//   ];
//   final Color color = colors[random.nextInt(colors.length)];
//   return LinearGradient(
//     colors: [color.withOpacity(0.3), color.withOpacity(0.3)],
//     begin: Alignment.topLeft,
//     end: Alignment.bottomRight,
//   );

// }
// }

// // -----------------------------------------------
