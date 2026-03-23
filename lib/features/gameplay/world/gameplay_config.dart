/// Shared world configuration values.
abstract final class WorldConfig {
  /// Fixed camera width of the gameplay world.
  static const double width = 600;

  /// Fixed camera height of the gameplay world.
  static const double height = 1000;
}

/// Shared pipe gameplay configuration values.
abstract final class PipeConfig {
  /// Horizontal distance between consecutive pipe pairs.
  static const double distance = 400;

  /// Width of a rendered pipe sprite.
  static const double width = 100;

  /// Vertical gap between the top and bottom pipes.
  static const double gap = 250;

  /// Horizontal movement speed of the pipe pairs.
  static const double speed = 270;

  /// Vertical range used for randomized pipe placement.
  static const double spawnArea = 650;
}

/// Shared score trigger configuration values.
abstract final class ScoreTriggerConfig {
  /// Width of the invisible scoring trigger.
  static const double width = 10;

  /// Height of the invisible scoring trigger.
  static const double height = PipeConfig.gap;

  /// Horizontal offset of the score trigger inside a pipe pair.
  static const double offsetX = 30;
}

/// Shared bat gameplay configuration values.
abstract final class BatConfig {
  /// Render width of the bat sprite.
  static const double width = 100;

  /// Downward acceleration applied to the bat.
  static const double gravity = 1400;

  /// Upward impulse applied when the bat jumps.
  static const double jumpForce = -530;
}
