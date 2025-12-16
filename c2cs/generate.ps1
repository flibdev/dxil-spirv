c2ffi extract --config c2ffi-config.json
c2ffi merge --inputDirectoryPath ./ffi/ --outputFilePath c2ffi-merged.json
c2cs generate --config .\c2cs-generate.json
