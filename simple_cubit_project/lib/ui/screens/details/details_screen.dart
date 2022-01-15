import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_cubit_project/cubit/details/details_cubit.dart';
import 'package:simple_cubit_project/ui/widgets/loading_screen.dart';

class DetailsScreen extends StatelessWidget {
  int? id;

  DetailsScreen({required this.id ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailsCubit>(context).fetchDetails(id!);
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Details'),
        ),
        body: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            if (state is! DetailsLoaded) {
              return LoadingScreen();
            }
            final details = (state as DetailsLoaded).details;
            return Center(
              child: Container(
                      margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 4),
                          borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child:  Text("Username: ${details!['username']}\n\n"
                            "Full Name: ${details!['name']}\n\n"
                            "Email: ${details!['email']}\n\n"
                            "Phone Number: ${details!['phone']}\n\n"
                            "Website: ${details!['website']}\n\n"
                            "Full Address: ${details!['address']['street']}, ${details!['address']['suite']}, ${details!['address']['city']}, ${details!['address']['zipcode']},\nCoordinates: ${details!['address']['geo']['lat']}, ${details!['address']['geo']['lng']}\n\n"
                            "Company: ${details!['company']['name']}",
                            style: TextStyle(fontSize: 16),),
                        ),
                      ),
            );
                })
    );
  }
}
