import 'package:flutter/material.dart';

class ExpandedTileWidget extends StatelessWidget {
  final String title;

  const ExpandedTileWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
          iconColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              title.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
            size: 18.0,
          ),
          subtitle: const Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              'Pending Approval',
              style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  fontWeight: FontWeight.w400),
            ),
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.access_time_rounded,
              color: Colors.yellow[700],
              size: 35.0,
            ),
          ),
        ),
      ],
    );
  }
}
