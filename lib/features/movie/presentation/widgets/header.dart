import 'package:flutix_movie/core/commons/cubits/app_user/app_user_cubit.dart';
import 'package:flutix_movie/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppPallete.purpleColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
      child: BlocBuilder<AppUserCubit, AppUserState>(
        builder: (context, state) {
          String name = "User Flutix";
          int amount = 0;

          if (state is AppUserLoaded) {
            name = state.user.name;
            amount = state.user.amount;
          }

          return Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppPallete.grey300, width: 2)),
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white10),
                  // TODO: add feature to show image
                  child: const Icon(
                    Icons.sentiment_satisfied,
                    size: 40,
                    color: AppPallete.grey300,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      NumberFormat.currency(
                              locale: "id_ID", decimalDigits: 0, symbol: "IDR ")
                          .format(amount),
                      style: const TextStyle(
                          color: AppPallete.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
