// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityMovieAdapter extends TypeAdapter<EntityMovie> {
  @override
  final int typeId = 1;

  @override
  EntityMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityMovie(
      adult: fields[0] as bool?,
      genreIds: (fields[1] as List?)?.cast<int>(),
      id: fields[2] as int?,
      originalLanguage: fields[3] as String?,
      originalTitle: fields[4] as String?,
      overview: fields[5] as String?,
      popularity: fields[6] as double?,
      releaseDate: fields[7] as String?,
      title: fields[8] as String?,
      voteAverage: fields[9] as double?,
      voteCount: fields[10] as int?,
      posterPath: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EntityMovie obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.genreIds)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.overview)
      ..writeByte(6)
      ..write(obj.popularity)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.title)
      ..writeByte(9)
      ..write(obj.voteAverage)
      ..writeByte(10)
      ..write(obj.voteCount)
      ..writeByte(11)
      ..write(obj.posterPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
