import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

var username = "Username";

void snackBar(var text, var msg, var behave, context) {
  var content;
  
  var snackBar = SnackBar(
    /// need to set following properties for best effect of awesome_snackbar_content
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: text,
      message: 'under developement',

      /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
      contentType: behave,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Image avatar = Image.network(
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQGjGADlLSZveEWxLeDmhCYWIDUhl7eRh20u2KSUb-Z25UFUVSWlPvLBdlIrS-dqr5nHA&usqp=CAU");
