# Creates the file configcint.h and write configuration
# Don't know why this is needed
# TODO: Change file that it works with WINDOWS
function(WRITE_CONFIG_CINT file)
  write_file(${file} "/* Generated by WriteConfigCint.cmake*/")
  if(UNIX)
    write_file(${file} "#define G__CFG_ARCH \"${ROOT_ARCHITECTURE}\"" APPEND)
    if(ROOT_PLATFORM MATCHES macosx)
       write_file(${file} "#define G__CFG_IMPLIBEXT \".dylib\"" APPEND)
    else()
       write_file(${file} "#define G__CFG_IMPLIBEXT \".a\"" APPEND)
    endif()
    write_file(${file} "#define G__CFG_LDOUT \"-o \"" APPEND)
    write_file(${file} "#define G__CFG_LIBL \"-l@imp@\"" APPEND)
    write_file(${file} "#define G__CFG_LIBEXT \".a\"" APPEND)
    write_file(${file} "#define G__CFG_MANGLEPATHS \"echo \"" APPEND)
    write_file(${file} "#define G__CFG_PLATFORMO \"\"" APPEND)
    write_file(${file} "#define G__CFG_AR \"ar qcs\"" APPEND)
    write_file(${file} "#define G__CFG_COREVERSION \"${ROOT_DICTTYPE}\" " APPEND)
    write_file(${file} "#define G__CFG_CC \"${CMAKE_C_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_CFLAGS \"${CMAKE_C_FLAGS} ${CINT_C_DEFINITIONS} -I${CMAKE_BINARY_DIR}/include\" " APPEND)
    write_file(${file} "#define G__CFG_CMACROS \"${CINT_C_DEFINITIONS}\" " APPEND)
    write_file(${file} "#define G__CFG_COMP \"-c \"" APPEND)
    write_file(${file} "#define G__CFG_CPP \"${CPPPREP}\"" APPEND)
    write_file(${file} "#define G__CFG_COUT \"${CXXOUT}\"" APPEND)
    write_file(${file} "#define G__CFG_COUTEXE \"${CXXOUT}\"" APPEND)
    write_file(${file} "#define G__CFG_INCP \"-I\"" APPEND)
    write_file(${file} "#define G__CFG_CXX \"${CMAKE_CXX_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_CXXFLAGS \" ${CMAKE_CXX_FLAGS} ${CINT_CXX_DEFINITIONS} -I${CMAKE_BINARY_DIR}/include\"" APPEND)
    write_file(${file} "#define G__CFG_CXXMACROS \"${CINT_CXX_DEFINITIONS}\"" APPEND)
    write_file(${file} "#define G__CFG_LD \"${CMAKE_CXX_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_LDFLAGS \"${CMAKE_CXX_LINK_FLAGS}\"" APPEND)
    write_file(${file} "#define G__CFG_LIBP \"-L\"" APPEND)
    write_file(${file} "#define G__CFG_SOFLAGS \"${CMAKE_SHARED_LIBRARY_CREATE_C_FLAGS}\"" APPEND)
    write_file(${file} "#define G__CFG_SOOUT G__CFG_LDOUT" APPEND)
    write_file(${file} "#define G__CFG_OBJEXT \".o\"" APPEND)
    write_file(${file} "#define G__CFG_EXEEXT \"${EXEEXT}\"" APPEND)
    write_file(${file} "#define G__CFG_SOEXT \".${SOEXT}\"" APPEND)
    write_file(${file} "#define G__CFG_DEBUG \"\"" APPEND) #TODO
    write_file(${file} "#define G__CFG_DEFAULTLIBS \"${SYSLIBS}\"" APPEND) 
    write_file(${file} "#define G__CFG_STREAMDIR \"\" " APPEND) #TODO
    write_file(${file} "#define G__CFG_EXPLLINK \"${EXPLICITLINK}\"" APPEND)
    write_file(${file} "#define G__CFG_BUILDREADLINE \"\"" APPEND)
    write_file(${file} "#define G__CFG_READLINELIBDIR \"\"" APPEND)
    write_file(${file} "#define G__CFG_READLINEINCDIR \"\"" APPEND)
    write_file(${file} "#define G__CFG_NEEDCURSES \"\"" APPEND)
    write_file(${file} "#define G__CFG_RM \"rm -f\"" APPEND)
    write_file(${file} "#define G__CFG_MV \"mv -f\"" APPEND)
    write_file(${file} "#define G__CFG_INPUTMODE \"root\"" APPEND)
    write_file(${file} "#define G__CFG_INPUTMODELOCK \"off\"" APPEND)
    write_file(${file} "#define G__CFG_MAKEIMPLIB \"\"" APPEND)
    write_file(${file} "#define G__CFG_CINTSYSDIR \"${CMAKE_SOURCE_DIR}\"" APPEND)
    write_file(${file} "#define G__CFG_HAVE_CONFIG \"1\"" APPEND)
    write_file(${file} "#define CINTSYSDIR \"${CMAKE_SOURCE_DIR}\"" APPEND)
    write_file(${file} "#define G__CFG_MAKEIMPLIB \"\"" APPEND)
    write_file(${file} "#define G__CFG_HAVE_CONFIG \"1\"" APPEND)
  elseif(WIN32)
    write_file(${file} "#define G__CFG_ARCH \"${ROOT_ARCHITECTURE}\"" APPEND)
    write_file(${file} "#define G__CFG_LDOUT \"-out:\"" APPEND)
    write_file(${file} "#define G__CFG_LIBL \"lib@imp@\"" APPEND)
    write_file(${file} "#define G__CFG_LIBEXT \".lib\"" APPEND)
    write_file(${file} "#define G__CFG_IMPLIBEXT \".lib\"" APPEND)	
    write_file(${file} "#define G__CFG_MANGLEPATHS \"echo \"" APPEND)
    write_file(${file} "#define G__CFG_PLATFORMO \"vc_${MSVC_VERSION}\"" APPEND)
    write_file(${file} "#define G__CFG_AR \"lib /OUT:\"" APPEND)
    write_file(${file} "#define G__CFG_COREVERSION \"${ROOT_DICTTYPE}\" " APPEND)
    write_file(${file} "#define G__CFG_CC \"${CMAKE_C_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_CFLAGS \"${CMAKE_C_FLAGS} ${CINT_C_DEFINITIONS} -I${CMAKE_BINARY_DIR}/include\" " APPEND)
    write_file(${file} "#define G__CFG_CMACROS \"${CINT_C_DEFINITIONS}\" " APPEND)
    write_file(${file} "#define G__CFG_COMP \"-c \"" APPEND)
    write_file(${file} "#define G__CFG_CPP \"cl.exe -E -C -nologo\"" APPEND)
    write_file(${file} "#define G__CFG_COUT \"-Fo\"" APPEND)
    write_file(${file} "#define G__CFG_COUTEXE \"-Fo\"" APPEND)
    write_file(${file} "#define G__CFG_INCP \"-I\"" APPEND)
    write_file(${file} "#define G__CFG_CXX \"${CMAKE_CXX_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_CXXFLAGS \" ${CMAKE_CXX_FLAGS} ${CINT_CXX_DEFINITIONS} -I${CMAKE_BINARY_DIR}/include\"" APPEND)
    write_file(${file} "#define G__CFG_CXXMACROS \"${CINT_CXX_DEFINITIONS}\"" APPEND)
    write_file(${file} "#define G__CFG_LD \"${CMAKE_CXX_COMPILER}\"" APPEND)
    write_file(${file} "#define G__CFG_LDFLAGS \"${CMAKE_SHARED_LINKER_FLAGS}\"" APPEND)
    write_file(${file} "#define G__CFG_LIBP \"-L\"" APPEND)
    write_file(${file} "#define G__CFG_SOFLAGS \"-DLL\"" APPEND)
    write_file(${file} "#define G__CFG_SOOUT G__CFG_LDOUT" APPEND)
    write_file(${file} "#define G__CFG_OBJEXT \".obj\"" APPEND)
    write_file(${file} "#define G__CFG_EXEEXT \"${EXEEXT}\"" APPEND)
    write_file(${file} "#define G__CFG_SOEXT \".${SOEXT}\"" APPEND)
    write_file(${file} "#define G__CFG_DEBUG \"\"" APPEND) #TODO
    write_file(${file} "#define G__CFG_DEFAULTLIBS \"${SYSLIBS}\"" APPEND) 
    write_file(${file} "#define G__CFG_STREAMDIR \"\" " APPEND) #TODO
    write_file(${file} "#define G__CFG_EXPLLINK \"${EXPLICITLINK}\"" APPEND)
    write_file(${file} "#define G__CFG_BUILDREADLINE \"\"" APPEND)
    write_file(${file} "#define G__CFG_READLINELIBDIR \"\"" APPEND)
    write_file(${file} "#define G__CFG_READLINEINCDIR \"\"" APPEND)
    write_file(${file} "#define G__CFG_NEEDCURSES \"\"" APPEND)
    write_file(${file} "#define G__CFG_RM \"rm -f\"" APPEND)
    write_file(${file} "#define G__CFG_MV \"mv -f\"" APPEND)
    write_file(${file} "#define G__CFG_INPUTMODE \"root\"" APPEND)
    write_file(${file} "#define G__CFG_INPUTMODELOCK \"off\"" APPEND)
    write_file(${file} "#define G__CFG_MAKEIMPLIB \"\"" APPEND)
    write_file(${file} "#define G__CFG_CINTSYSDIR \"${CMAKE_SOURCE_DIR}\"" APPEND)
    write_file(${file} "#define G__CFG_HAVE_CONFIG \"1\"" APPEND)
    write_file(${file} "#define CINTSYSDIR \"${CMAKE_SOURCE_DIR}\"" APPEND)
    write_file(${file} "#define G__CFG_MAKEIMPLIB \"\"" APPEND)
    write_file(${file} "#define G__CFG_HAVE_CONFIG \"1\"" APPEND)  
  endif()  
endfunction()
