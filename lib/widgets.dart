library widgets;

import 'dart:async';
import 'dart:developer' show log;
import 'dart:io';
import 'dart:math' hide log;
import 'dart:ui';

import 'package:badges/badges.dart' as b;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'extensions.dart';
import 'raw.dart';
import 'services.dart';

part 'views/avatar_view.dart';

part 'views/axis_view.dart';

part 'views/button.dart';

part 'views/calendar_view.dart';

part 'views/category_view.dart';

part 'views/checkmark_view.dart';

part 'views/chooser_view.dart';

part 'views/content_view.dart';

part 'views/controller.dart';

part 'views/countdown_view.dart';

part 'views/dropdown_view.dart';

part 'views/edit_form.dart';

part 'views/edit_text.dart';

part 'views/expendable_text_view.dart';

part 'views/expensive_scroll_view.dart';

part 'views/flexible_view.dart';

part 'views/graph_view.dart';

part 'views/icon_view.dart';

part 'views/image_view.dart';

part 'views/linear_layout.dart';

part 'views/loader_view.dart';

part 'views/material_image_view.dart';

part 'views/navigation_view.dart';

part 'views/nullable_view.dart';

part 'views/option_view_builder.dart';

part 'views/progress_view.dart';

part 'views/radio_group.dart';

part 'views/rating_view.dart';

part 'views/recycler_view.dart';

part 'views/slide_image_view.dart';

part 'views/splash_view.dart';

part 'views/stack_layout.dart';

part 'views/stream_view.dart';

part 'views/tab_layout.dart';

part 'views/tab_view.dart';

part 'views/text_view.dart';

part 'views/titled_view.dart';

part 'views/toggle_builder.dart';

part 'views/toolbar_view.dart';

part 'views/view.dart';

part 'views/view_builder.dart';

part 'views/view_pager.dart';

part 'views/wrapper_view.dart';

part 'widgets/badge_button.dart';

part 'widgets/border_button.dart';

part 'widgets/future_button.dart';

part 'widgets/image_button.dart';

part 'widgets/material_icon.dart';

part 'widgets/quantity_button.dart';

part 'widgets/toggle_button.dart';

typedef OnPagingListener = Function(dynamic value);

extension TExtension<T> on T {
  T get logType {
    log("$runtimeType");
    return this;
  }

  T get logValue {
    log(toString());
    return this;
  }

  T get logValueType {
    log("${toString()} ($runtimeType)");
    return this;
  }
}

extension _ScrollControllerExtension on ScrollController {
  ScrollController paging({required OnPagingListener onListen}) {
    addListener(() {
      if (position.atEdge) {
        if (position.pixels != 0) {
          onListen.call(position.pixels);
        }
      }
    });
    return this;
  }
}
