import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

part 'hovered_widget.g.dart';

@hwidget
Widget _hoveredWidget({required Widget Function(bool isHovered) child}) {
  final isHover = useState(false);

  void _onEntered(bool isHovered) {
    isHover.value = isHovered;
  }

  return MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => _onEntered(true),
    onExit: (_) => _onEntered(false),
    child: child(isHover.value),
  );
}
