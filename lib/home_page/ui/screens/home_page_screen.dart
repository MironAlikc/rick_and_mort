import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_mort/home_page/cubit/getcharacter_cubit.dart';
import 'package:rick_and_mort/home_page/ui/widgets/user_container.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetcharacterCubit>(context).getCharecter();

    String defaultImage =
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnLktbp1RXOlE4lQtsuDpyTpmbNuEgXb67MA&usqp=CAU';
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: BlocBuilder<GetcharacterCubit, GetcharacterState>(
                builder: (context, state) {
                  if (state is GetcharacterSuccess) {
                    final model = state.model.results;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: model?.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UserContainer(
                          id: '${model?[index].id}',
                          image: model?[index].image ?? defaultImage,
                          name: model?[index].name ?? '',
                          gender: model?[index].gender ?? '',
                          species: model?[index].status ?? '',
                          status: model?[index].status ?? '',
                        ),
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
