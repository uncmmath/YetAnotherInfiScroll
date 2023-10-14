import 'package:YetAnotherInfiScroll/flickr.photos/actions/get_photos_action.dart';
import 'package:YetAnotherInfiScroll/redux/store.dart';
import 'package:YetAnotherInfiScroll/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() async {
  runApp(initScreen());
  store.dispatch(getPhotosAction(1));
}

Widget initScreen() {
  return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yet Another Infi Scroll',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomeScreen(title: 'Yet Another Infi Scroll'),
      ));
}
