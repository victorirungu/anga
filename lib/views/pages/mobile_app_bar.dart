// import 'package:flutter/material.dart';

// class MobileAppBar extends StatelessWidget {
//   const MobileAppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return         
//               Stack(
              
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(0.0),
//                     color: themeColorBackGround(),
//                     height: height,
//                     width: width,
//                     child: buildPageForIndex(),
//                   ),
//                   width < 700.0
//                       ? Positioned(
//                           bottom: 0.0,
//                           child: SizedBox(
//                             width: width * .98,
//                             child: CrystalNavigationBar(
//                               currentIndex: SelectedTab.values.indexOf(
//                                   dataController.selectedTab.value),
//                               height: 5,
//                               unselectedItemColor:
//                                   themeColorForeGround().withOpacity(.85),
//                               backgroundColor:
//                                   themeColorBackGround().withOpacity(0.3),
//                               onTap: dataController.handleNavigation,
//                               items: [
//                                 /// Home
//                                 CrystalNavigationBarItem(
//                                   icon: IconlyBold.home,
//                                   unselectedIcon: IconlyLight.home,
//                                   selectedColor: themeColor(),
//                                   text: "Home",
//                                 ),
                          
//                                 // Search
//                                 CrystalNavigationBarItem(
//                                   icon: IconlyBold.search,
//                                   unselectedIcon: IconlyLight.search,
//                                   selectedColor: themeColor(),
//                                   text: "Search",
//                                 ),
                          
//                                 /// My Tickets
//                                 CrystalNavigationBarItem(
//                                     icon: IconlyBold.ticket_star,
//                                     unselectedIcon: IconlyLight.ticket,
//                                     selectedColor: themeColor(),
//                                     text: "My Tickets"),
                          
//                                 /// Profile
//                                 CrystalNavigationBarItem(
//                                     icon: IconlyBold.user_2,
//                                     unselectedIcon: IconlyLight.add_user,
//                                     selectedColor: themeColor(),
//                                     text: "Profile"),
//                               ],
//                             ),
//                           ),
//                         )
//                       : const SizedBox()
//                 ],
//               )
//   }
// }