import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  final CancelFunc cancelFunc;

  const CustomWidget({Key key, this.cancelFunc}) : super(key: key);

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  bool loveMe = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
                icon: Icon(Icons.favorite),
                color: loveMe ? Colors.redAccent : Colors.grey,
                onPressed: () {
                  setState(() {
                    loveMe = !loveMe;
                    BotToast.showText(
                        onlyOne: true,
                        text: loveMe ? "Yes, I love you.😘" : "No!!!!😫");
                  });
                }),
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            color: loveMe ? Colors.redAccent : Colors.grey,
            onPressed: widget.cancelFunc,
          )
        ],
      ),
    );
  }
}

class CustomNotification extends StatefulWidget {
  @override
  _CustomNotificationState createState() => _CustomNotificationState();
}

class _CustomNotificationState extends State<CustomNotification> {
  bool enableSlideOff = true;
  bool onlyOne = true;
  bool crossPage = true;
  int seconds = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomNotification"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  BotToast.showCustomNotification(
                    duration: Duration(seconds: seconds),
                    toastBuilder: (cancel) {
                      return CustomWidget(
                        cancelFunc: cancel,
                      );
                    },
                    enableSlideOff: enableSlideOff,
                    onlyOne: onlyOne,
                    crossPage: crossPage
                  );
                },
                child: Text("CustomNotification"),
              ),
              SwitchListTile(
                value: enableSlideOff,
                onChanged: (value) {
                  setState(() {
                    enableSlideOff = value;
                  });
                },
                title: Text("enableSlideOff: "),
              ),
              SwitchListTile(
                value: onlyOne,
                onChanged: (value) {
                  setState(() {
                    onlyOne = value;
                  });
                },
                title: Text("onlyOne: "),
              ),
              SwitchListTile(
                value: crossPage,
                onChanged: (value) {
                  setState(() {
                    crossPage = value;
                  });
                },
                title: Text("crossPage: "),
              ),
              ListTile(
                title: Text("duration:   ${seconds}s"),
                trailing: CupertinoSlider(
                  min: 1,
                  max: 20,
                  value: seconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      seconds = value.toInt();
                    });
                  },
                ),
              ),
              Divider(),
              Text("code"),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  _code,
                  textAlign: TextAlign.start,
                ),
              ),
              Divider(),
              Text("CustomWidget"),
              Divider(),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(10),
                child: Text(
                  _custom,
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _code = """
BotToast.showCustomNotification(
         duration: Duration(seconds: seconds),
         toastBuilder: (cancel) {
           return CustomWidget(
             cancelFunc: cancel,
           );
         },
         enableSlideOff: enableSlideOff,
         onlyOne: onlyOne,
         crossPage: crossPage
);
""";

String _custom = """
Card(
      child: Row(
        children: <Widget>[
          Expanded(
            child: IconButton(
                icon: Icon(Icons.favorite),
                color: loveMe ? Colors.redAccent : Colors.grey,
                onPressed: () {
                  setState(() {
                    loveMe = !loveMe;
                    BotToast.showText(
                        onlyOne: true,
                        text: loveMe ? "Yes, I love you.😘" : "No!!!!😫");
                  });
                }),
          ),
          IconButton(
            icon: Icon(Icons.cancel),
            color: loveMe ? Colors.redAccent : Colors.grey,
            onPressed: widget.cancelFunc,
          )
        ],
      ),
    );
""";
