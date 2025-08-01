@Suppress("DSL_SCOPE_VIOLATION")
plugins {
    id("java")
    alias(libs.plugins.spring.boot)
    alias(libs.plugins.spring.dependency)
    alias(libs.plugins.kotlin.jvm)
    alias(libs.plugins.kotlin.kapt)
    alias(libs.plugins.spotless)
}

// ...

spotless {
    format("misc") {
        target("**/*.yml", "**/*.yaml", "**/*.properties", "**/*.json", "**/*.xml", "**/*.http", "**/*.snippet")
        trimTrailingWhitespace()
        endWithNewline()
    }
    java {
        // googleJavaFormat()
        // googleJavaFormat().aosp()
        palantirJavaFormat()
        // palantirJavaFormat().style("GOOGLE")
        importOrder("", "javax|java", "\\#")
    }
    kotlin {
        ktlint()
    }
}

// ...
