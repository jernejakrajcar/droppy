// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_tracker.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMood_trackerCollection on Isar {
  IsarCollection<Mood_tracker> get mood_trackers => this.collection();
}

const Mood_trackerSchema = CollectionSchema(
  name: r'Mood_tracker',
  id: 3988262928523907161,
  properties: {},
  estimateSize: _mood_trackerEstimateSize,
  serialize: _mood_trackerSerialize,
  deserialize: _mood_trackerDeserialize,
  deserializeProp: _mood_trackerDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _mood_trackerGetId,
  getLinks: _mood_trackerGetLinks,
  attach: _mood_trackerAttach,
  version: '3.1.0+1',
);

int _mood_trackerEstimateSize(
  Mood_tracker object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _mood_trackerSerialize(
  Mood_tracker object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Mood_tracker _mood_trackerDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Mood_tracker();
  object.id = id;
  return object;
}

P _mood_trackerDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mood_trackerGetId(Mood_tracker object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mood_trackerGetLinks(Mood_tracker object) {
  return [];
}

void _mood_trackerAttach(
    IsarCollection<dynamic> col, Id id, Mood_tracker object) {
  object.id = id;
}

extension Mood_trackerQueryWhereSort
    on QueryBuilder<Mood_tracker, Mood_tracker, QWhere> {
  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Mood_trackerQueryWhere
    on QueryBuilder<Mood_tracker, Mood_tracker, QWhereClause> {
  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterWhereClause> idBetween(
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

extension Mood_trackerQueryFilter
    on QueryBuilder<Mood_tracker, Mood_tracker, QFilterCondition> {
  QueryBuilder<Mood_tracker, Mood_tracker, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterFilterCondition> idBetween(
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
}

extension Mood_trackerQueryObject
    on QueryBuilder<Mood_tracker, Mood_tracker, QFilterCondition> {}

extension Mood_trackerQueryLinks
    on QueryBuilder<Mood_tracker, Mood_tracker, QFilterCondition> {}

extension Mood_trackerQuerySortBy
    on QueryBuilder<Mood_tracker, Mood_tracker, QSortBy> {}

extension Mood_trackerQuerySortThenBy
    on QueryBuilder<Mood_tracker, Mood_tracker, QSortThenBy> {
  QueryBuilder<Mood_tracker, Mood_tracker, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Mood_tracker, Mood_tracker, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension Mood_trackerQueryWhereDistinct
    on QueryBuilder<Mood_tracker, Mood_tracker, QDistinct> {}

extension Mood_trackerQueryProperty
    on QueryBuilder<Mood_tracker, Mood_tracker, QQueryProperty> {
  QueryBuilder<Mood_tracker, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
