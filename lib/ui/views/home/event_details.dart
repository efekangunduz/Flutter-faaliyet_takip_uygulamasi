import 'package:faaliyet_takip_uygulamasi/features/home/event_management.dart';
import 'package:faaliyet_takip_uygulamasi/features/register/auth/auth.dart';
import 'package:faaliyet_takip_uygulamasi/ui/views/base_view.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class EventDetails extends StatefulWidget {
  EventDetails(
      {Key? key,
      required this.participantList,
      required this.category,
      required this.title,
      required this.description,
      required this.date,
      required this.details,
      required this.publisher})
      : super(key: key);
  final String title, description, date, details, publisher, category;
  final List<String> participantList;

  @override
  _EventDetailsState createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  final IconData _homeIcon = Icons.home;
  final IconData _logoutIcon = Icons.logout;
  String participant = '';

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
          height: context.height * 0.6,
          width: context.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purpleAccent, Colors.indigoAccent]),
          ),
          child: Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.headline6,
                ),
                Text(
                  widget.description,
                  style: context.textTheme.bodyText1,
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
                Text(
                  'Participant List : ',
                  style: context.textTheme.headline5,
                ),
                SizedBox(
                  height: context.height * 0.3,
                  width: context.width,
                  child: widget.participantList.isNotEmpty
                      ? Container()
                      : ListView.builder(
                          padding: context.paddingLow,
                          itemCount: widget.participantList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(
                              widget.participantList[index],
                              style: context.textTheme.headline6,
                            );
                          }),
                ),
                TextButton(
                    onPressed: () {
                      joinEvent(widget.title, widget.category);
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
