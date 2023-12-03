import 'package:a_check_web/dashboard.dart';
import 'package:a_check_web/pages/class/classes_page.dart';
import 'package:a_check_web/pages/student/students_page.dart';
import 'package:a_check_web/pages/teacher/teachers_page.dart';
import 'package:a_check_web/utils/abstracts.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) => MainScreenView(this);

  int selectedIndex = 0;
  PageController pageController = PageController(
    keepPage: true,
  );

  void onDestinationChanged(int value) {
    setState(() {
      selectedIndex = value;
      pageController.animateToPage(value,
          duration: const Duration(milliseconds: 400), curve: Curves.ease);
    });
  }
}

class MainScreenView extends WidgetView<MainScreen, MainScreenState> {
  const MainScreenView(super.state, {super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> views = const [
      Dashboard(),
      TeachersPage(),
      StudentsPage(),
      ClassesPage(),
    ];

    List<NavigationRailDestination> destinations = const [
      NavigationRailDestination(
        icon: Icon(Icons.home_outlined, color: Color(0xff353535),size: 30,),
        selectedIcon: Icon(Icons.home, color: Color(0xff153faa),size: 30,),
        label: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.person_outline, color: Color(0xff353535),size: 30,),
        selectedIcon: Icon(Icons.person, color: Color(0xff153faa),size: 30,),
        label: Text("Teachers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.group_outlined, color: Color(0xff353535),size: 30,),
        selectedIcon: Icon(Icons.group, color: Color(0xff153faa),size: 30,),
        label: Text("Students", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ),
      NavigationRailDestination(
        icon: Icon(Icons.grid_view_outlined, color: Color(0xff353535),size: 30,),
        selectedIcon: Icon(Icons.grid_view_rounded, color: Color(0xff153faa),size: 30,),
        label: Text("Classes", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ),
    ];

    return Scaffold(
      body: Row(
        children: [
          Container(
              decoration: const BoxDecoration(
                  border: Border(right: BorderSide(width: 0.5))
              ),
            child: buildNavRail(destinations)
          ),
          buildPageView(views)],
      ),
    );
  }

  NavigationRail buildNavRail(List<NavigationRailDestination> destinations) {
    return NavigationRail(
      backgroundColor: Colors.white,
      destinations: destinations,
      selectedIndex: state.selectedIndex,
      onDestinationSelected: state.onDestinationChanged,
      useIndicator: false,
      extended: true,
      leading: buildLeading(),
    );
  }

  Row buildLeading() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top:40.0, bottom: 30),
          child: Image(image: AssetImage("assets/images/small_logo_blue.png"), height: 60),
        ),
        Padding(
            padding: EdgeInsets.only(left: 4, top: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A-Check",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xff153faa)),
                ),
                Text(
                  "Web Admin",
                  style: TextStyle(fontSize: 10)
                )
              ],
            ))
      ],
    );
  }

  Expanded buildPageView(List<Widget> views) {
    return Expanded(
      child: PageView(
        controller: state.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: views,
      ),
    );
  }
}