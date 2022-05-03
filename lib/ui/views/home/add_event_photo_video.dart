import 'dart:io';

import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/features/home/notifications.dart';
import 'package:faaliyet_takip_uygulamasi/features/register/auth/auth.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class AddEventPhotoVideo extends StatefulWidget {
  final String title;
  final String description;
  final String category;
  const AddEventPhotoVideo(
      {Key? key,
      required this.title,
      required this.description,
      required this.category})
      : super(key: key);

  @override
  State<AddEventPhotoVideo> createState() => _AddEventPhotoVideoState();
}

class _AddEventPhotoVideoState extends State<AddEventPhotoVideo> {
  final IconData _logoutIcon = Icons.logout;
  File? addImageFile;
  File? addVideoFile;
  @override
  Widget build(BuildContext context) {
    return BaseView(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logout();
              Navigator.of(context).pushNamed("/register");
            },
            icon: Icon(_logoutIcon),
          )
        ],
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigoAccent, Colors.purpleAccent],
            ),
          ),
        ),
      ),
      child: Form(
        child: Column(
          children: [
            IconButton(
              onPressed: () {
                addImageOnCamera(addImageFile, widget.title, widget.category);
              },
              icon: Icon(Icons.camera),
            ),
            IconButton(
              onPressed: () {
                addVideoOnCamera(addVideoFile, widget.title, widget.category);
                sendPushMessage(widget.description, widget.title);
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/home', (Route<dynamic> route) => false);
              },
              icon: Icon(Icons.video_camera_front),
            ),
          ],
        ),
      ),
    );
  }
}
