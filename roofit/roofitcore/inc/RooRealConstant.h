/*****************************************************************************
 * Project: RooFit                                                           *
 * Package: RooFitCore                                                       *
 *    File: $Id$
 * Authors:                                                                  *
 *   WV, Wouter Verkerke, UC Santa Barbara, verkerke@slac.stanford.edu       *
 *   DK, David Kirkby,    UC Irvine,         dkirkby@uci.edu                 *
 *                                                                           *
 * Copyright (c) 2000-2005, Regents of the University of California          *
 *                          and Stanford University. All rights reserved.    *
 *                                                                           *
 * Redistribution and use in source and binary forms,                        *
 * with or without modification, are permitted according to the terms        *
 * listed in LICENSE (http://roofit.sourceforge.net/license.txt)             *
 *****************************************************************************/
#ifndef ROO_REAL_CONSTANT
#define ROO_REAL_CONSTANT

#include "Rtypes.h"
#include "Riosfwd.h"

class RooAbsReal ;
class RooArgList ;
class TIterator ;
#include "RooConstVar.h"

class RooRealConstant {
public:

  inline RooRealConstant() {} ;
  virtual ~RooRealConstant() {} ;
  static RooConstVar& value(Double_t value) ;

  static void cleanup() ;

  static RooConstVar& removalDummy() ;

protected:

  static void init() ;

  static RooArgList* _constDB ;    // List of already instantiated constants
  static TIterator* _constDBIter ; // Iterator over constants list

  ClassDef(RooRealConstant,0) // RooRealVar constants factory
};


#endif

