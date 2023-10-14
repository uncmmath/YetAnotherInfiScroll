import '../flickr.photos/reducers/get_photos_reducer.dart';
import 'package:YetAnotherInfiScroll/redux/app_state.dart';

AppState reducer(AppState state, dynamic action) =>
    AppState(photoImages: getPhotoImagesReducer(state.photoImages, action));
