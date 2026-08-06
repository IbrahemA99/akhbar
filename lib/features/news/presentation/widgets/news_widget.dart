import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'card_item.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = HomeCubit.get(context);

        if (state is GetNewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is GetNewsErrorState) {
          return const Center(
            child: Text("Something went wrong"),
          );
        }

        final articles = cubit.newsEntity?.articles ?? [];

        return ListView.builder(
          itemBuilder: (context, index) {
            return CardItem(
              article: articles[index],
            );
          },
          itemCount: articles.length,
        );
      },
    );
  }
}