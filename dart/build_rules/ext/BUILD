package(default_visibility = ["//visibility:public"])

filegroup(
    name = "dart_vm",
    srcs = select({
        "//dart:darwin": ["@dart_darwin_x86_64//:dart_vm"],
        "//dart:k8": ["@dart_linux_x86_64//:dart_vm"],
    }),
)

filegroup(
    name = "dart2js",
    srcs = select({
        "//dart:darwin": ["@dart_darwin_x86_64//:dart2js"],
        "//dart:k8": ["@dart_linux_x86_64//:dart2js"],
    }),
)

filegroup(
    name = "dart2js_support",
    srcs = select({
        "//dart:darwin": ["@dart_darwin_x86_64//:dart2js_support"],
        "//dart:k8": ["@dart_linux_x86_64//:dart2js_support"],
    }),
)

alias(
    name = "dart_analyzer",
    actual = select({
        "//dart:darwin": "@dart_darwin_x86_64//:analyzer",
        "//dart:k8": "@dart_linux_x86_64//:analyzer",
    }),
)

alias(
    name = "dev_compiler",
    actual = select({
        "//dart:darwin": "@dart_darwin_x86_64//:dev_compiler",
        "//dart:k8": "@dart_linux_x86_64//:dev_compiler",
    }),
)

filegroup(
    name = "ddc_support",
    srcs = select({
        "//dart:darwin": ["@dart_darwin_x86_64//:ddc_support"],
        "//dart:k8": ["@dart_linux_x86_64//:ddc_support"],
    }),
)

filegroup(
    name = "sdk_summaries",
    srcs = select({
        "//dart:darwin": ["@dart_darwin_x86_64//:sdk_summaries"],
        "//dart:k8": ["@dart_linux_x86_64//:sdk_summaries"],
    }),
)
