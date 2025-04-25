# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.gson.** { *; }

# Hive
-keep class * extends com.google.protobuf.GeneratedMessageLite { *; }
-keep class * extends androidx.room.RoomDatabase { *; }

# Keep your model classes
-keep class com.example.dr_ai.data.model.** { *; }

# Keep Kotlin Metadata
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes Exceptions 