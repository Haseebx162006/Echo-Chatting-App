import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final String name;
  final String? image;
  final double radius;
  final bool isNew;
  final VoidCallback? onTap;

  const StatusCard({
    super.key,
    required this.name,
    this.image,
    this.radius = 30,
    this.isNew = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: radius,
                backgroundImage: image != null
                    ? NetworkImage(image!)
                    : AssetImage("assets/images/Userprof.jpg") as ImageProvider,
              ),
              if (isNew)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 5),
          SizedBox(
            width: radius * 2,
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
