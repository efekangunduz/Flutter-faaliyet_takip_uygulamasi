import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/features/register/auth/auth.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/participants_list.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/home/video_player.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EventDetails extends StatefulWidget {
  EventDetails(
      {Key? key,
      required this.category,
      required this.title,
      required this.description,
      required this.date,
      required this.details,
      required this.publisher,
      required this.photoUrl,
      required this.videoUrl})
      : super(key: key);
  final String title,
      description,
      date,
      details,
      publisher,
      category,
      videoUrl,
      photoUrl;

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final IconData _homeIcon = Icons.home;
  final IconData _logoutIcon = Icons.logout;

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
      child: Card(
        child: Container(
          height: context.height,
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.indigoAccent]),
          ),
          child: Padding(
            padding: context.paddingNormal,
            child: ListView(
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.headline6,
                ),
                Text(
                  widget.description,
                  style: context.textTheme.bodyText1,
                ),
                SizedBox(
                  height: context.height * 0.4,
                  width: double.infinity,
                  child: Image.network(widget.photoUrl),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.date,
                      style: context.textTheme.caption,
                    ),
                    Text(
                      widget.publisher,
                      style: context.textTheme.headline6,
                    )
                  ],
                ),
                Text(
                  widget.details,
                  style: context.textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => VideoApp(
                            video: widget.videoUrl, title: widget.title)));
                  },
                  icon: Icon(
                    Icons.play_arrow,
                    color: Colors.indigoAccent,
                  ),
                ),
                Text(
                  'Participant List : ',
                  style: context.textTheme.headline5,
                ),
                SizedBox(
                    height: context.height * 0.2,
                    width: context.width,
                    child: ParticipantsList(
                      title: widget.title,
                    )),
                TextButton(
                    onPressed: () {
                      joinEvent(widget.title, widget.category);
                      Navigator.of(context).pushNamed("/home");
                    },
                    child: Text(
                      'Wanna Join? Click me.',
                      style: context.textTheme.headline5,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
