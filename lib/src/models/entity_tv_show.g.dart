// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_tv_show.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityTvShowAdapter extends TypeAdapter<EntityTvShow> {
  @override
  final int typeId = 2;

  @override
  EntityTvShow read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntityTvShow(
      firstAirDate: fields[0] as String?,
      genreIds: (fields[1] as List?)?.cast<int>(),
      id: fields[2] as int?,
      name: fields[3] as String?,
      originCountry: (fields[4] as List?)?.cast<String>(),
      originalLanguage: fields[5] as String?,
      originalName: fields[6] as String?,
      overview: fields[7] as String?,
      popularity: fields[8] as double?,
      posterPath: fields[9] as String?,
      voteAverage: fields[10] as num?,
      voteCount: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EntityTvShow obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.firstAirDate)
      ..writeByte(1)
      ..write(obj.genreIds)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.originCountry)
      ..writeByte(5)
      ..write(obj.originalLanguage)
      ..writeByte(6)
      ..write(obj.originalName)
      ..writeByte(7)
      ..write(obj.overview)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.posterPath)
      ..writeByte(10)
      ..write(obj.voteAverage)
      ..writeByte(11)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityTvShowAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
