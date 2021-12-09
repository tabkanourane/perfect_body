// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tracker _$TrackerFromJson(Map<String, dynamic> json, [String date]) {
  var currentDate = DateTime.now().day.toString() +
      "-" +
      DateTime.now().month.toString() +
      "-" +
      DateTime.now().year.toString();
  return Tracker(
    json['name'] as String,
    json['sex'] as String,
    json['metric'] as bool,
    (json['height'] as num)?.toDouble(),
    (json['weight'] as num)?.toDouble(),
    json['age'] as int,
    (json['activityLevel'] as num)?.toDouble(),
    json['goal'] as String,
    ( Map<String,dynamic>.from(json['personalNutrients']))?.map(
      (k, e) => MapEntry(k, (e as num)?.toDouble()),
    ),
    (json[currentDate] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          (e as List)
              ?.map((e) => e == null
                  ? null
                  : TrackedFood.fromJson(e as Map<String, dynamic>))
              ?.toList()),
    ),
    (json['userFoods'] as List)
        ?.map((e) =>
            e == null ? null : TrackedFood.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TrackerToJson(Tracker instance) => <String, dynamic>{
      'name': instance.name,
      'metric': instance.metric,
      'sex': instance.sex,
      'weight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'activityLevel': instance.activityLevel,
      'goal': instance.goal,
      'personalNutrients': instance.personalNutrients,
      'meals': instance.meals,
      'directory': instance.directory,
    };
