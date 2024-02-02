plugins {
    kotlin("multiplatform")
    id("org.jetbrains.compose")
}

kotlin {
    js(IR) {
        browser {
            commonWebpackConfig {
                outputFileName = "amadeus-demo-app.js"
            }
        }
        binaries.executable()
    }
    sourceSets {
        jsMain.dependencies {
            implementation(compose.runtime)
            implementation(compose.foundation)
            implementation(compose.ui)
            implementation(compose.material3)
            implementation(project(":shared"))
            implementation(project(":amadeus-api"))
            implementation("io.github.pablichjenkov:component-toolkit:0.5.16")
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.3")
            implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core-js:1.7.3")
            implementation(devNpm("copy-webpack-plugin", "9.1.0"))
            implementation(npm("@cashapp/sqldelight-sqljs-worker", "2.0.0"))
            implementation(npm("sql.js", "1.8.0"))
        }
    }
}

compose.experimental {
    web.application {}
}
