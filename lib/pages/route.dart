import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

typedef Widget PageInterceptor(BuildContext context, Map<String, List<String>> params, Widget inner);

final router = Router();

final _interceptors = <PageInterceptor>[];

void defineRoute(String path, HandlerFunc handler) {
  router.define(path,
    handler: Handler(
      handlerFunc: (context, params) {
        var page = handler(context, params);
        for (final interceptor in _interceptors) {
          page = interceptor(context, params, page);
        }
        return page;
      }
    )
  );
}

void addRouteInterceptor(PageInterceptor interceptor) {
  _interceptors.add(interceptor);
}

void pushRoute(BuildContext context, String path) {
  router.navigateTo(context, path, transition: TransitionType.fadeIn);
}

void replaceRoute(BuildContext context, String path) {
  router.navigateTo(context, path, replace: true, transition: TransitionType.fadeIn);
}

void resetRoute(BuildContext context, String path) {
  Navigator.popUntil(context, (route) => route.isFirst);
  replaceRoute(context, path);
}

void popRoute(BuildContext context) {
  Navigator.pop(context);
}
