/*
 * $Header$
 * $Log$
 * Revision 1.1  2014/07/15 16:46:10  pzuccon
 * Initial revision
 *
 */

#ifndef __XSSTEPBUTTON_H
#define __XSSTEPBUTTON_H

#include <TGFrame.h>
#include <TGButton.h>

/* --- Messages that generate ---- */

#define XSSTEPBUTTON_UP		0
#define XSSTEPBUTTON_DOWN	1

/* =========== XSStepButton ============== */
class XSStepButton : public TGCompositeFrame
{
protected:
	const TGWindow	*fMsgWindow;	// window handling listbox messages

	Int_t		buttonId;

	TGLayoutHints	*lHints;

	TGPictureButton	*upButton,
			*downButton;

	UInt_t		width,
			height;

public:
	XSStepButton( const TGWindow *p, Int_t id );
	~XSStepButton();

	virtual void	Associate(const TGWindow *w) { fMsgWindow = w; }

	virtual Bool_t	ProcessMessage(Long_t msg,
				Long_t param1, Long_t param2);

	virtual TGDimension	GetDefaultSize() const
			{ return TGDimension(width,height); }


	//ClassDef(XSStepButton,1)
}; // XSStepButton

#endif
