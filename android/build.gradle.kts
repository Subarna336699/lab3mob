android {
    compileSdkVersion 33

    defaultConfig {
        applicationId = "com.example.lab3"
        minSdkVersion(21)
        targetSdkVersion(33)
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            minifyEnabled = false
            proguardFiles(getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro')
        }
    }

    // Add this line to specify the NDK version
    ndkVersion = "27.0.12077973"
}
