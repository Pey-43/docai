plugins {
    id("com.android.library")
    id("com.google.gms.google-services") version "4.4.2" apply false
    kotlin("android") version "2.1.0"
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

android {
    compileSdkVersion(34)
    buildToolsVersion("34.0.0")
    namespace = "com.example.docai"
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}