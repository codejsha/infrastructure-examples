plugins {
    // ...

    id("com.diffplug.spotless") version "7.2.1"
}

sourceSets {
    main {
        kotlin {
            srcDirs(
                "src/main/kotlin",
                "build/generated/ksp/main/kotlin"
            )
        }
        java {
            srcDirs(
                "src/main/generated"
            )
        }
        resources {
            srcDir("src/main/resources")
        }
    }
    test {
        kotlin {
            srcDir("src/test/kotlin")
        }
        resources {
            srcDir("src/test/resources")
        }
    }
}

// ...

spotless {
    java {
        toggleOffOn("@formatter:off", "@formatter:on")
        palantirJavaFormat()
        importOrder("com.example", "", "java|javax", "\\#")
        removeUnusedImports()
        formatAnnotations()
    }
    kotlin {
        ktlint()
            .setEditorConfigPath("$projectDir/.editorconfig")
        suppressLintsFor {
            step = "ktlint"
            shortCode = "standard:no-wildcard-imports"
        }
    }
    kotlinGradle {
        target("*.gradle.kts")
        ktlint()
            .setEditorConfigPath("$projectDir/.editorconfig")
        suppressLintsFor {
            step = "ktlint"
            shortCode = "standard:no-wildcard-imports"
        }
    }
}
