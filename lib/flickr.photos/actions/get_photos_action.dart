import 'package:YetAnotherInfiScroll/flickr.photos/models/photo.dart';
import 'package:YetAnotherInfiScroll/redux/store.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'photos_action.dart';

ThunkAction getPhotosAction(int page) {
  return (Store store) async {
    Uri uri = Uri.parse(
        "https://www.flickr.com/services/rest/?method=flickr.photos.getPopular&"
        "api_key=889e809e01552807e5a524aaa7dbcdf9&"
        "format=json&"
        "user_id=28330648@N03&"
        "page=$page&"
        "per_page=10");
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      Exception('Request failed with status: ${response.statusCode}.');
    }
    var body = "";
    if (response.body.startsWith("jsonFlickrApi(")) {
      body = response.body.substring(14, response.body.length - 1);
    }
    PhotoData photoData = PhotoData.fromJson(body);
    for (Photo photo in photoData.photoPage.photos) {
      store.dispatch(getPhotoImageAction(photo.server, photo.id, photo.secret));
    }
  };
}

ThunkAction<Image> getPhotoImageAction(
    String serverId, String photoId, String secret) {
  return (Store localStore) async {
    String url =
        'https://live.staticflickr.com/$serverId/${photoId}_$secret.jpg';
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    if (response.statusCode != 200) {
      Exception('Request failed with status: ${response.statusCode}.');
    }
    List<PhotoImage> photoImages = store.state.photoImages;
    photoImages.add(PhotoImage(image: Image.network(url)));
    localStore.dispatch(PhotoImagesAction(photoImages: photoImages));
  };
}
