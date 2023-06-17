
import 'package:bookly/Features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(

      builder: (context ,state){
        if(state is FeaturedBooksSuccess){
        return  ListView.builder(
    padding: EdgeInsets.zero,
    itemCount: 10,
    itemBuilder: (context, index) {
    return  Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    // child: BookListViewItem(),
    child: BookListViewItem(bookModel: state.books[index]),
    );
    },
    );
  }
        else if (state is FeaturedBooksFailure){
          return CustomErrorWidget(errMessage: state.errMessage.toString());

        }
        else {
    return const Center(child: CircularProgressIndicator());
  }

      });
}}
