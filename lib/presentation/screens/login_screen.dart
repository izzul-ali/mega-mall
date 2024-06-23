import 'package:ecommerce/core/config/color.dart';
import 'package:ecommerce/core/helper/validation.dart';
import 'package:ecommerce/data/model/auth_model.dart';
import 'package:ecommerce/presentation/bloc/auth/auth_bloc.dart';
import 'package:ecommerce/presentation/widget/common/app_button.dart';
import 'package:ecommerce/presentation/widget/common/input_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool hidePassword = true;

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(
        AuthLogin(
          auth: Auth(
            emailOrPhoneNumber: _emailPhoneController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailPhoneController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              'Welcome back to\nMega Mall',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Silahkan masukan data untuk login',
              style: TextStyle(color: AppColor.halfGrey),
            ),
            const SizedBox(height: 40),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  InputForm(
                    controller: _emailPhoneController,
                    title: 'Email/Phone',
                    placeholder: 'Masukan Alamat Email/ No Telepon Anda',
                    validation: AppValidation.validateEmailOrPhoneNumber,
                    onFieldSubmitted: (p0) {
                      _submitForm(context);
                    },
                  ),
                  const SizedBox(height: 20),
                  InputForm(
                    controller: _passwordController,
                    title: 'Password',
                    placeholder: 'Masukan Kata Sandi Akun',
                    obsecureText: hidePassword,
                    validation: AppValidation.validatePassword,
                    onFieldSubmitted: (p0) {
                      _submitForm(context);
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword
                            ? CupertinoIcons.eye_slash_fill
                            : Icons.remove_red_eye,
                        color: AppColor.halfGrey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthLoaded) {
                        return context.go('/');
                      }
                    },
                    builder: (context, state) {
                      return AppButton(
                        onPress: () =>
                            state is AuthLoading ? null : _submitForm(context),
                        title: 'Submit',
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
