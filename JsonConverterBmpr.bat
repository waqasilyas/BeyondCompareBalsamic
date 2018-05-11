mkdir "%APPDATA%\Beyond Compare 3"
>> "%APPDATA%\Beyond Compare 3\JsonConverterBmpr.log" 2>&1 (
  echo ============================================
  echo Source: %1
  echo Target: %2
  echo Converting...
  Helpers\Bmpr\json-converter-bmpr\JsonConverterBmpr.exe -f %1 %2
  echo Done.
)
