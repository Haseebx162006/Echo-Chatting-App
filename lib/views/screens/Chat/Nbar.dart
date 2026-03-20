import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:echo/views/screens/Chat/ChatScreen.dart';
import 'package:echo/views/screens/Chat/Settings.dart';
import 'package:flutter/material.dart';

class Nbar extends StatefulWidget {
  const Nbar({super.key});

  @override
  State<Nbar> createState() => _NbarState();
}

class _NbarState extends State<Nbar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ChatScreen(),
    const HomeTab(),
    const ProfileTab(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        color: Color(0xff546A2F),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xff546A2F),
        height: 60,
        animationDuration: Duration(milliseconds: 500),
        items: [
          Icon(Icons.home, size: 20, color: Colors.black),
          Icon(Icons.chat, size: 20, color: Colors.black),
          Icon(Icons.person, size: 20, color: Colors.black),
          Icon(Icons.settings, size: 20, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xff546A2F),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Home Screen')),
    );
  }
}

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: Color(0xff546A2F),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Chat Screen')),
    );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color(0xff546A2F),
        foregroundColor: Colors.white,
      ),
      body: Center(child: Text('Profile Screen')),
    );
  }
}
