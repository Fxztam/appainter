import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';

class ImportButton extends StatefulWidget {
  const ImportButton({Key? key}) : super(key: key);

  @override
  State<ImportButton> createState() => _ImportButtonState();
}

class _ImportButtonState extends State<ImportButton> {
  ProgressDialog? _dialog;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isImportingTheme) {
          _dialog = ProgressDialog(
            context,
            title: const Text('Import'),
            message: const Text('Importing theme data'),
            dismissable: false,
          )..show();
        } else if (!state.isImportingTheme) {
          _dialog?.dismiss();
        }
      },
      child: TextButton.icon(
        onPressed: () => context.read<HomeCubit>().themeImported(),
        icon: const FaIcon(
          FontAwesomeIcons.upload,
          color: Colors.white,
          size: 20,
        ),
        label: const Text(
          'Import',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}