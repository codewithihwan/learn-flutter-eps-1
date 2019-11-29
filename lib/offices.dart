import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

part 'offices.g.dart';

@JsonSerializable()
class OfficesList{
  OfficesList({this.offices});
  final List<Office> offices;
  factory OfficesList.fromJson(Map<String, dynamic> json) => _$OfficesListFromJson(json);
  Map<String, dynamic> toJson() => _$OfficesListToJson(this);
}

@JsonSerializable()
class Office{
  Office({this.address, this.name, this.image});

  final String address;
  final String image;
  final String name;

  factory Office.fromJson(Map<String, dynamic> json) => _$OfficeFromJson(json);
  Map<String, dynamic> toJson() => _$OfficeToJson(this);
}

Future<OfficesList> getOfficeList() async{
  const url = 'https://about.google/static/data/locations.json';
  final response = await http.get(url);
  if(response.statusCode == 200){
    return OfficesList.fromJson(json.decode(response.body));
  }else{
    throw HttpException('Error ${response.reasonPhrase}', uri: Uri.parse(url));
  }
}