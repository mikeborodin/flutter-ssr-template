import 'dart:js_interop';
import 'dispatch.dart';

@JS("dispatchMethod")
external set dispatchMethodExport(JSFunction value);

JSPromise<JSString> dispatchMethod(JSString url) {
  return dispatch(url.toDart).toJS;
}

void main(List<String> args) {
  dispatchMethodExport = dispatchMethod.toJS;
}
