import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.username,
    required super.password,
  });

  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      username: entity.username,
      password: entity.password,
    );
  }
}

