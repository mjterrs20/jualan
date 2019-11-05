import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool submitting = false;
  ProgressDialog pr;

  void showAlertDialogKontakKami() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
            height: 100.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20.0),
                        width: 40.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "Kontak Kami",
                          style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                          margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: 3.0),
                              ),
                              Text(
                                "+62 812 7277 7777",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black),
                              ),
                            ],
                          )),
                    ),
                  ],
                )),
          );
        });
  }

  void toggleSubmitState() {
    setState(() {
      submitting = !submitting;
    });
  }

  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please wait...',
        borderRadius: 10.0,
        backgroundColor: Colors.white,
        progressWidget: CircularProgressIndicator(
          // backgroundColor: Colors.red,
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFB60000)),
          strokeWidth: 4.0,
        ),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
        );
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Show dialog and go to next screen',
              style: TextStyle(color: Colors.white)),
          color: Colors.blueAccent,
          onPressed: () {
            pr.show();
            Future.delayed(Duration(seconds: 3)).then((value) {
              pr.hide().whenComplete(() {
                showAlertDialogKontakKami();
              });
            });
          },
        ),
      ),
    );
  }
}
