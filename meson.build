
project('glad','c',
  version: '2.0.6',
  default_options: [
    'default_library=static',
  ],
  license: 'MIT'
)


if host_machine.system() == 'windows'
  res = run_command('generate.bat', check: false)
else
  res = run_command('generate.sh', check: false)
endif
if res.returncode() != 0
  error('failed to generate glad sources.')
endif

glad_dep = declare_dependency(
  include_directories: include_directories('glad.build/include'),
  link_with: static_library('glad-lib', 'glad.build/src/gl.c'),
)
