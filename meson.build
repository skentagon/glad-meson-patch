
project('glad','c',
  version: '2.0.6',
  default_options: [
    'default_library=static',
  ],
  license: 'MIT'
)

opt_api = get_option('api')
arg_str = '--api=' + opt_api

opt_ext = get_option('extensions')
if opt_ext.length() > 0
  arg_str = arg_str + ' --extensions=' + ','.join(opt_ext)
endif

if host_machine.system() == 'windows'
  generate_script = 'generate.bat'
else
  generate_script = 'generate.sh'
endif
res = run_command(generate_script, arg_str, check: false)
if res.returncode() != 0
  error('failed to generate glad sources.')
endif

glad_dep = declare_dependency(
  include_directories: include_directories('glad.build/include'),
  link_with: static_library(
    'glad-lib',
    'glad.build/src/gl.c',
    include_directories: include_directories('glad.build/include'),
  ),
)
