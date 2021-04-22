Return-Path: <ksummit+bounces-58-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62684368024
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1911E1C4A11
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC1F2FA1;
	Thu, 22 Apr 2021 12:18:37 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1715D2F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:18:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61D246144E;
	Thu, 22 Apr 2021 12:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619093915;
	bh=aTqax5DHYHQNorUbKzHumYXBLulakurPjUzK2cNq7xk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3g3rbCcwD465nUVlRpCN0I66PTj2MNQB0BibRnqNbvE5S0GfZVDwpopENF1A+cFy
	 fC94CBZIZCj6VNAa7TTFy+pi7FWC04nfIXgt+8fJUX45sa9q7h539UpQZE4F80k08v
	 IBJSWNiri3Fb9XNOno/H7Jkfn4AG2nTpdLkCB5XHihc9X11k1XeNk+3GIwE//6zJBK
	 8oezZ2SYBOufhq6sIdF3A00NoDJPYhoRlXf2sjlxeGS9t7Df0R7Kekh8yF24+FQlXM
	 ElLH2/Yp5YPSCQ6WI4BdQmQIr8fSb2ohqcf9HKDA2E0VtUMr7NSrlNjqb6QAElaKUW
	 Q8YCwF1+rXuhA==
Date: Thu, 22 Apr 2021 15:18:31 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	James Morris <jmorris@namei.org>,
	Julia Lawall <julia.lawall@inria.fr>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Roland Dreier <roland@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <YIFpl4iAe/0zOTsh@unreal>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
 <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
 <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local>
 <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
 <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
 <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
 <20210422115511.60d1f735@coco.lan>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422115511.60d1f735@coco.lan>

On Thu, Apr 22, 2021 at 11:55:11AM +0200, Mauro Carvalho Chehab wrote:
> Em Thu, 22 Apr 2021 09:34:38 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> escreveu:
> 
> > On Wed, Apr 21, 2021 at 11:50 PM James Morris <jmorris@namei.org> wrote:
> > > On Wed, 21 Apr 2021, Julia Lawall wrote:  
> > > > The apology states that they didn't detect any vulnerabilities.  They
> > > > found three non exploitable bugs and submitted incorrect patches for them.
> > > > When the patches received some positive feedback, they explained that the
> > > > patches were incorrect and provided a proper fix.
> > > >
> > > > So they damaged trust, but not actually the Linux kernel...  
> > >
> > > The issue is that there was no consent and no coordination, so we don't
> > > know the scope of the experiment and whether it was still continuing.
> > >
> > > We are this not able to trust anything the group said about what they'd
> > > done or not done, until now [1].
> > >
> > > In all probability there is nothing further amiss but we would not have
> > > expected them to use fake gmail accounts to submit bugs to the kernel
> > > either.
> > >
> > > It's now on us to audit all of their known contributions, because we don't
> > > know the scope of the experiment, which was based on the use of deception,
> > > and we can't make any assumptions based on what they have said.
> > >
> > > We also need the identity of the 'random' gmail accounts they used,
> > > although this should be handled by a small trusted group in private, as it
> > > will lead to privacy issues for kernel maintainers who responded to them
> > > in public.  
> > 
> > What do we gain by blindly reverting all[1] umn.edu patches, and
> > ignoring future patches from umn.edu?
> > I think all of this is moot: other people may be doing the same thing,
> > or even "in worse faith".  The only thing that helps is making sure
> > patches get reviewed[2] before being applied.
> > 
> > [1] Judging from the new review comments, many of the 190 patches
> >     to be reverted were real fixes.
> 
> The reverted ones for media (29 patches) didn't contain any malicious code.
> One was useless (because the media core already fixes the pointed issue),
> but the other ones were valid patches.

I'm sorry that I didn't check all media commits, but this random commit
467a37fba93f ("media: dvb: Add check on sp8870_readreg") has a bug and
broke sp8870 (I don't know what is it).

diff --git a/drivers/media/dvb-frontends/sp8870.c b/drivers/media/dvb-frontends/sp8870.c
index 8d31cf3f4f07..270a3c559e08 100644
--- a/drivers/media/dvb-frontends/sp8870.c
+++ b/drivers/media/dvb-frontends/sp8870.c
@@ -293,7 +293,9 @@ static int sp8870_set_frontend_parameters(struct dvb_frontend *fe)
        sp8870_writereg(state, 0xc05, reg0xc05);

        // read status reg in order to clear pending irqs
-       sp8870_readreg(state, 0x200);
+       err = sp8870_readreg(state, 0x200);
+       if (err)
+               return err;

        // system controller start
        sp8870_microcontroller_start(state);


   67 static int sp8870_readreg (struct sp8870_state* state, u16 reg)
   68 {
   69         int ret;
 <...>
   77         if (ret != 2) {
   78                 dprintk("%s: readreg error (ret == %i)\n", __func__, ret);
   79                 return -1;
   80         }
   81
   82         return (b1[0] << 8 | b1[1]);
   83 }

The valid check should be if (err < 0);

Thanks

