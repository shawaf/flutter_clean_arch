import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_clean_arch/features/home/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:flutter_clean_arch/features/home/presentation/widgets/article_tile.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/article.dart';

class DailyNewsPage extends StatelessWidget {
  const DailyNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
        create: (BuildContext context) => sl()..add(const GetArticlesEvent()),
        child: Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(),
        ));
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "News Feed",
      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    ),
    actions: [
      GestureDetector(
        onTap: () => _onShowSavedArticlesViewTapped(context),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          child: Icon(Icons.bookmark, color: Colors.black),        ),
      )
    ],
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticlesBloc, RemoteArticleState>(
    builder: (BuildContext context, RemoteArticleState state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleFailed) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Failed To Load The Data ${state.error?.message ?? ""}"),
              const SizedBox(
                height: 20,
              ),
              const IconButton(
                  onPressed: onClickRefresh, icon: Icon((Icons.refresh)))
            ],
          ),
        );
      }
      if (state is RemoteArticleSuccess) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index] ,
              onArticlePressed: (article) => _onArticlePressed(context,article),
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox(
        height: 50,
      );
    },
  );
}

void onClickRefresh() {
  print("Refresh the list");
}

void _onArticlePressed(BuildContext context, ArticleEntity article) {
  Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
}

void _onShowSavedArticlesViewTapped(BuildContext context) {
  Navigator.pushNamed(context, '/SavedArticles');
}