library com.wenia.test.features.profile.presentation;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:wenia_test/core/firebase_collections.dart';
import 'package:wenia_test/features/authentication/model/model.dart';
import 'package:wenia_test/features/authentication/presentation/presentation.dart';
import 'package:wenia_test/i18n/strings.g.dart';
import 'package:wenia_test/shared/widgets/custom_elevated_button.dart';
import 'package:wenia_test/shared/widgets/custom_text_form_field.dart';
import 'package:wenia_test/utils/app_padding.dart';
import 'package:wenia_test/utils/app_spacing.dart';
import 'package:wenia_test/utils/extension/strings.dart';

part 'future_provider.dart';
part 'profile_screen.dart';
part 'provider.dart';
part 'viewmodel.dart';
