/*
 * Copyright (c) 2019. Adithya Narasinghe
 */

/// Base Model class used to build all the models.
/// Supports model versioning & migration out of the box
abstract class Model {
  /// Verson of the model instance
  int _version;

  /// Construct a model
  ///
  /// Migrates the data into the new format based on the [_version] version of
  /// the model data
  Model(this._version) {
    migrate();
  }

  /// Migrate the data to the new format
  void migrate();
}
