// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relaxation_games.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetRelaxation_gamesCollection on Isar {
  IsarCollection<Relaxation_games> get relaxation_games => this.collection();
}

const Relaxation_gamesSchema = CollectionSchema(
  name: r'Relaxation_games',
  id: -7755929036810132359,
  properties: {},
  estimateSize: _relaxation_gamesEstimateSize,
  serialize: _relaxation_gamesSerialize,
  deserialize: _relaxation_gamesDeserialize,
  deserializeProp: _relaxation_gamesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _relaxation_gamesGetId,
  getLinks: _relaxation_gamesGetLinks,
  attach: _relaxation_gamesAttach,
  version: '3.1.0+1',
);

int _relaxation_gamesEstimateSize(
  Relaxation_games object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _relaxation_gamesSerialize(
  Relaxation_games object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
Relaxation_games _relaxation_gamesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Relaxation_games();
  object.id = id;
  return object;
}

P _relaxation_gamesDeserializeProp<P>(
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

Id _relaxation_gamesGetId(Relaxation_games object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _relaxation_gamesGetLinks(Relaxation_games object) {
  return [];
}

void _relaxation_gamesAttach(
    IsarCollection<dynamic> col, Id id, Relaxation_games object) {
  object.id = id;
}

extension Relaxation_gamesQueryWhereSort
    on QueryBuilder<Relaxation_games, Relaxation_games, QWhere> {
  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension Relaxation_gamesQueryWhere
    on QueryBuilder<Relaxation_games, Relaxation_games, QWhereClause> {
  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhereClause>
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

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterWhereClause> idBetween(
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

extension Relaxation_gamesQueryFilter
    on QueryBuilder<Relaxation_games, Relaxation_games, QFilterCondition> {
  QueryBuilder<Relaxation_games, Relaxation_games, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterFilterCondition>
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

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterFilterCondition>
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

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterFilterCondition>
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
}

extension Relaxation_gamesQueryObject
    on QueryBuilder<Relaxation_games, Relaxation_games, QFilterCondition> {}

extension Relaxation_gamesQueryLinks
    on QueryBuilder<Relaxation_games, Relaxation_games, QFilterCondition> {}

extension Relaxation_gamesQuerySortBy
    on QueryBuilder<Relaxation_games, Relaxation_games, QSortBy> {}

extension Relaxation_gamesQuerySortThenBy
    on QueryBuilder<Relaxation_games, Relaxation_games, QSortThenBy> {
  QueryBuilder<Relaxation_games, Relaxation_games, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Relaxation_games, Relaxation_games, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension Relaxation_gamesQueryWhereDistinct
    on QueryBuilder<Relaxation_games, Relaxation_games, QDistinct> {}

extension Relaxation_gamesQueryProperty
    on QueryBuilder<Relaxation_games, Relaxation_games, QQueryProperty> {
  QueryBuilder<Relaxation_games, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
