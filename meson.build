
project('glad','c',
  version: '2.0.6',
  default_options: [
    'default_library=static',
  ],
  license: 'MIT'
)

# add options for glad module
opt_api = get_option('api')
arg_list = ['--api=' + opt_api]

opt_ext = get_option('extensions')
if opt_ext.length() > 0
  arg_list += '--extensions=' + ','.join(opt_ext)
endif

if get_option('ext_option') != ''
  arg_list += get_option('ext_option')
endif

arg_list += ['--out-path', 'glad.build', 'c']


# add options for each language generator
if get_option('alias')
  arg_list += '--alias'
endif

if get_option('debug')
  arg_list += '--debug'
endif

if get_option('header_only')
  arg_list += '--header-only'
endif

if get_option('loader')
  arg_list += '--loader'
endif

if get_option('mx')
  arg_list += '--mx'
endif

if get_option('on_demand')
  arg_list += ' --on-demand'
endif

if get_option('ext_c_option') != ''
  arg_list += get_option('ext_c_option')
endif

# message(arg_str)

if host_machine.system() == 'windows'
  generate_script = 'generate.bat'
else
  generate_script = 'generate.sh'
endif
res = run_command(generate_script, arg_list, check: false)
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
