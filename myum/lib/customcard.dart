import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String img;
  final String title;
  final String summary;
  const CustomCard(this.img, this.title, this.summary, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24),
      child:Row(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(24),
          child: Image.network(widget.img, width: 150,),),
          Expanded(child: 
            Column(children: <Widget>[
              Text(widget.title, 
                textAlign: TextAlign.center,
                style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),),
              Text(widget.summary)
          ],))
        ],
      )
    );
  }
}