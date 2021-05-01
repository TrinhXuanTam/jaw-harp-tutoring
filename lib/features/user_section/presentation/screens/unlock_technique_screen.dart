import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/purchase_technique/purchase_technique_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class UnlockTechniqueScreen extends StatelessWidget {
  final Technique technique;

  const UnlockTechniqueScreen({Key? key, required this.technique}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final thumbnail = getTechniqueThumbnail(this.technique);
    final isAvailable = technique.productInfo.type == ProductType.available;

    return SafeArea(
      child: Scaffold(
        body: BlocProvider<PurchaseTechniqueBloc>(
          create: (_) => serviceLocator<PurchaseTechniqueBloc>(),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(child: thumbnail),
                          Container(
                            child: ClipRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(color: Colors.grey.withOpacity(0.1)),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 80, bottom: 30),
                            height: double.infinity,
                            width: size.width * 0.8,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    child: Text(
                                      this.technique.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    child: Text(
                                      this.technique.category.title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                    child: Text(
                                      this.technique.description,
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.7),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      child: thumbnail,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    if (isAvailable)
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: BASE_COLOR_VERY_LIGHT,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "99.99\$",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 10),
                    Builder(
                      builder: (ctx) => BlocListener<PurchaseTechniqueBloc, PurchaseTechniqueState>(
                        listener: (_, state) {
                          if (state is TechniquePurchased)
                            Navigator.of(context).pushReplacementNamed(
                              TECHNIQUE_DETAIL_SCREEN_ROUTE,
                              arguments: TechniqueScreenArgs(
                                this.technique,
                                true,
                              ),
                            );
                        },
                        child: RoundedButton(
                          text: isAvailable ? "Unlock now" : "Coming soon!",
                          onPressed: isAvailable ? () => BlocProvider.of<PurchaseTechniqueBloc>(ctx).add(PurchaseTechniqueEvent(getUser(ctx), this.technique)) : null,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
