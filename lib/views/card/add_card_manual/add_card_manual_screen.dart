import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/views/card/add_card_manual/bloc/add_card_manual_bloc.dart';
import 'package:wundu/views/card/add_card_manual/models/add_card_manual_model.dart';
import 'package:wundu/views/card/add_card_manual/widgets/confirm_dialog.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_text_form_field.dart';

class AddCardManualScreen extends StatefulWidget {
  const AddCardManualScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<AddCardManualBloc>(
      create: (context) => AddCardManualBloc(AddCardManualState(
        addCardManualModelObj: AddCardManualModel(),
      ))
        ..add(AddCardManualInitialEvent()),
      child: AddCardManualScreen(),
    );
  }

  @override
  State<AddCardManualScreen> createState() => _AddCardManualScreenState();
}

class _AddCardManualScreenState extends State<AddCardManualScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cardNameController = TextEditingController();
  final FocusNode _cardNumberFocus = FocusNode();
  final FocusNode _expiryDateFocus = FocusNode();
  final FocusNode _cardNameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cardNameController.dispose();
    _cardNumberFocus.dispose();
    _expiryDateFocus.dispose();
    _cardNameFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCardManualBloc, AddCardManualState>(
      listener: (context, state) {
        if (state.isSubmitted) {
          // Show confirmation dialog
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog.builder(context);
            },
          );
        }

        if (state.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: appTheme.blueGray50,
          appBar: AppBar(
            backgroundColor: appTheme.blueGray50,
            elevation: 0,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              'Adicionar Cartão',
              style: CustomTextStyles.titleMediumBluegray900,
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card preview
                      Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 212, 0, 1),
                              Color.fromRGBO(255, 114, 94, 1),
                              Color.fromRGBO(229, 148, 0, 1),
                            ],
                            stops: [
                              0.0203,
                              0.5069,
                              1.0
                            ], // Percentuais das cores
                            transform:
                                GradientRotation(73.64 * (3.1415926535 / 180)),
                          ),
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                        padding: EdgeInsets.all(16.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Chip
                            CustomImageView(
                              imagePath: ImageConstant
                                  .logo, // Caminho do logotipo da aplicação
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(
                                  0.5), // Ajuste a opacidade conforme necessário
                            ),
                            // Card number
                            Text(
                              state.addCardManualModelObj.cardNumber
                                          ?.isNotEmpty ==
                                      true
                                  ? _formatCardNumber(
                                      state.addCardManualModelObj.cardNumber!)
                                  : '**** **** **** ****',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.h,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Expiry date
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'VALIDADE',
                                      style: TextStyle(
                                        // ignore: deprecated_member_use
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 10.h,
                                      ),
                                    ),
                                    Text(
                                      state.addCardManualModelObj.expiryDate
                                                  ?.isNotEmpty ==
                                              true
                                          ? state
                                              .addCardManualModelObj.expiryDate!
                                          : 'MM/AA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.h,
                                      ),
                                    ),
                                  ],
                                ),
                                // Logo
                                Container(
                                  height: 40.h,
                                  width: 60.h,
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8.h),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      // Form fields
                      Text(
                        'Número do Cartão',
                        style:
                            CustomTextStyles.titleSmallInterBluegray900SemiBold,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        controller: _cardNumberController,
                        focusNode: _cardNumberFocus,
                        hintText: '0000 0000 0000 0000',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          _CardNumberFormatter(),
                        ],
                        onChanged: (value) {
                          context.read<AddCardManualBloc>().add(
                                AddCardNumberChangedEvent(
                                    value.replaceAll(' ', '')),
                              );
                        },
                        validator: (value) {
                          if (!state.addCardManualModelObj.isValidCardNumber) {
                            return 'Número de cartão inválido';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Data de Expiração',
                        style:
                            CustomTextStyles.titleSmallInterBluegray900SemiBold,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        controller: _expiryDateController,
                        focusNode: _expiryDateFocus,
                        hintText: 'MM/AA',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          _ExpiryDateFormatter(),
                        ],
                        onChanged: (value) {
                          context.read<AddCardManualBloc>().add(
                                AddExpiryDateChangedEvent(value),
                              );
                        },
                        validator: (value) {
                          if (!state.addCardManualModelObj.isValidExpiryDate) {
                            return 'Data de expiração inválida';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'Nome no Cartão',
                        style:
                            CustomTextStyles.titleSmallInterBluegray900SemiBold,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        controller: _cardNameController,
                        focusNode: _cardNameFocus,
                        hintText: 'Nome como aparece no cartão',
                        textCapitalization: TextCapitalization.characters,
                        onChanged: (value) {
                          context.read<AddCardManualBloc>().add(
                                AddCardNameChangedEvent(value),
                              );
                        },
                        validator: (value) {
                          if (!state.addCardManualModelObj.isValidCardName) {
                            return 'Nome no cartão é obrigatório';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 40.h),
                      // Button
                      CustomElevatedButton(
                        text: 'Adicionar Cartão',
                        isLoading: state.isLoading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AddCardManualBloc>().add(
                                  AddCardSubmitEvent(
                                    cardNumber: _cardNumberController.text
                                        .replaceAll(' ', ''),
                                    expiryDate: _expiryDateController.text,
                                    cardName: _cardNameController.text,
                                  ),
                                );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatCardNumber(String cardNumber) {
    if (cardNumber.isEmpty) return '**** **** **** ****';

    // Adicione espaços a cada 4 dígitos
    final buffer = StringBuffer();
    for (int i = 0; i < cardNumber.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(cardNumber[i]);
    }

    // Preencha com asteriscos se necessário
    String formattedNumber = buffer.toString();
    if (formattedNumber.length < 19) {
      formattedNumber = formattedNumber.padRight(19, '*');
    }

    return formattedNumber;
  }
}

// Formatador para adicionar espaços a cada 4 dígitos no número do cartão
class _CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll(' ', '');
    final buffer = StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}

// Formatador para adicionar a barra na data de expiração
class _ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final text = newValue.text.replaceAll('/', '');

    if (text.length <= 2) {
      return TextEditingValue(
        text: text,
        selection: TextSelection.collapsed(offset: text.length),
      );
    }

    final formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
