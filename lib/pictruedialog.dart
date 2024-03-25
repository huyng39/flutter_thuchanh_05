import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

String link = 'https://qph.cf2.quoracdn.net/main-qimg-7fb4f710e8d9fd5e26ed30c6040cf0bd-lq';
Widget PictureDialogProfile(BuildContext context) {
    return Dialog(
      child: Image.network(
        link,
        fit: BoxFit.cover,
      ),
    );
  }