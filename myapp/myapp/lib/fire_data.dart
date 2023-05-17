import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:myapp/notification.dart';
import 'package:myapp/user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class User {

  final String fname;
  final String lname;
  final String uid;
  final String ch_disease;
  final String bdate;
  final String medicine;

  const User({
    required this.fname,
    required this.lname,
     required this.uid,
    required this.ch_disease,
     required this.bdate,
    required this.medicine,
  });

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      uid: map['uid'] ?? '',
      ch_disease: map['ch_disease'] ?? '',
      bdate: map['bdate'] ?? '',
      medicine: map['medicine'] ?? '',
    );
  }
  final List<User> list = [];

  getUsers() async {
    final snapshot = await FirebaseDatabase.instance.ref('user').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = User.fromMap(value);
      list.add(user);
    });
  }

  final List<User> list1 = [];
  getUsers1() async {
    final snapshot = await FirebaseDatabase.instance.ref('user').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = User.fromMap(value.uid);
      list1.add(user);
    });

  }

    final List<User> list2 = [];
  getUsers2() async {
    String Token=getToken();
    List1.request(){
    Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission uid.request.permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
    }
    });

      final map = Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final data = User.fromMap(value.uid.position);
      list2.add(data);
    });
  }



  final List<User> myposition = [];
  () async {
    {
    Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
    }
    });

    final map = Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final position = User.fromMap(value);
      myposition.add(position);
    });


    void close(){

      for(var i=1; i<list2.length() ; i++){
      double distance[i] = await Geolocator.distanceBetween(
                   String s1=myposition.position;
                  String s2=list2.data;
                  );
    }
    if(distance[i]<=450){
      final List<User> son = [];
  getUsers5() async {
    final snapshot = await FirebaseDatabase.instance.ref('user').get();

    final map = snapshot.value as Map<dynamic, dynamic>;

    map.forEach((key, value) {
      final user = User.fromMap(value.uid, value.fname, value.lname, value.ch_disease, value.bdate, value.medicine);
      son.add(user);
    });

  }
    }

    }
    sendNotification(List son);
    
  
  } 
}