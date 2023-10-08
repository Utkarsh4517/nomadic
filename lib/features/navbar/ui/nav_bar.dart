import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomadic/constants/dimensions.dart';
import 'package:nomadic/features/explore/ui/explore_page.dart';
import 'package:nomadic/features/memories/ui/memories_page.dart';
import 'package:nomadic/features/navbar/bloc/nav_bar_bloc.dart';
import 'package:nomadic/features/profile/ui/profile_page.dart';
import 'package:nomadic/features/tickets/ui/tickets_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> bottomNavItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.mountain,
          ),
          label: 'Explore'),
      const BottomNavigationBarItem(
          icon: Icon(
            FontAwesomeIcons.train,
          ),
          label: 'Tickets'),
      const BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.heart,
          ),
          label: 'Memories'),
      const BottomNavigationBarItem(
          icon: Icon(
            FeatherIcons.user,
          ),
          label: 'Profile'),
    ];

    const List<Widget> bottomNavScreen = <Widget>[
      ExplorePage(),
      TicketsPage(),
      MemoriesPage(),
      ProfilePage(),
    ];
    final navBarBloc = NavBarBloc();
    return BlocConsumer<NavBarBloc, NavBarState>(
      bloc: navBarBloc,
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              navBarBloc.add(TabChangeEvent(tabIndex: index));
            },
            children: bottomNavScreen,
          ),
          bottomNavigationBar: Container(
            color: const Color.fromARGB(255, 248, 248, 248),
            margin: const EdgeInsets.symmetric(horizontal: 20)
                .copyWith(bottom: getScreenheight(context) * 0.02),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BottomNavigationBar(
                backgroundColor: const Color.fromARGB(255, 46, 52, 68),
                items: bottomNavItems,
                currentIndex: state.tabIndex,
                selectedItemColor: Colors.white,
                // unselectedItemColor: Colors.white,
                elevation: 10,
                selectedFontSize: 12,
                unselectedFontSize: 10,
                type: BottomNavigationBarType.fixed,
                // selectedItemColor: blackColor,
                unselectedItemColor: Colors.white.withAlpha(85),
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
