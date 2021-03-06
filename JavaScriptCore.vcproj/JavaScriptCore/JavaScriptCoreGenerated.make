all:
    touch "%ConfigurationBuildDir%\buildfailed"
    bash build-generated-files.sh "%ConfigurationBuildDir%" "$(WEBKITLIBRARIESDIR)"
!IF "$(PRODUCTION)"!="1"
    bash -c "python react-to-vsprops-changes.py"
!ENDIF
    -mkdir 2>NUL "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\APICast.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\APIShims.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JavaScript.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSBase.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSContextRef.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSContextRefPrivate.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSObjectRef.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSObjectRefPrivate.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSStringRef.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSStringRefCF.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSStringRefBSTR.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSValueRef.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JavaScriptCore.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSRetainPtr.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSWeakObjectMapRefInternal.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSWeakObjectMapRefPrivate.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\JSRetainPtr.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\OpaqueJSString.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    xcopy /y /d "..\..\API\WebKitAvailability.h" "%ConfigurationBuildDir%\include\JavaScriptCore"
    
    -mkdir 2>NUL "%ConfigurationBuildDir%\include\private\JavaScriptCore"

    xcopy /y /d "..\..\wtf\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\text\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\unicode\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\unicode\icu\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\parser\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\runtime\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\bytecode\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\interpreter\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\assembler\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\jit\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\collector\handles\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\debugger\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\profiler\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\create_hash_table" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\text\AtomicString.cpp" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\text\StringBuilder.cpp" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\text\StringImpl.cpp" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\wtf\text\WTFString.cpp" "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    xcopy /y /d "..\..\yarr\*.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore"


    -mkdir 2>NUL "%ConfigurationBuildDir%\bin\JavaScriptCore.resources"
    xcopy /y /d "..\JavaScriptCore.resources\*" "%ConfigurationBuildDir%\bin\JavaScriptCore.resources"
    
    -del "%ConfigurationBuildDir%\include\private\JavaScriptCore\stdbool.h" "%ConfigurationBuildDir%\include\private\JavaScriptCore\stdint.h"
    -del "%ConfigurationBuildDir%\buildfailed"

clean:
    -del "%ConfigurationBuildDir%\buildfailed"
    -del /s /q "%ConfigurationBuildDir%\include\JavaScriptCore\JavaScriptCore"
    -del /s /q "%ConfigurationBuildDir%\obj\JavaScriptCore\DerivedSources"
    -del /s /q "%ConfigurationBuildDir%\include\private\JavaScriptCore"
    -del /s /q "%ConfigurationBuildDir%\bin\JavaScriptCore.resources"
