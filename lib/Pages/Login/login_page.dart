import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mc_queen_courier/AtomicWidgets/appbar_widget.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_orange_button.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_progreess_page.dart';
import 'package:mc_queen_courier/AtomicWidgets/atomic_textformfield.dart';
import 'package:mc_queen_courier/Pages/Login/login_mixin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 30.h),
          child: AtomicAppBar(
            title: "Giriş Yap",
            backIcon: false,
          ),
        ),
        body: StackProgressWidget(
          visibility: visibilty,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.h),
                child: Column(
                  children: [
                    SizedBox(height: 40.h),
                    Image.asset("images/app_icon.png"),
                    SizedBox(height: 40.h),
                    userNameWidget(),
                    SizedBox(height: 10.h),
                    passwordWidget(),
                    SizedBox(height: 10.h),
                    AtomicOrangeButton(
                        onPressed: () async {
                          visibilty.value = true;
                          await buttonProcess();
                          visibilty.value = false;
                        },
                        title: "Giriş Yap")
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  AtomicTextFormField passwordWidget() {
    return AtomicTextFormField(
      title: "Şifre",
      validator: (value) {
        if (value != null) {
          return value.length >= 6 ? null : "En az 6 karakter olmalıdır";
        }
        return null;
      },
      obscureText: true,
      prefixIcon: Icons.lock,
      onSaved: (newValue) {
        password = newValue!;
      },
    );
  }

  AtomicTextFormField userNameWidget() {
    return AtomicTextFormField(
      title: "T.C. Kimlik No",
      maxLength: 11,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      validator: (value) {
        return value != null ? null : "Boş geçilemez";
      },
      onSaved: (newValue) {
        userName = newValue!;
      },
      prefixIcon: Icons.person,
    );
  }
}
