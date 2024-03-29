/*****************************************************************************
 * Project: RooFit                                                           *
 * Package: RooFitCore                                                       *
 *    File: $Id$
 * Authors:                                                                  *
 *   GR, Gerhard Raven, NIKHEF/VU, Gerhard.Raven@nikhf.nl                    *
 *                                                                           *
 * Copyright (c) 2005, NIKHEF.  All rights reserved.                         *
 *                                                                           *
 * Redistribution and use in source and binary forms,                        *
 * with or without modification, are permitted according to the terms        *
 * listed in LICENSE (http://roofit.sourceforge.net/license.txt)             *
 *****************************************************************************/
#ifndef ROO_EFF_GEN_CONTEXT
#define ROO_EFF_GEN_CONTEXT

#include "RooAbsGenContext.h"
class RooAbsPdf;
class RooArgSet;
class RooDataSet;
class RooAbsReal;

class RooEffGenContext : public RooAbsGenContext {
public:
  RooEffGenContext(const RooAbsPdf &model,
                   const RooAbsPdf &pdf,const RooAbsReal& eff,
                   const RooArgSet &vars, const RooDataSet *prototype= 0,
                   const RooArgSet* auxProto=0, Bool_t verbose=kFALSE, const RooArgSet* forceDirect=0);
  virtual ~RooEffGenContext();

protected:
  void initGenerator(const RooArgSet &theEvent);
  void generateEvent(RooArgSet &theEvent, Int_t remaining);

private:
   RooArgSet* _cloneSet;           // Internal clone of p.d.f.
   RooAbsReal* _eff;               // Pointer to efficiency function
   RooAbsGenContext* _generator;   // Generator context for p.d.f
   RooArgSet* _vars;               // Vars to generate
   double _maxEff;                 // Maximum of efficiency in vars

   ClassDef(RooEffGenContext, 1) // Context for generating a dataset from a PDF
};
#endif
