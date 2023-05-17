
class Notification{
 Future _showNotification(Map<String, dynamic> message) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      
      importance: Importance.max,
      priority: Priority.high,
    );

    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
   ${message['data']['body']} for ${message['data']['body']}',
      platformChannelSpecifics,
      payload: 'Default_Sound',
    );
  }

  getTokenz() async {
    String token = await _firebaseMessaging.getToken();
    print(token);
  }

  Future selectNotification(String payload) async {
    await flutterLocalNotificationsPlugin.cancelAll();
    await notification_screen;
  }

  @override
  void sendNotification(List<User> son) {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
    super.initState();

    _firebaseMessaging.configure(
      onBackgroundMessage: myBackgroundHandler,
      onMessage: (Map<String, dynamic> message) async {
        for(i=0; i<son.length(); i++){
          title:son.uid;
          body:son.others,
        print("onMessage: $message");
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: 1,
                body:data();
                     {message['notification']['title']} for ${message['notification']['body']}'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            });
      },
      },
    );

    getTokenz();
  }
}