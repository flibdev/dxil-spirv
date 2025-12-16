# Wolvenkit C# Binding Generation

Install requirements:
```
dotnet tool install bottlenoselabs.c2cs.tool -g
dotnet tool install bottlenoselabs.c2ffi.tool -g
```

Run `generate.ps1`

### Updating `dxil_spirv_c2cs.h`

Copy `dxil_spirv_c.h` and make the following modifications to bring it up to C99 standards:

- Add the following after `#include <stddef.h>`:
```c
#include <stdint.h>
#include <stdbool.h>
```
- Replace the block defining `DXIL_SPV_PUBLIC_API` with the following:
```c
#if !defined(DXIL_SPV_PUBLIC_API)
#define DXIL_SPV_PUBLIC_API __declspec(dllexport) __attribute__((visibility("default"))) 
#endif
```
- Replace the `dxil_spv_bool` typedef to use the `stdbool` type:
```c
/* C99 Boolean */
typedef bool dxil_spv_bool;
#define DXIL_SPV_TRUE true
#define DXIL_SPV_FALSE false
```
- Change integer types to use `stdint` types:
  - Replace `unsigned long long` with `uint64_t`
  - Replace `unsigned` with `uint32_t`