import 'package:echo/util/Settingtile.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      //  App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.settings, color: Colors.black),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 20),

          // Profile Image + Online Dot
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
              Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ],
          ),

          const SizedBox(height: 15),

          //  Name
          const Text(
            "Haseeb Ahmad",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 5),

          const Text("Available", style: TextStyle(color: Colors.green)),

          const SizedBox(height: 20),

          // ✏️ Edit Button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade300,
                foregroundColor: Colors.green.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text("Edit Profile"),
            ),
          ),

          const SizedBox(height: 30),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "SETTINGS",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          //  Settings List
          Expanded(
            child: ListView(
              children: const [
                SettingTile(icon: Icons.person_outline, title: "Account"),
                SettingTile(
                  icon: Icons.notifications_none,
                  title: "Notifications",
                ),
                SettingTile(icon: Icons.lock_outline, title: "Privacy"),
                SettingTile(icon: Icons.storage, title: "Data & Storage"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Reusable Tile Widget
