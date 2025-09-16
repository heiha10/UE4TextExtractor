del /Q _texts.txt
del /Q _texts_src.txt
del /Q _texts_no_signatures.txt
del /Q _texts_all_signatures.txt
del /Q _texts_all_uexps.txt
del /Q _texts.locres
del /Q _texts.old.locres
del /Q _texts.locres.txt
del /Q _texts.old.locres.txt
del /Q _texts.locres.v4.txt
del /Q _texts.convert.locres
del /Q _texts_src.convert.locres
del /Q _texts.convert.old.locres
del /Q _merge_dst.txt
del /Q _merge_dst_texts_all_to_no_signatures.txt
del /Q _out.txt

echo EMPTY_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe >> _out.txt

echo. >> _out.txt
echo EXTRACT_TO_LOCRES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts.locres -raw-text-signatures=SnowfallScriptAsset,LevelSequence >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_OLD_LOCRES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts.old.locres -old -raw-text-signatures=SnowfallScriptAsset,LevelSequence >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_TXT_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts.txt -raw-text-signatures=SnowfallScriptAsset,LevelSequence >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_TXT_SRC_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts_src.txt -raw-text-signatures=SnowfallScriptAsset,LevelSequence -src >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_TXT_NO_SIGNATURES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts_no_signatures.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_TXT_NO_SIGNATURES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts_all_signatures.txt -raw-text-signatures=all >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo EXTRACT_TO_TXT_ALL_UEXPS_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe . _texts_all_uexps.txt -all-uexps >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo CONVERT_LOCRES_TO_TXT_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe _texts.locres _texts.locres.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)
comp _texts.txt _texts.locres.txt /M || echo DIFFERENCES! >> _out.txt

echo. >> _out.txt
echo CONVERT_OLD_LOCRES_TO_TXT_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe _texts.old.locres _texts.old.locres.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)
comp _texts.txt _texts.old.locres.txt /M || echo DIFFERENCES! >> _out.txt

echo. >> _out.txt
echo CONVERT_V4_LOCRES_TO_TXT_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe locres\v4.locres _texts.locres.v4.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo CONVERT_TXT_TO_LOCRES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe _texts.txt _texts.convert.locres >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)
comp _texts.locres _texts.convert.locres /M || echo DIFFERENCES! >> _out.txt

echo. >> _out.txt
echo CONVERT_TXT_SRC_TO_LOCRES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe _texts_src.txt _texts_src.convert.locres >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)
comp _texts.locres _texts_src.convert.locres /M || echo DIFFERENCES! >> _out.txt

echo. >> _out.txt
echo CONVERT_TXT_TO_OLD_LOCRES_TEST >> _out.txt
..\x64\Release\UE4TextExtractor.exe _texts.txt _texts.convert.old.locres -old >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)
comp _texts.old.locres _texts.convert.old.locres /M || echo DIFFERENCES! >> _out.txt

echo. >> _out.txt
echo MERGE_BASE_TEST >> _out.txt
copy merge\dst.txt _merge_dst.txt
..\x64\Release\UE4TextExtractor.exe merge\src.txt _merge_dst.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)

echo. >> _out.txt
echo MERGE_REGRESSION_TEST >> _out.txt
copy _texts_no_signatures.txt _merge_dst_texts_all_to_no_signatures.txt
..\x64\Release\UE4TextExtractor.exe _texts_all_signatures.txt _merge_dst_texts_all_to_no_signatures.txt >> _out.txt
if errorlevel 1 (
    echo ERROR! >> _out.txt
)