import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanzos_homestay/model/room/room.dart';
import 'package:sanzos_homestay/util/room_util.dart';

class CustomGridTile extends StatelessWidget {
  final Room room;
  final Function() onTap;
  const CustomGridTile({
    Key? key,
    required this.room,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: getStatusColor(room.status).withOpacity(0.00001),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: getStatusColor(room.status),
              width: 4.0,
            ),
            boxShadow: [
              BoxShadow(
                color: getStatusColor(room.status).withOpacity(0.5),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ]),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              room.code,
              style: GoogleFonts.kodchasan(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              room.name,
              style: GoogleFonts.kodchasan(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  getStatusInfo(room.status),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kodchasan(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
