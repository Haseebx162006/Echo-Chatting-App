import 'package:echo/Providers/Userprovider.dart';
import 'package:echo/util/Chattile.dart';
import 'package:echo/util/StatusCard.dart';
import 'package:echo/views/screens/Chat/InnerChatScreen.dart';
import 'package:echo/views/screens/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  final list = [
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
    {
      "name": "Haseeb Ahmad",
      "lastMessage": "Hey, how are you?",
      "time": "2:30 PM",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Echo Talks",
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    onSelected: (value) {
                      if (value == "Settings") {
                      } else if (value == "Logout") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                        // Perform logout action
                      }
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Settings"), value: "Settings"),
                      PopupMenuItem(child: Text("Logout"), value: "Logout"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              SearchBar(
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 10),
                ),
                controller: searchController,
                onChanged: (value) {
                  ref.read(searchProvider.notifier).state = value;
                },
                backgroundColor: MaterialStateProperty.all(Color(0xffD5E0C2)),
                hintText: "Search for contactcs",
              ),

              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatusCard(name: "Haseeb Ahmad", isNew: true),
                  StatusCard(name: "Haseeb Ahmad", isNew: true),
                  StatusCard(name: "Haseeb Ahmad", isNew: true),
                  StatusCard(name: "Haseeb Ahmad", isNew: true),
                ],
              ),
              SizedBox(height: 20),
              ref
                  .watch(userProvider)
                  .when(
                    data: (users) {
                      if (users.isEmpty) {
                        return Center(child: Text("NO users"));
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Chattile(
                            name: user.name,
                            lastMessage: "No msg to show",
                            time: DateTime.now().toString().substring(11, 16),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      InnerChatScreen(user: user),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    error: (error, stackTrace) =>
                        Center(child: Text("Error: $error")),
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
