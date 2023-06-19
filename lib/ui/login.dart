import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lms_fiverr/constants/app_colors.dart';
import 'package:lms_fiverr/constants/app_constants.dart';
import 'package:lms_fiverr/constants/app_fonts.dart';
import 'package:lms_fiverr/providers.dart';
import 'package:lms_fiverr/services/database.dart';
import 'package:lms_fiverr/ui/shared/custom_input_decoration.dart';

class Login extends HookConsumerWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState<bool>(false);
    final username = useState<String>('');
    final password = useState<String>('');

    return Scaffold(
      backgroundColor: Colors.lightGreen.shade300,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.BOX_PADDING_HORIZONTAL),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                      vertical: AppConstants.BOX_PADDING_HORIZONTAL),
                  child: Image.network(
                    'https://cdn-icons-png.flaticon.com/512/295/295128.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Benvenuto!',
                  style: AppFonts.text24Bold
                      .copyWith(color: AppColors.DOCTOR_BLUE),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: CustomInputDecoration.USERNAME_INPUT,
                  onChanged: (val) {
                    username.value = val;
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (val) {
                    password.value = val;
                  },
                  decoration: CustomInputDecoration.PASSWORD_INPUT,
                  obscureText: true,
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.BLACK.withOpacity(0.6),
                    ),
                  ),
                  onPressed: loading.value
                      ? null
                      : ([mounted = true]) async {
                          loading.value = true;

                          try {
                            final student = await Database()
                                .getStudentByUsername(username.value.trim(),
                                    password.value.trim());
                            ref
                                .watch(studentProvider.notifier)
                                .update((state) => student);
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(e.toString())));
                            }
                          }
                          loading.value = false;
                        },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: loading.value
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              color: AppColors.WHITE,
                            ),
                          )
                        : Text(
                            'Login',
                            style: AppFonts.text20.copyWith(),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
