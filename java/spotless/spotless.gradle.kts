plugins {
    kotlin("jvm") version "2.3.10"
    kotlin("plugin.spring") version "2.3.10"
    kotlin("plugin.serialization") version "2.3.10"
    id("org.springframework.boot") version "4.0.2"
    id("io.spring.dependency-management") version "1.1.7"

    // ...
    id("com.diffplug.spotless") version "8.3.0"
}

// ...

spotless {
    java {
        target("src/main/kotlin/**/*.java")
        palantirJavaFormat()
        importOrder("com.example", "", "java|javax", "\\#")
        removeUnusedImports()
        formatAnnotations()
        endWithNewline()
    }
    kotlin {
        target("src/main/kotlin/**/*.kt")
        ktlint()
            .setEditorConfigPath("${project.projectDir}/.editorconfig")
        suppressLintsFor {
            step = "ktlint"
            shortCode = "standard:filename"
        }
    }
    kotlinGradle {
        target("*.gradle.kts")
        ktlint()
            .setEditorConfigPath("$projectDir/.editorconfig")
    }
}
