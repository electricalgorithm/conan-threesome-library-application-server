#pragma once

#ifdef WIN32
  #define awesome_library_EXPORT __declspec(dllexport)
#else
  #define awesome_library_EXPORT
#endif

awesome_library_EXPORT void awesome_library();
