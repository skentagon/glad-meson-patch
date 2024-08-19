# glad-meson-patch
Patch files of glad for c/c++ with Meson Build system

## Usage
add glad.wrap file to subprojects folder, and reconfigure meson.

### example
```bash
meson setup build \
  -Dglad:api=gl:core=3.3 \
  -Dglad:extensions=GL_ARB_vertex_program,GL_ARB_fragment_program \
  -Dglad:header_only=true

cd build
ninja
```

```bash
meson setup build
cd build

# after creating build folder, you can change glad configures
meson configure -Dglad:api=gl:core=3.3
meson configure -Dglad:extensions=GL_ARB_vertex_program,GL_ARB_fragment_program
meson configure -Dglad:header_only=true

ninja # at this point, build script is regenerated and configures are applied
```

## Options
Some options available as meson build option.
These options are passed to glad python script.

### basic options
| option name | type | default value | description |
| --- | --- | --- | --- |
| api | string | "gl:core=4.6" |  |
| extensions | array | [] | all possible extensions are included when empty list is passed |
| extensions | array | [] | all possible extensions are included when empty list is passed |
| ext_options | string | "" | |


### language options
The following options are based on those of language generator.
| option name | type | default value | description |
| --- | --- | --- | --- |
| alias | boolean | false | |
| header_only | boolean | false | |
| loader | boolean | false | |
| mx | boolean | false | |
| on_demand | boolean | false | |
| ext_c_option | string | "" | |




