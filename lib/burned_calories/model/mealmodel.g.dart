// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mealmodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealModel _$MealModelFromJson(Map<String, dynamic> json) {
  return MealModel(
    json['mealName'] as String,
    (json['foods'] as List)
        ?.map((e) =>
            e == null ? null : TrackedFood.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MealModelToJson(MealModel instance) => <String, dynamic>{
      'mealName': instance.mealName,
      'foods': instance.foods,
    };
