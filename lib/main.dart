import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_mort/gio_setings/gio_setings.dart';
import 'package:rick_and_mort/home_page/cubit/getcharacter_cubit.dart';
import 'package:rick_and_mort/home_page/repositories/get_character_repo.dart';
import 'package:rick_and_mort/home_page/ui/screens/home_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (BuildContext context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (BuildContext context) => GetCharacterRepo(
              dio: RepositoryProvider.of<DioSettings>(context).dio),
        ),
      ],
      child: BlocProvider(
        create: (context) => GetcharacterCubit(
          repo: RepositoryProvider.of<GetCharacterRepo>(context),
        ),
        child: const MaterialApp(
          title: 'Flutter Demo',
          home: HomePageScreen(),
        ),
      ),
    );
  }
}
