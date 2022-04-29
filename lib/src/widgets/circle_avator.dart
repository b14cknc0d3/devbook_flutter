import 'package:flutter/material.dart';

class MyCircleAvator extends StatelessWidget {
  final String url;
  const MyCircleAvator({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CircleAvatar(
        foregroundColor: Colors.indigo,
        backgroundColor: Colors.white,
        foregroundImage: NetworkImage(url.toString()),
      ),
    );
  }
}
