import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String img;
  final String title;
  final String date;
  final String location;
  const EventCard(this.img, this.title, this.date, this.location, {super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        children: <Widget>[
          Image.network(widget.img, width: 400),
          Text(widget.title, style: TextStyle(color: Colors.green.shade900, fontSize: 24), textAlign: TextAlign.center),
          Text(widget.date, textAlign: TextAlign.center,),
          Text(widget.location, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}