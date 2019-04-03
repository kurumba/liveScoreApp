/*
 * Copyright (c) 2019. Adithya Narasinghe
 */

/// Base Model class used to build all the models.
/// Supports model versioning & migration out of the box
abstract class Model {
  static const String FIELD_VERSION = "_version";

  static int get VERSION {
    throw Exception('Version should be defined in the extended object');
  }

  /// Version of the model instance
  int version;

  /// Construct a model
  ///
  /// Migrates the data into the new format based on the [version] version of
  /// the model data
  Model(this.version) {
    assert(this.version != null);
    _migrate();
  }

  /// Construct a model using json
  ///
  /// when parsing data from json, call this method to get the version from json
  Model.fromJson(Map<String, dynamic> json) : this(json[FIELD_VERSION]);

  /// Migrate the data to the new format
  void _migrate();

  /// Get the json representation of the Model
  Map<String, dynamic> fromJson() {
    Map<String, dynamic> json = new Map();

    json[FIELD_VERSION] = this.version;

    return json;
  }
}
