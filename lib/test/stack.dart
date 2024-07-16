// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:kirana/screens/mybills_screen.dart';
// import 'package:kirana/screens/uploadbill_screen.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       drawer: Drawer(
//         child: Container(
//           color: Colors.white,
//           child: ListView(
//             padding: const EdgeInsets.all(0),
//             children: [
//               UserAccountsDrawerHeader(
//                 accountName: Text(
//                   "John Doe",
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                   ),
//                 ),
//                 accountEmail: Text(""),
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                         "https://mir-s3-cdn-cf.behance.net/project_modules/1400/a4c0b560535613.5a5084d6141fb.jpg"),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => HomeScreen(),
//                   ));
//                 },
//                 leading: const Icon(Icons.dashboard_outlined),
//                 title: const Text(
//                   "Dashboard",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => UploadbillScreen(),
//                   ));
//                 },
//                 leading: const Icon(Icons.note),
//                 title: const Text(
//                   "Upload Bill",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => MybillsScreen(),
//                   ));
//                 },
//                 leading: const Icon(Icons.safety_check),
//                 title: const Text(
//                   "My Bills",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 onTap: () {
//                   // Navigator.of(context).push(MaterialPageRoute(
//                   //   builder: (context) {},
//                   // ));
//                 },
//                 leading: const Icon(Icons.logout),
//                 title: const Text(
//                   "Log Out",
//                   style: TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: const Column(
//           children: [
//             Text(
//               "Dashboard",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25),
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(25),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.white,
//                 ),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           "Total Bills",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "25",
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Total Bills",
//                           style: TextStyle(
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "25",
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 // child: Image.asset("/assets/images/bill.png"),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 padding: EdgeInsets.all(25),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(15)),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         CircleAvatar(child: Icon(Icons.money)),
//                         Text("My Bills"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(child: Icon(Icons.money)),
//                         Text("Upload Bills"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(child: Icon(Icons.money)),
//                         Text("My Bills"),
//                       ],
//                     ),
//                     Column(
//                       children: [
//                         CircleAvatar(child: Icon(Icons.money)),
//                         Text("My Bills"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//                 child: Column(children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       const Text(
//                         "Latest Bills",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       OutlinedButton(
//                         onPressed: () {},
//                         child: const Text("More"),
//                       )
//                     ],
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: 5,
//                     itemBuilder: (BuildContext context, int index) {
//                       return const ListTile(
//                         leading: CircleAvatar(child: Icon(Icons.receipt)),
//                         tileColor: Colors.white,
//                         title: Text("Bill Name"),
//                         contentPadding: EdgeInsets.all(5),
//                       );
//                     },
//                   )
//                 ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
