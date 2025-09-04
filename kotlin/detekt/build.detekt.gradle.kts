import io.gitlab.arturbosch.detekt.Detekt
import io.gitlab.arturbosch.detekt.DetektCreateBaselineTask

plugins {
    ...
    id("io.gitlab.arturbosch.detekt") version "1.23.8"
}

// ...

dependencies {
    // ...

    implementation("io.gitlab.arturbosch.detekt:detekt-api:1.23.8")
    implementation("io.gitlab.arturbosch.detekt:detekt-core:1.23.8")
    detektPlugins(sourceSets.main.get().output)
}

detekt {
    buildUponDefaultConfig = true
    allRules = false
    config.setFrom("$projectDir/ci/detekt/detekt.yaml")
    baseline = file("$projectDir/ci/detekt/baseline.xml")
}

configurations.all {
    resolutionStrategy.eachDependency {
        if (requested.group == "org.jetbrains.kotlin") {
            useVersion(io.gitlab.arturbosch.detekt.getSupportedKotlinVersion())
        }
    }
}

tasks.withType<Detekt>().configureEach {
    reports {
        html.required.set(true)
        xml.required.set(true)
        sarif.required.set(true)
        md.required.set(true)
    }
}

tasks.withType<Detekt>() {
    jvmTarget = "21"
}
tasks.withType<DetektCreateBaselineTask>() {
    jvmTarget = "21"
}
