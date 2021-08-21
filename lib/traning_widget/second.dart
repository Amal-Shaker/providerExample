// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'change.dart';

// class Second extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Consumer<MyCounter>(builder: (context, mycounter, child) {
//           return Text("${mycounter.counter}");
//         }),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Consumer<MyCounter>(
//               builder: (context, mycounter, child) {
//                 return Text("${mycounter.counter}");
//               },
//             ),
//             Consumer<MyCounter>(
//               builder: (context, mycounter, child) {
//                 return IconButton(
//                     icon: Icon(Icons.add),
//                     onPressed: () {
//                       mycounter.inc();
//                     });
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
