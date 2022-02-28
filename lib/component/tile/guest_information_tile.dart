import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanzos_homestay/constant/theme.dart';
import 'package:sanzos_homestay/controller/guest_controller.dart';
import 'package:skeleton_text/skeleton_text.dart';

class GuestInformationTile extends StatelessWidget {
  final String label;
  final String value;
  final GuestController state;
  const GuestInformationTile({
    Key? key,
    required this.label,
    required this.value,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.kodchasan(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        (state.isLoading.value)
            ? SkeletonAnimation(
                shimmerColor: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                shimmerDuration: 1000,
                child: Container(
                  height: 15,
                  width: 100,
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: shadowList,
                  ),
                ),
              )
            : Text(
                value,
                style: GoogleFonts.kodchasan(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
      ],
    );
  }
}
