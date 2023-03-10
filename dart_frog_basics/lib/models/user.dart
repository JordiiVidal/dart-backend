import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'user.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class User {
  /// Constructor
  User({required this.name, required this.email});

  /// Factory constructor
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  ///Name
  final String name;

  /// Email
  final String email;


  /// `toJson` is the convention for a class to declare support for
  /// serialization to JSON. The implementation simply calls the private,
  /// generated helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
