import 'package:bloc_api_handling/bloc/user_bloc.dart';
import 'package:bloc_api_handling/bloc/user_events.dart';
import 'package:bloc_api_handling/bloc/user_state.dart';
import 'package:bloc_api_handling/core/repo/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/service/connectivity_service.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(RepositoryProvider.of<Service>(context),
          RepositoryProvider.of<ConnectivityService>(context))
        ..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("User Date"),
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, state) {
            if (state is UserLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadedState) {
              return ListView.builder(
                  itemCount: state.mUserList.length,
                  itemBuilder: (_,position) {


              return  Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.mUserList[position].name),
                        Text(state.mUserList[position].email),
                        Text(
                          state.mUserList[position].address.zipcode.toString(),
                        ),
                      ],
                    ),
                ),
              );
              });
            }
             if (state is UserInternetState) {
               return const Text("no internet ");
             }
             return Container();
          },
        ),
      ),
    );
  }
}
