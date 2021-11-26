// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_variables.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthVariablesAdapter extends TypeAdapter<AuthVariables> {
  @override
  final int typeId = 0;

  @override
  AuthVariables read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthVariables(
      authToken: fields[0] as String,
      refreshToken: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AuthVariables obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.authToken)
      ..writeByte(1)
      ..write(obj.refreshToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthVariablesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
