import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/presentation/widget/common/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoaded) {
              return state.auth != null
                  ? AppButton(
                      title: 'Logout',
                      onPress: () {
                        BlocProvider.of<AuthBloc>(context).add(AuthLogout(
                          emailOrPhoneNumber:
                              state.auth?.emailOrPhoneNumber ?? '',
                        ));
                      },
                    )
                  : _renderMustLogin(context);
            }

            if (state is AuthLoading || state is AuthLoadingLogout) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return _renderMustLogin(context);
          },
        ),
      ),
    );
  }

  Column _renderMustLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Anda perlu masuk terlebih dahulu',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Silahkan login/register telebih dahulu untuk melakukan transaksi',
          style: TextStyle(color: AppColor.halfGrey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        AppButton(
          title: 'Login',
          onPress: () {
            context.go('/login');
          },
        ),
      ],
    );
  }
}
