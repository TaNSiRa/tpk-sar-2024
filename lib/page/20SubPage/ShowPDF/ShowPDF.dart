import 'dart:convert';
import 'dart:js';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import '../../../Global/dataTime.dart';
import '../../../Global/global_var.dart';
import '../../31RequestDetailRequester/data/RoutineRequestDetailRequesterPage_bloc.dart';

void showPDF(String pdf64, BuildContext context) {
  print(requestData[0].sentRepStatus.toString());
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return AlertDialog(
          //title: Text('HISTORY DATA'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: width - 100,
                height: height - 200,
                child: PdfPreview(
                  build: (format) {
                    return base64.decode(pdf64);
                  },
                ),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Container(child: Text('CLOSE')),
            ),
            // if (userName == 'N.KRITTAPAT' ||
            //     userName == 'K.WORACHAI' ||
            //     userName == 'R.TRIMATE' ||
            //     userName == 'P.RATCHANEE')
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    (requestData[0].sentRepStatus == null ||
                            requestData[0].sentRepStatus == "")
                        ? "NOT SENT YET"
                        : requestData[0].sentRepStatus.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (requestData[0].sentRepStatus.toString() ==
                              "NOT SENT YET")
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                if (requestData[0].sentRepStatus != 'SENT COMPLETE' &&
                    requestData[0].incharge == userName) ...[
                  Container(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 22,
                      icon: Icon(
                        Icons.send_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        CoolAlert.show(
                          barrierDismissible: false,
                          width: 200,
                          showCancelBtn: true,
                          context: context,
                          type: CoolAlertType.custom,
                          text: 'SENT REPORT TO CUSTOMER',
                          confirmBtnText: 'Yes',
                          cancelBtnText: 'No',
                          loopAnimation: false,
                          onConfirmBtnTap: () {
                            DateTime now = new DateTime.now();
                            print(now.toString());
                            print(sampleData[0]);
                            sentReportData.clear();
                            sentReportData.add(sampleData[0]);
                            sentReportData[0].sentRep = now.toString();
                            sentReportData[0].sentRepStatus = "SENT REPORT";
                            SentReport();
                          },
                          onCancelBtnTap: () {},
                        );
                      },
                    ),
                  ),
                ],
                if (requestData[0].sentRepStatus.toString() ==
                        "SENT COMPLETE" &&
                    requestData[0].incharge == userName) ...[
                  Container(
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        CoolAlert.show(
                          barrierDismissible: true,
                          width: 200,
                          context: context,
                          type: CoolAlertType.warning,
                          text: 'CANCEL SENT REPORT',
                          confirmBtnText: 'Yes',
                          cancelBtnText: 'No',
                          loopAnimation: true,
                          onConfirmBtnTap: () {
                            cancelReportData.clear();
                            cancelReportData.add(sampleData[0]);
                            cancelReportData[0].sentRep = null;
                            cancelReportData[0].sentRepStatus = null;
                            submitcancelsentReport();
                          },
                          onCancelBtnTap: () {},
                        );
                      },
                    ),
                  ),
                ],
                if (requestData[0].sentRep.toString() == "SENT COMPLETE") ...[
                  Text(
                    toDateTime(requestData[0].sentRep.toString()),
                  ),
                ],
              ],
            ),
          ],
        );
      });
}
