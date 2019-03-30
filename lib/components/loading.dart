import 'dart:async';

import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:anibe_newapp/model/client.dart';
import 'package:anibe_newapp/components/overlay.dart';

typedef Future<Object> ProviderLoaderInit(BuildContext context);
typedef Widget ProviderLoaderSuccess(BuildContext context);
typedef Widget ProviderLoaderLoad(BuildContext context);

class DefaultLoader extends StatefulWidget {
  final ProviderLoaderInit initState;
  final ProviderLoaderSuccess renderLoad;
  final ProviderLoaderLoad renderSuccess;

  DefaultLoader({this.initState, this.renderLoad, this.renderSuccess});

  @override
  State createState() => _DefaultLoaderState();
}

class _DefaultLoaderState extends State<DefaultLoader> {
  final _key = GlobalKey<AsyncLoaderState>();

  @override
  Widget build(BuildContext context) {
    return AsyncLoader(
      key: _key,
      initState: () async {
        try {
          return await widget.initState(context);
        } catch (ex, stackTrace) {
          print(stackTrace);
          rethrow;
        }
      },
      renderLoad: () => widget.renderLoad(context),
      renderSuccess: ({data}) {
        try {
          return widget.renderSuccess(context);
        } catch (ex, stackTrace) {
          print(stackTrace);
          rethrow;
        }
      },
      renderError: ([error]) {
        print(error);
        return _buildError(context, error);
      },
    );
  }

  Center _buildError(BuildContext context, error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 32.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Ошибка",
              style: Theme
                .of(context)
                .textTheme
                .title,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: () => _key.currentState.reloadState(),
              color: Theme
                .of(context)
                .accentColor,
              colorBrightness: Brightness.dark,
              child: Text(
                "Повторить",
              ),
            )
          ],
        ),
      ),
    );
  }
}


class DelayedProgressIndicator extends StatefulWidget {
  final Duration delay;

  DelayedProgressIndicator({this.delay});

  @override
  _DelayedProgressIndicatorState createState() => _DelayedProgressIndicatorState();
}

class _DelayedProgressIndicatorState extends State<DelayedProgressIndicator> {
  var _show = false;

  @override
  void initState() {
    super.initState();
    _delay();
  }

  void _delay() async {
    await Future.delayed(widget.delay ?? Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _show = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _show ? Center(child: CircularProgressIndicator()) : Container();
  }
}

class LoadingScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DelayedProgressIndicator(),
      ),
    );
  }
}

class LoadingOverlay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).canvasColor.withAlpha(150),
      child: Center(
        child: Material(
          elevation: 24.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(width: 32.0),
                Flexible(
                  child: Text(
                    "Загрузка ...",
                    style: Theme.of(context).textTheme.subhead,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingErrorDialog extends StatelessWidget {
  final Object error;

  LoadingErrorDialog(this.error);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Ошибка"
      ),
      content: Text(_buildError()),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            "Ок"
          ),
        )
      ],
    );
  }

  String _buildError() {
    if (error is HttpException) {
      final httpError = error as HttpException;
      if (httpError.message.isNotEmpty) return httpError.message;
    }
    return error.toString();
  }
}


/// Function for showing full-screen loading overlays.
/// Starts overlay after [delay] timeout, that waits for [future] to complete.
/// If [future] not completed within [timeout], [TimeoutException] will be thrown.
Future<T> pushLoadingOverlay<T> ({
  @required BuildContext context,
  @required Future<T> future,
  Duration delay = const Duration(milliseconds: 500),
  Duration timeout = const Duration(seconds: 30),
}) async {
  try {
    return await future.timeout(delay);
  } on TimeoutException {
    // pass
  } catch (e) {
    return await showErrorDialog<T>(context, e);
  }

  final overlay = InheritedOverlay.push(context, (c) => LoadingOverlay());

  // todo cancel waiting if overlay was disposed

  Object error;

  try {
    return await future.timeout(timeout);
  } catch (e, stackTrace) {
    error = e;
    print(stackTrace);
  } finally {
    overlay.dispose();
  }

  return await showErrorDialog<T>(context, error);
}

Future<T> showErrorDialog<T>(BuildContext context, Object e) async {
  await showDialog(
    context: context,
    builder: (context) => LoadingErrorDialog(e)
  );
  throw e;
}
