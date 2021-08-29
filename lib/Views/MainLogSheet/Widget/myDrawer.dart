// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:timemanagment/Controller/LogOutController/logout_controller.dart';
// import 'package:timemanagment/Controller/user_controller.dart';
// import 'package:timemanagment/Models/user_model.dart';
// import 'package:timemanagment/Services/mydb.dart';
// import 'package:timemanagment/Views/Userprofile/user-file.dart';
//
// class MyDrawer extends StatelessWidget {
//   final UserModel userModel;
//
//   MyDrawer({Key key, this.userModel}) : super(key: key);
//   final logoutController = Get.put(LogOutController());
//   final userController = Get.put(UserController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: Column(
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: GetX<UserController>(
//               initState: (_) async {
//                 Get.find<UserController>().user = await MyDatabase()
//                     .getUser(Get.find<UserController>().users.uid);
//               },
//               builder: (_) {
//                 if (_.user.name != null) {
//                   return Text("Welcome " + _.user.name);
//                 } else {
//                   return Text("loading...");
//                 }
//               },
//             ),
//             accountEmail:
//             GetX<UserController>(
//               initState: (_) async {
//                 Get.find<UserController>().user = await MyDatabase()
//                     .getUser(Get.put<UserController>(UserController()).users.uid);
//               },
//               builder: (_) {
//                 if (_.user.email != null) {
//                   return Text(_.user.email);
//                 } else {
//                   return Text("loading...");
//                 }
//               },
//             ),
//             currentAccountPicture:  GetX<UserController>(
//               initState: (_) async {
//                 Get.find<UserController>().user = await MyDatabase()
//                     .getUser(Get.put<UserController>(UserController()).users.uid);
//               },
//               builder: (_) {
//                 if (_.user.image != null) {
//                   return CircleAvatar(
//                     backgroundImage: NetworkImage(_.user.image),
//                   );
//                 } else {
//                   return CircleAvatar(
//                     backgroundColor: Colors.black45,
//                   );
//                 }
//               },
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.person_pin),
//             title: const Text('User profile'),
//             onTap: () {
//               Get.to(Userprofile());
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: const Text('LogOut'),
//             onTap: () {
//               logoutController.signOut();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
