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
#ifndef ROO_CONV_GEN_CONTEXT
#define ROO_CONV_GEN_CONTEXT

#include "RooAbsGenContext.h"
#include "RooArgSet.h"

class RooAbsAnaConvPdf;
class RooDataSet;
class RooRealIntegral;
class RooAcceptReject;
class TRandom;
class TIterator;
class RooRealVar ;
class RooNumConvPdf ;
class RooFFTConvPdf ;

class RooConvGenContext : public RooAbsGenContext {
public:
  RooConvGenContext(const RooFFTConvPdf &model, const RooArgSet &vars, const RooDataSet *prototype= 0,
		    const RooArgSet* auxProto=0, Bool_t _verbose= kFALSE);
  RooConvGenContext(const RooNumConvPdf &model, const RooArgSet &vars, const RooDataSet *prototype= 0,
		    const RooArgSet* auxProto=0, Bool_t _verbose= kFALSE);
  RooConvGenContext(const RooAbsAnaConvPdf &model, const RooArgSet &vars, const RooDataSet *prototype= 0,
		    const RooArgSet* auxProto=0, Bool_t _verbose= kFALSE);
  virtual ~RooConvGenContext();

  virtual void setProtoDataOrder(Int_t* lut) ;

  virtual void attach(const RooArgSet& params) ;

  virtual void printMultiline(std::ostream &os, Int_t content, Bool_t verbose=kFALSE, TString indent="") const ;


protected:

  virtual void initGenerator(const RooArgSet &theEvent);
  virtual void generateEvent(RooArgSet &theEvent, Int_t remaining);

  RooConvGenContext(const RooConvGenContext& other) ;

  RooAbsGenContext* _pdfGen ;   // Physics model generator context
  RooAbsGenContext* _modelGen ; // Resolution model generator context
  TString _convVarName ;        // Name of convolution variable
  RooArgSet* _pdfVarsOwned ;    // Owning version of pdfVars ;
  RooArgSet* _modelVarsOwned ;  // Owning version of modelVars ;
  RooArgSet* _pdfVars ;         // Holder of PDF x truth event
  RooArgSet* _modelVars ;       // Holder of resModel event
  RooArgSet* _pdfCloneSet ;     // Owner of PDF clone
  RooArgSet* _modelCloneSet ;   // Owner of resModel clone
  RooRealVar* _cvModel ;         // Convolution variable in resModel event
  RooRealVar* _cvPdf ;           // Convolution variable in PDFxTruth event
  RooRealVar* _cvOut ;           // Convolution variable in output event

  ClassDef(RooConvGenContext,0) // Context for generating a dataset from a PDF
};

#endif
