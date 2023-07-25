import 'index.dart';

class ScaffoldScope extends InheritedWidget {
  const ScaffoldScope({
    super.key,
    required this.hasDrawer,
    required this.geometryNotifier,
    required super.child,
  });

  final bool hasDrawer;
  final ScaffoldGeometryNotifier geometryNotifier;

  @override
  bool updateShouldNotify(ScaffoldScope oldWidget) {
    return hasDrawer != oldWidget.hasDrawer;
  }
}

/// Geometry information for [Scaffold] components after layout is finished.
///
/// To get a [ValueNotifier] for the scaffold geometry of a given
/// [BuildContext], use [Scaffold.geometryOf].
///
/// The ScaffoldGeometry is only available during the paint phase, because
/// its value is computed during the animation and layout phases prior to painting.
///
/// For an example of using the [ScaffoldGeometry], see the [BottomAppBar],
/// which uses the [ScaffoldGeometry] to paint a notch around the
/// [FloatingActionButton].
///
/// For information about the [Scaffold]'s geometry that is used while laying
/// out the [FloatingActionButton], see [ScaffoldPrelayoutGeometry].
@immutable
class ScaffoldGeometry {
  /// Create an object that describes the geometry of a [Scaffold].
  const ScaffoldGeometry({
    this.bottomNavigationBarTop,
    this.floatingActionButtonArea,
  });

  /// The distance from the [Scaffold]'s top edge to the top edge of the
  /// rectangle in which the [Scaffold.bottomNavigationBar] bar is laid out.
  ///
  /// Null if [Scaffold.bottomNavigationBar] is null.
  final double? bottomNavigationBarTop;

  /// The [Scaffold.floatingActionButton]'s bounding rectangle.
  ///
  /// This is null when there is no floating action button showing.
  final Rect? floatingActionButtonArea;

  ScaffoldGeometry _scaleFloatingActionButton(double scaleFactor) {
    if (scaleFactor == 1.0) {
      return this;
    }

    if (scaleFactor == 0.0) {
      return ScaffoldGeometry(
        bottomNavigationBarTop: bottomNavigationBarTop,
      );
    }

    final Rect scaledButton = Rect.lerp(
      floatingActionButtonArea!.center & Size.zero,
      floatingActionButtonArea,
      scaleFactor,
    )!;
    return copyWith(floatingActionButtonArea: scaledButton);
  }

  /// Creates a copy of this [ScaffoldGeometry] but with the given fields replaced with
  /// the new values.
  ScaffoldGeometry copyWith({
    double? bottomNavigationBarTop,
    Rect? floatingActionButtonArea,
  }) {
    return ScaffoldGeometry(
      bottomNavigationBarTop:
          bottomNavigationBarTop ?? this.bottomNavigationBarTop,
      floatingActionButtonArea:
          floatingActionButtonArea ?? this.floatingActionButtonArea,
    );
  }
}

class ScaffoldGeometryNotifier extends ChangeNotifier
    implements ValueListenable<ScaffoldGeometry> {
  ScaffoldGeometryNotifier(this.geometry, this.context);

  final BuildContext context;
  double? floatingActionButtonScale;
  ScaffoldGeometry geometry;

  @override
  ScaffoldGeometry get value {
    assert(() {
      final RenderObject? renderObject = context.findRenderObject();
      if (renderObject == null || !renderObject.owner!.debugDoingPaint) {
        throw FlutterError(
          'Scaffold.geometryOf() must only be accessed during the paint phase.\n'
          'The ScaffoldGeometry is only available during the paint phase, because '
          'its value is computed during the animation and layout phases prior to painting.',
        );
      }
      return true;
    }());
    return geometry._scaleFloatingActionButton(floatingActionButtonScale!);
  }

  void _updateWith({
    double? bottomNavigationBarTop,
    Rect? floatingActionButtonArea,
    double? floatingActionButtonScale,
  }) {
    this.floatingActionButtonScale =
        floatingActionButtonScale ?? this.floatingActionButtonScale;
    geometry = geometry.copyWith(
      bottomNavigationBarTop: bottomNavigationBarTop,
      floatingActionButtonArea: floatingActionButtonArea,
    );
    notifyListeners();
  }
}
