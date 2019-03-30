import 'package:flutter/widgets.dart';

/// Overlay, that can be placed at the top of the widget tree
/// and used to show full-screen overlays.
class InheritedOverlay extends StatefulWidget {
  final Widget child;

  InheritedOverlay({this.child});

  @override
  AppOverlayState createState() => AppOverlayState();

  static AppOverlayState of(BuildContext context) => context.ancestorStateOfType(TypeMatcher<AppOverlayState>()) as AppOverlayState;

  static OverlayHandle push(BuildContext context, WidgetBuilder overlay) => of(context).push(overlay);
}

class AppOverlayState extends State<InheritedOverlay> {
  final _items = <WidgetBuilder>[];

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[widget.child];
    children.addAll(_items.map((b) => b(context)));

    return Stack(
      fit: StackFit.expand,
      children: children,
    );
  }

  OverlayHandle push(WidgetBuilder overlay) {
    setState(() {
      _items.add(overlay);
    });
    return OverlayHandle(this, overlay);
  }

  void remove(WidgetBuilder overlay) {
    setState(() {
      _items.remove(overlay);
    });
  }
}

class OverlayHandle {
  final AppOverlayState _state;
  final WidgetBuilder _item;

  OverlayHandle(this._state, this._item);

  void dispose() {
    _state.remove(_item);
  }
}
