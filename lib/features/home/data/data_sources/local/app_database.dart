import 'dart:async';

import 'package:floor/floor.dart';
import 'package:flutter_clean_arch/features/home/data/data_sources/local/DAO/article_dao.dart';
import 'package:flutter_clean_arch/features/home/data/models/article_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [ArticleModel])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}