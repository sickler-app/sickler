// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_preferences.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWaterPreferencesCollection on Isar {
  IsarCollection<WaterPreferences> get waterPreferences => this.collection();
}

const WaterPreferencesSchema = CollectionSchema(
  name: r'WaterPreferences',
  id: -4671282499132812208,
  properties: {
    r'dailyGoal': PropertySchema(
      id: 0,
      name: r'dailyGoal',
      type: IsarType.long,
    ),
    r'logAmount': PropertySchema(
      id: 1,
      name: r'logAmount',
      type: IsarType.long,
    ),
    r'unit': PropertySchema(
      id: 2,
      name: r'unit',
      type: IsarType.string,
      enumMap: _WaterPreferencesunitEnumValueMap,
    )
  },
  estimateSize: _waterPreferencesEstimateSize,
  serialize: _waterPreferencesSerialize,
  deserialize: _waterPreferencesDeserialize,
  deserializeProp: _waterPreferencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _waterPreferencesGetId,
  getLinks: _waterPreferencesGetLinks,
  attach: _waterPreferencesAttach,
  version: '3.1.0+1',
);

int _waterPreferencesEstimateSize(
  WaterPreferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.unit;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _waterPreferencesSerialize(
  WaterPreferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.dailyGoal);
  writer.writeLong(offsets[1], object.logAmount);
  writer.writeString(offsets[2], object.unit?.name);
}

WaterPreferences _waterPreferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WaterPreferences(
    dailyGoal: reader.readLongOrNull(offsets[0]),
    logAmount: reader.readLongOrNull(offsets[1]),
    unit:
        _WaterPreferencesunitValueEnumMap[reader.readStringOrNull(offsets[2])],
  );
  return object;
}

P _waterPreferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (_WaterPreferencesunitValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _WaterPreferencesunitEnumValueMap = {
  r'pound': r'pound',
  r'ounce': r'ounce',
  r'kilogram': r'kilogram',
  r'gram': r'gram',
  r'milligram': r'milligram',
  r'kilometres': r'kilometres',
  r'metres': r'metres',
  r'centimetres': r'centimetres',
  r'millimetres': r'millimetres',
  r'miles': r'miles',
  r'inches': r'inches',
  r'feet': r'feet',
  r'litres': r'litres',
  r'millilitres': r'millilitres',
  r'centilitres': r'centilitres',
  r'gallons': r'gallons',
};
const _WaterPreferencesunitValueEnumMap = {
  r'pound': Units.pound,
  r'ounce': Units.ounce,
  r'kilogram': Units.kilogram,
  r'gram': Units.gram,
  r'milligram': Units.milligram,
  r'kilometres': Units.kilometres,
  r'metres': Units.metres,
  r'centimetres': Units.centimetres,
  r'millimetres': Units.millimetres,
  r'miles': Units.miles,
  r'inches': Units.inches,
  r'feet': Units.feet,
  r'litres': Units.litres,
  r'millilitres': Units.millilitres,
  r'centilitres': Units.centilitres,
  r'gallons': Units.gallons,
};

Id _waterPreferencesGetId(WaterPreferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _waterPreferencesGetLinks(WaterPreferences object) {
  return [];
}

void _waterPreferencesAttach(
    IsarCollection<dynamic> col, Id id, WaterPreferences object) {}

extension WaterPreferencesQueryWhereSort
    on QueryBuilder<WaterPreferences, WaterPreferences, QWhere> {
  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WaterPreferencesQueryWhere
    on QueryBuilder<WaterPreferences, WaterPreferences, QWhereClause> {
  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension WaterPreferencesQueryFilter
    on QueryBuilder<WaterPreferences, WaterPreferences, QFilterCondition> {
  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dailyGoal',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dailyGoal',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dailyGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dailyGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dailyGoal',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      dailyGoalBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dailyGoal',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logAmount',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logAmount',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      logAmountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unit',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitEqualTo(
    Units? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitGreaterThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitLessThan(
    Units? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitBetween(
    Units? lower,
    Units? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: '',
      ));
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterFilterCondition>
      unitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unit',
        value: '',
      ));
    });
  }
}

extension WaterPreferencesQueryObject
    on QueryBuilder<WaterPreferences, WaterPreferences, QFilterCondition> {}

extension WaterPreferencesQueryLinks
    on QueryBuilder<WaterPreferences, WaterPreferences, QFilterCondition> {}

extension WaterPreferencesQuerySortBy
    on QueryBuilder<WaterPreferences, WaterPreferences, QSortBy> {
  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      sortByDailyGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoal', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      sortByDailyGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoal', Sort.desc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      sortByLogAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logAmount', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      sortByLogAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logAmount', Sort.desc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension WaterPreferencesQuerySortThenBy
    on QueryBuilder<WaterPreferences, WaterPreferences, QSortThenBy> {
  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByDailyGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoal', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByDailyGoalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dailyGoal', Sort.desc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByLogAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logAmount', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByLogAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logAmount', Sort.desc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QAfterSortBy>
      thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension WaterPreferencesQueryWhereDistinct
    on QueryBuilder<WaterPreferences, WaterPreferences, QDistinct> {
  QueryBuilder<WaterPreferences, WaterPreferences, QDistinct>
      distinctByDailyGoal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dailyGoal');
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QDistinct>
      distinctByLogAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logAmount');
    });
  }

  QueryBuilder<WaterPreferences, WaterPreferences, QDistinct> distinctByUnit(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit', caseSensitive: caseSensitive);
    });
  }
}

extension WaterPreferencesQueryProperty
    on QueryBuilder<WaterPreferences, WaterPreferences, QQueryProperty> {
  QueryBuilder<WaterPreferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WaterPreferences, int?, QQueryOperations> dailyGoalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dailyGoal');
    });
  }

  QueryBuilder<WaterPreferences, int?, QQueryOperations> logAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logAmount');
    });
  }

  QueryBuilder<WaterPreferences, Units?, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
