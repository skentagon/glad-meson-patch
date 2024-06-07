# glad-meson-patch
Patch files of glad for c/c++ with Meson Build system

## Usage
add glad.wrap file to subprojects folder, and reconfigure meson.

### example
```bash
meson setup build # a project depends on glad, witch has subprojects/glad.wrap
# At this point, glad files are generated but options are not reflected
cd build
meson configure -Dglad:api=gl:core=3.3
meson configure -Dglad:extensions=GL_ARB_vertex_program,GL_ARB_fragment_program
meson configure -Dglad:header_only=true
meson --reconfigure # regenerates glad files
```

## Options
Some options available as meson build option.
These options are passed to glad python script.

> [!WARNING]
> To update options settings and regenrate glad files, you need to run `meson --reconfigure`.

### basic options
| option name | type | default value | description |
| --- | --- | --- | --- |
| api | string | "gl:core=4.6" |  |
| extensions | array | [] |  |
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




