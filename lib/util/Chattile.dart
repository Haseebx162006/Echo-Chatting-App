import 'package:flutter/material.dart';

class Chattile extends StatefulWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String? unreadCount;
  final String? avatarUrl;
  final bool isOnline;
  final VoidCallback? onTap;
  const Chattile({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    this.unreadCount,
    this.avatarUrl,
    this.isOnline = false,
    this.onTap,
  });

  @override
  State<Chattile> createState() => _ChattileState();
}

class _ChattileState extends State<Chattile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      leading: Stack(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey[300],
            backgroundImage: widget.avatarUrl != null
                ? NetworkImage(widget.avatarUrl!)
                : null,
            child: widget.avatarUrl == null
                ? Icon(Icons.person, color: Colors.black)
                : null,
          ),
          if (widget.isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        widget.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(
        widget.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.grey[700]),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.time, style: TextStyle(fontSize: 12, color: Colors.grey)),
          SizedBox(height: 5),
          if (widget.unreadCount != null)
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.green[700],
                shape: BoxShape.circle,
              ),
              child: Text(
                widget.unreadCount!,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
