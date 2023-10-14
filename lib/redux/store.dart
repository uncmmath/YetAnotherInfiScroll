import 'package:YetAnotherInfiScroll/redux/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import '../redux/app_state_combined_reducer.dart';
import 'package:redux/redux.dart';

Store<AppState> store = initStore();

initStore() {
  return Store(
    reducer,
    initialState: AppState(photoImages: []),
    middleware: [thunkMiddleware],
  );
}
