import 'package:flutter/material.dart';

Widget customListTitle(
    {required String title,
    required String singer,
    required String cover,
    onTap,
    String? url,
    String? artist}) {
  return InkWell(
    onTap: onTap, 
    child: Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                image: NetworkImage(cover),
                fit: BoxFit.cover, 
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, 
              mainAxisAlignment:
                  MainAxisAlignment.center, 
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis, 
                ),
                Text(
                  singer,
                  style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey), 
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  singer,
                  style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
