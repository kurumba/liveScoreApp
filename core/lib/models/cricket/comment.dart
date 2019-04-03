/*
 * Copyright (c) 2019. Adithya Narasinghe
 */

import 'package:core/models/base/model.dart';

class Comment extends Model {
  /// Text identifiers for parsing through a map and creating a map.
  /// Ex: json
  static const String FIELD_TEXT = 'text';
  static const String FIELD_TIMESTAMP = 'timestamp';

  /// Current version of the [Comment].
  static int get VERSION => 1;

  /// Text of the [Comment].
  final String text;

  /// Time the [Comment] was created.
  final DateTime time;

  /// Timestamp(in milliseconds) the [Comment] was created.
  int get timestamp => time.millisecond;

  /// Construct an instance of [Comment] passing the values.
  Comment(this.text, this.time) : super(VERSION);

  /// Construct an instance of [Comment] using a map.
  /// Ex: json
  Comment.fromJson(Map<String, dynamic> json)
      : this.text = json[FIELD_TEXT],
        this.time = DateTime.fromMillisecondsSinceEpoch(json[FIELD_TIMESTAMP],
            isUtc: true),
        super.fromJson(json);

  /// Migration logic for [Comment]
  @override
  void _migrate() {}

  /// Get a map of values for the [Comment] instance.
  @override
  Map<String, dynamic> fromJson() {
    Map<String, dynamic> json = super.fromJson();

    json[FIELD_TEXT] = this.text;
    json[FIELD_TIMESTAMP] = this.timestamp;

    return json;
  }
}
