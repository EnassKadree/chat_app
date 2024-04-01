import 'package:chat_app/View/Home/chat_home_page.dart';
import 'package:chat_app/View/Home/contacts_home_page.dart';
import 'package:chat_app/View/Home/groups_home_page.dart';
import 'package:chat_app/View/Home/settings_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class Layout extends StatefulWidget 
{
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> 
{
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) 
  {
    List<Widget> screens = const 
    [
      ChatsHomePage(),
      GroupsHomePage(),
      ContactsHomePage(),
      SettingsHomePage(),
    ];
    return Scaffold
    (
      bottomNavigationBar: NavigationBar
      (
        elevation: 0,
        selectedIndex: currentIndex,
        onDestinationSelected: (value) 
        { setState(() {currentIndex = value;});  pageController.jumpToPage(value); },
        destinations: const 
        [
          NavigationDestination(icon: Icon(Iconsax.message), label: 'Chat'),
          NavigationDestination(icon: Icon(Iconsax.messages), label: 'Groups'),
          NavigationDestination(icon: Icon(Iconsax.user), label: 'Contacts'),
          NavigationDestination(icon: Icon(Iconsax.setting), label: 'Settings'),
        ],
      ),
      body: PageView
      (
        controller: pageController,
        children: screens,
        onPageChanged: (value) => setState(() {currentIndex = value;}),
      ),
    );
  }
}