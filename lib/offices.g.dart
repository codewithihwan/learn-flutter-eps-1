// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfficesList _$OfficesListFromJson(Map<String, dynamic> json) {
  return OfficesList(
    offices: (json['offices'] as List)
        ?.map((e) =>
            e == null ? null : Office.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OfficesListToJson(OfficesList instance) =>
    <String, dynamic>{
      'offices': instance.offices,
    };

Office _$OfficeFromJson(Map<String, dynamic> json) {
  return Office(
    address: json['address'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$OfficeToJson(Office instance) => <String, dynamic>{
      'address': instance.address,
      'image': instance.image,
      'name': instance.name,
    };
