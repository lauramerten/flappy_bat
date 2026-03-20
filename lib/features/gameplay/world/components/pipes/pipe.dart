import 'dart:ui';

import 'package:flame/components.dart';

/// Renders a single top or bottom pipe.
class Pipe extends PositionComponent {
  late final Sprite _sprite;
  final _PipePosition _position;

  /// Creates a top pipe whose anchor sits at its lower center edge.
  Pipe.top({required super.position}) : _position = _PipePosition.top;

  /// Creates a bottom pipe whose anchor sits at its upper center edge.
  Pipe.bottom({required super.position}) : _position = _PipePosition.bottom;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final String spritePath = switch (_position) {
      _PipePosition.top => "pipe/pipe-top.png",
      _PipePosition.bottom => "pipe/pipe-bottom.png",
    };

    _sprite = await Sprite.load(spritePath);

    anchor = switch (_position) {
      _PipePosition.top => .bottomCenter,
      _PipePosition.bottom => .topCenter,
    };

    final double ratio = _sprite.srcSize.y / _sprite.srcSize.x;
    final double width = 100;
    size = Vector2(width, width * ratio);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _sprite.render(canvas, position: .zero(), size: size);
  }
}

enum _PipePosition { top, bottom }
