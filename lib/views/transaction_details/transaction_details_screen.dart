import 'package:flutter/material.dart';
import 'package:wundu/core/app_export.dart';
import 'package:wundu/routes/protected_route.dart';
import 'package:wundu/theme/custom_button_style.dart';
import 'package:wundu/views/transaction_details/models/transaction_model.dart';
import 'package:wundu/views/transaction_details/bloc/transaction_details_screen_bloc.dart';
import 'package:wundu/views/transaction_details/models/transaction_details_screen_model.dart';
import 'package:wundu/widgets/custom_elevated_button.dart';
import 'package:wundu/widgets/custom_icon_button.dart';
import 'package:intl/intl.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  static Widget builder(BuildContext context) {
    final TransactionModel? transaction =
        ModalRoute.of(context)?.settings.arguments as TransactionModel?;
    return BlocProvider<TransactionDetailsScreenBloc>(
      create: (context) => TransactionDetailsScreenBloc(
        TransactionDetailsScreenState(
          transactionDetailsScreenModelObj:
              TransactionDetailsScreenModel(transaction: transaction),
        ),
      )..add(TransactionDetailsScreenInitialEvent()),
      child: TransactionDetailsScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProtectedRoute(
      child: Scaffold(
        backgroundColor: appTheme.blueGray50,
        body: SafeArea(
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                  left: 14.h,
                  top: 30.h,
                  right: 14.h,
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.only(
                        left: 14.h,
                        top: 12.h,
                        right: 14.h,
                      ),
                      decoration: AppDecoration.fillwhiteA700.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder16,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetailsHeader(context),
                          SizedBox(height: 28.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                              color: appTheme.gray30003.withValues(alpha: 0.6),
                              indent: 6.h,
                              endIndent: 6.h,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          _buildTransferRow(context),
                          SizedBox(height: 40.h),
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(horizontal: 6.h),
                            child: _buildRowmdiinformati(
                              context,
                              mdiinformation: ImageConstant.money,
                              outrasinforma: "Montante",
                            ),
                          ),
                          SizedBox(height: 28.h),
                          _buildValueRow(context),
                          SizedBox(height: 30.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                              color: appTheme.gray30003.withValues(alpha: 0.6),
                              indent: 6.h,
                              endIndent: 6.h,
                            ),
                          ),
                          SizedBox(height: 28.h),
                          _buildCalendarRow(context),
                          SizedBox(height: 22.h),
                          _buildDateTimeRow(context),
                          SizedBox(height: 40.h),
                          SizedBox(
                            width: double.maxFinite,
                            child: Divider(
                              color: appTheme.gray30003.withValues(alpha: 0.6),
                              indent: 6.h,
                              endIndent: 6.h,
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Container(
                            width: double.maxFinite,
                            margin: EdgeInsets.symmetric(horizontal: 6.h),
                            child: _buildRowmdiinformati(
                              context,
                              mdiinformation: ImageConstant.informationOutline,
                              outrasinforma: "Outras informações",
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.only(left: 6.h),
                            child: Text(
                              "Número de operação",
                              style: CustomTextStyles.titleSmallInter1Bluegray900,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          _buildOperationNumberButton(context),
                          SizedBox(height: 22.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: _buildDefineCategoryColumn(context),
      ),
    );
  }

  /// Header com título "Detalhes" e botão de fechar
  Widget _buildDetailsHeader(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 14.h),
              child: Text(
                "Detalhes",
                style: CustomTextStyles.headlineSmallBluegray900,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 84.h),
            child: CustomIconButton(
              height: 30.h,
              width: 30.h,
              padding: EdgeInsets.all(2.h),
              decoration: IconButtonStyleHelper.fillBlueGrayTL14,
              onTap: () {
                onTapBtnQlementineone(context);
              },
              child: CustomImageView(
                imagePath: ImageConstant.close,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Botão de tipo de transação (Transferência) com cor dinâmica
  Widget _buildTransferRow(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);

    // Determina se é crédito (payment) ou débito
    final isCredit = transaction?.type == "deposit";

    return SizedBox(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomElevatedButton(
            height: 34.h,
            width: 176.h,
            text: isCredit ? "Crédito" : "Débito",
            buttonStyle: isCredit
                ? CustomButtonStyles.fillTeal
                : CustomButtonStyles.fillDeepOrange,
            buttonTextStyle: isCredit
                ? CustomTextStyles.bodyLargeTeal300
                : CustomTextStyles.bodyLargeDeeporange300,
          ),
          Padding(
            padding: EdgeInsets.only(left: 44.h),
            child: CustomIconButton(
              height: 34.h,
              width: 34.h,
              padding: EdgeInsets.all(4.h),
              decoration: IconButtonStyleHelper.fillBlueGrayTL10,
              child: CustomImageView(
                imagePath: ImageConstant.download,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Botão de valor creditado/debitado com cor dinâmica
  Widget _buildCreditedValueButton(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);

    final isCredit = transaction?.type == "deposit";

    return CustomElevatedButton(
      height: 32.h,
      width: 128.h,
      text: "${transaction?.amount.toStringAsFixed(2) ?? '0.00'}Kz",
      buttonStyle: isCredit
          ? CustomButtonStyles.fillIndigoA
          : CustomButtonStyles.fillDeepOrange,
      buttonTextStyle: isCredit
          ? CustomTextStyles.titleMediumIndigoA200
          : CustomTextStyles.titleMediumDeeporange300,
    );
  }

  /// Botão de valor após movimento com cor dinâmica
  Widget _buildPostMovementValueButton(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);

    final isCredit = transaction?.type == "deposit";

    return CustomElevatedButton(
      height: 32.h,
      width: 130.h,
      text: "300.000,00Kz", // Substitua por valor real se disponível
      buttonStyle: isCredit
          ? CustomButtonStyles.fillTeal
          : CustomButtonStyles.fillDeepOrange,
      buttonTextStyle: isCredit
          ? CustomTextStyles.titleMediumTea1300
          : CustomTextStyles.titleMediumDeeporange300,
    );
  }

  /// Seção de valores com rótulo dinâmico
  Widget _buildValueRow(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);

    final isCredit = transaction?.type == "deposit";

    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isCredit ? "Valor Acreditado" : "Valor Débitado",
                  style: CustomTextStyles.titleSmallInter1Bluegray900,
                ),
                _buildCreditedValueButton(context),
              ],
            ),
          ),
          SizedBox(width: 12.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Valor após movimento",
                  style: CustomTextStyles.titleSmallInter1Bluegray900,
                ),
                _buildPostMovementValueButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Botão de número de operação
  Widget _buildOperationNumberButton(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);
    return CustomElevatedButton(
      height: 32.h,
      width: 112.h,
      text: transaction?.id ?? "287805888",
      margin: EdgeInsets.only(left: 6.h),
      buttonStyle: CustomButtonStyles.fillBlueGray,
      buttonTextStyle: CustomTextStyles.titleMediumBluegray700,
    );
  }

  /// Botão "Definir Categoria"
  Widget buildDefineCategoryButton(BuildContext context) {
    return CustomElevatedButton(
      height: 56.h,
      text: "Definir Categoria",
      margin: EdgeInsets.only(bottom: 12.h),
      leftIcon: Container(
        margin: EdgeInsets.only(right: 14.h),
        child: CustomImageView(
          imagePath: ImageConstant.circlePlusWhite,
          height: 32.h,
          width: 32.h,
          fit: BoxFit.contain,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillYellowA,
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
      onPressed: () async {
        final bloc = context.read<TransactionDetailsScreenBloc>();
        final transaction =
            bloc.state.transactionDetailsScreenModelObj?.transaction;
        final updatedTransaction = await NavigatorService.pushNamed(
          AppRoutes.addCategoryScreen,
          arguments: transaction,
        );
        if (updatedTransaction != null &&
            updatedTransaction is TransactionModel &&
            context.mounted) {
          bloc.add(
            TransactionDetailsScreenInitialEvent(
                transaction: updatedTransaction),
          );
        }
      },
    );
  }

  /// Navegação ao clicar no botão de fechar
  void onTapBtnQlementineone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.mainScreen);
  }

  // Outros métodos como _buildCalendarRow, _buildDateTimeRow, etc., permanecem inalterados

  /// Section Widget
  Widget _buildCalendarRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        children: [
          CustomImageView(
            imagePath: ImageConstant
                .calendar, // Replace with the appropriate image path
            height: 24.h,
            width: 24.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "Data e Hora",
              style: CustomTextStyles.titleMediumBluegray900SemiBold_1,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDateEdit(BuildContext context) {
    final transaction = context.select((TransactionDetailsScreenBloc bloc) =>
        bloc.state.transactionDetailsScreenModelObj?.transaction);
    return Container(
      width: 400.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.blueGray900.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Text(
        transaction?.date != null
            ? DateFormat("dd MMM 'de' yyyy", 'pt_BR').format(transaction!.date)
            : "12 jan de 2025",
        style: CustomTextStyles.titleMediumBluegray900SemiBold,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  /// Section Widget
  Widget _buildTimeEdit(BuildContext context) {
    return Container(
      width: 70.h,
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 6.h,
      ),
      decoration: BoxDecoration(
        color: appTheme.blueGray900.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10.h),
      ),
      child: Text(
        "12:32",
        style: CustomTextStyles.titleMediumBluegray900SemiBold,
      ),
    );
  }

  /// Section Widget
  Widget _buildDateTimeRow(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.symmetric(horizontal: 6.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Data", style: CustomTextStyles.titleSmallGray600),
                Padding(padding: EdgeInsets.all(5.h)),
                _buildDateEdit(context),
              ],
            ),
          ),
          SizedBox(
            width: 20.h, // Reduced spacing between date and time
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hora",
                  style: CustomTextStyles.titleSmallGray600,
                ),
                Padding(padding: EdgeInsets.all(5.h)),
                _buildTimeEdit(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildDefineCategoryColumn(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [buildDefineCategoryButton(context)],
      ),
    );
  }

  /// Common widget
  Widget _buildRowmdiinformati(
    BuildContext context, {
    required String mdiinformation,
    required String outrasinforma,
  }) {
    return Row(
      children: [
        CustomImageView(
          imagePath: mdiinformation,
          height: 24.h,
          width: 24.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 12.h),
          child: Text(
            outrasinforma,
            style: CustomTextStyles.titleMediumGray90001.copyWith(
              color: appTheme.blueGray900.withValues(
                alpha: 0.6,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> onTapTimeEdit(BuildContext context) async {
    final bloc = context.read<TransactionDetailsScreenBloc>();
    var initialState = bloc.state;
    TimeOfDay? time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null && context.mounted) {
      bloc.add(ChangeTimeEvent(time: time));
      var parseDate = DateFormat.jm().parse(time.format(context));
      initialState.timeEditController?.text =
          DateFormat('HH:mm').format(parseDate);
    }
  }
}
