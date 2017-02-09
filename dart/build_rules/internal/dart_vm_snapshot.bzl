load(
    ":common.bzl",
    "make_dart_context",
    "package_spec_action"
)

def dart_vm_snapshot_action(ctx, dart_ctx, output, vm_flags, script_file, script_args):
  """Emits a Dart VM snapshot."""
  build_dir = ctx.label.name + ".build/"

  package_spec = package_spec_action(
      ctx=ctx,
      dart_ctx=dart_ctx,
      output_path=build_dir + ctx.label.name + ".packages",
  )

  dart_srcs = [src for src in dart_ctx.transitive_srcs]

  # TODO(cbracken) assert --snapshot not in flags
  # TODO(cbracken) assert --packages not in flags
  arguments = [
      "--packages=%s" % package_spec.path,
      "--snapshot=%s" % output.path,
  ]
  arguments += vm_flags
  arguments += [script_file.path]
  arguments += script_args
  ctx.action(
      inputs=dart_srcs + [package_spec, script_file],
      outputs=[output],
      executable=ctx.executable._dart_vm,
      arguments=arguments,
      progress_message="Building Dart VM snapshot %s" % ctx,
      mnemonic="DartVMSnapshot",
  )

def dart_vm_snapshot_impl(ctx):
  """Implements the dart_vm_snapshot build rule."""
  dart_ctx = make_dart_context(
      ctx,
      srcs = ctx.files.srcs,
      data = ctx.files.data,
      deps = ctx.attr.deps,
      pub_pkg_name = ctx.attr.pub_pkg_name,
  )
  dart_vm_snapshot_action(
      ctx=ctx,
      dart_ctx=dart_ctx,
      output=ctx.outputs.snapshot,
      vm_flags=ctx.attr.vm_flags,
      script_file=ctx.file.script_file,
      script_args=ctx.attr.script_args,
  )
  return struct()
