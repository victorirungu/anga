// import 'package:anga/controllers/scroll.dart';
// import 'package:anga/views/functions/resolution.dart';
// import 'package:anga/views/pages/Contacts/contacts.dart';
// import 'package:anga/views/pages/Home/home.dart';
// import 'package:anga/views/pages/Components/app_bar.dart';
// import 'package:anga/views/themes/themes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

// GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

// class CustomNavigator extends StatefulWidget {
//   const CustomNavigator({super.key});

//   @override
//   State<CustomNavigator> createState() => _CustomNavigatorState();
// }

// class _CustomNavigatorState extends State<CustomNavigator> {
//   final ScrollControllerManager scrollControllerManager =
//       Get.put(ScrollControllerManager());
//   late final ScrollControllerObserver scrollControllerObserver;
//   ScrollController? activeScrollController;

//   @override
//   void initState() {
//     super.initState();
//     scrollControllerManager.initScrollControllers();
//     activeScrollController = getActiveScrollController();
//     activeScrollController!.addListener(_onScroll);
//     scrollControllerObserver = ScrollControllerObserver(
//       scrollControllerManager: scrollControllerManager,
//       onUpdate: _updateActiveController,
//     );
//   }

//   @override
//   void dispose() {
//     activeScrollController?.removeListener(_onScroll);
//     scrollControllerManager.dispose();
//     super.dispose();
//   }

//   ScrollController getActiveScrollController() {
//     String? currentRouteName = Get.currentRoute;
//     switch (currentRouteName) {
//       case '/home':
//         return scrollControllerManager.homeScrollController!;
//       case '/contacts':
//         return scrollControllerManager.contactsScrollController!;
//       default:
//         return scrollControllerManager.homeScrollController!;
//     }
//   }

//   void _updateActiveController() {
//     setState(() {
//       activeScrollController?.removeListener(_onScroll);
//       activeScrollController = getActiveScrollController();
//       activeScrollController!.addListener(_onScroll);
//     });
//   }

//   bool hasReachedTopThreshold = false;

//   void _onScroll() {
//     if (!hasReachedTopThreshold &&
//         activeScrollController!.position.pixels <= 100) {
//       setState(() {
//         hasReachedTopThreshold = true;
//       });
//     } else if (hasReachedTopThreshold &&
//         activeScrollController!.position.pixels > 100) {
//       setState(() {
//         hasReachedTopThreshold = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Map resolution = getResolution(context);
//     double width = resolution['width'];
//     return Scaffold(
//       backgroundColor: primaryBackGround(),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Navigator(
//               key: mainNavigatorKey,
//               observers: [scrollControllerObserver],
//               onGenerateRoute: (RouteSettings settings) {
//                 // Use GetX routing for web navigation
//                 return GetPageRoute(
//                   settings: settings,
//                   page: () {
//                     switch (settings.name) {
//                       case '/home':
//                         return Home(
//                             scrollController:
//                                 scrollControllerManager.homeScrollController!);
//                       case '/contacts':
//                         return Contacts(
//                             scrollController: scrollControllerManager
//                                 .contactsScrollController!);
//                       default:
//                         return Home(
//                             scrollController:
//                                 scrollControllerManager.homeScrollController!);
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//           Positioned(
//             top: 0,
//             left: 0,
//             child: width > 800
//                 ? CustomAppBar(
//                     mainNavigatorKey: mainNavigatorKey,
//                     scrollController: activeScrollController!,
//                   )
//                 : const SizedBox(),
//           ),
//         ],
//       ),
//       bottomNavigationBar: width < 800
//           ? Container(
//               color: themeColorTransparent().withOpacity(.0),
//               height: 68.0,
//               child: FloatingNavbar(
//                 borderRadius: 20.0,
//                 backgroundColor: themeColorTransparent(),
//                 padding: const EdgeInsets.all(0.0),
//                 margin: const EdgeInsets.all(0.0),
//                 selectedBackgroundColor: primaryColor(),
//                 iconSize: 20.0,
//                 onTap: (int val) {
//                   // Update to navigate with GetX
//                   switch (val) {
//                     case 0:
//                       Get.toNamed('/home');
//                       break;
//                     case 1:
//                       // Add corresponding route
//                       break;
//                     case 2:
//                       // Add corresponding route
//                       break;
//                     case 3:
//                       // Add corresponding route
//                       break;
//                     default:
//                       Get.toNamed('/home');
//                   }
//                 },
//                 currentIndex: 0,
//                 items: [
//                   FloatingNavbarItem(icon: Icons.home, title: 'Home'),
//                   FloatingNavbarItem(icon: Icons.search, title: 'Search'),
//                   FloatingNavbarItem(icon: Icons.event, title: 'Events'),
//                   FloatingNavbarItem(icon: Icons.person, title: 'My Profile'),
//                 ],
//               ),
//             )
//           : const SizedBox(),
//     );
//   }
// }

// class ScrollControllerObserver extends NavigatorObserver {
//   final ScrollControllerManager scrollControllerManager;
//   final VoidCallback onUpdate;

//   ScrollControllerObserver(
//       {required this.scrollControllerManager, required this.onUpdate});

//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPush(route, previousRoute);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       onUpdate();
//     });
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPop(route, previousRoute);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       onUpdate();
//     });
//   }

//   @override
//   void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
//     super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       onUpdate();
//     });
//   }
// }
