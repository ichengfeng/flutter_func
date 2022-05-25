import 'package:flutter/material.dart';
import 'handy_style.dart';

typedef IndexPathWidgetBuilder = Widget Function(BuildContext context, IndexPath indexPath);

typedef SectionBuilder = int Function(int section);

typedef ListViewSuperWidgetBuilder = Widget Function(BuildContext context, Widget scrollWidget);
