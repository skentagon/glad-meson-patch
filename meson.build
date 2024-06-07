
project('glad','c',
  version: '2.0.6',
  default_options: [
    'default_library=static',
  ],
  license: 'MIT'
)

# add options for glad module
opt_api = get_option('api')
arg_str = '--api=' + opt_api

opt_ext = get_option('extensions')
if opt_ext.length() > 0
  arg_str = arg_str + ' --extensions=' + ','.join(opt_ext)
endif

arg_str = arg_str + get_option('ext_option')

arg_str = arg_str + ' --out-path glad.build c'


# add options for each language generator
if get_option('alias')
  arg_str = arg_str + ' --alias'
endif

if get_option('debug')
  arg_str = arg_str + ' --debug'
endif

if get_option('header_only')
  arg_str = arg_str + ' --header-only'
endif

if get_option('loader')
  arg_str = arg_str + ' --loader'
endif

if get_option('mx')
  arg_str = arg_str + ' --mx'
endif

if get_option('on_demand')
  arg_str = arg_str + ' --on-demand'
endif

arg_str = arg_str + get_option('ext_c_option')



if host_machine.system() == 'windows'
  generate_script = 'generate.bat'
else
  generate_script = 'generate.sh'
endif
res = run_command(generate_script, arg_str, check: false)
if res.returncode() != 0
  error('failed to generate glad sources.')
endif

lib = []
if not get_option('header_only')
  lib = static_library(
    'glad-lib',
    'glad.build/src/gl.c',
    include_directories: include_directories('glad.build/include'),
  )
endif

glad_dep = declare_dependency(
  include_directories: include_directories('glad.build/include'),
  link_with: lib,
)
