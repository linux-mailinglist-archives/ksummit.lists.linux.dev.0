Return-Path: <ksummit+bounces-55-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE4F367FEF
	for <lists@lfdr.de>; Thu, 22 Apr 2021 14:01:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 819A83E5116
	for <lists@lfdr.de>; Thu, 22 Apr 2021 12:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CBD12FA2;
	Thu, 22 Apr 2021 12:01:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675E2F83
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 12:01:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED398613FA;
	Thu, 22 Apr 2021 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619092903;
	bh=+wU3He4npS/C+Zt/rZimjCmPtjMvu9xJe0SD/+f1TmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYXKRTADoKieYvplMfDWGiaGAAjQPJ082CrcLO6tmBe9HazVX28uKZF0jQhjaa7f6
	 /BdpLNhlfPSDRotWfvbOlQzKSEjin6NDIZPIz0A/ZwmBg1fWvn4EsgLecddvAeAaGv
	 q7FOjumvQLcG5GwQz+T5hUaUCD+F2BYowt7Zivz1/YnGJgrpzJQtOFqWsq5WDOauW0
	 BKO3ZRPrk5JI5a2eRUjrhpYlutb5M2WFKBMkRSC+RM+A9jvumfYaZm+0ZOtDAHG0IB
	 x8/GeDdfXIhFJZphsFTO+sOdn+XnxzmXLSbM57KGQy8fBMG5uASo4Gq3r21Nl79XLt
	 05nM7yvu8x2Hw==
Date: Thu, 22 Apr 2021 15:01:39 +0300
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
Message-ID: <YIFlo6TSE1n6tD6K@unreal>
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

And didn't you ask yourself after seeing same 29 patches that the
correct fix should be in another place? pm_runtime_get_sync?

> 
> > [2] Whether we can trust the reviewers is another question, and might
> >     become the topic of another research project :-(
> 
> That's the main concern.
> 
> Thanks,
> Mauro
> 

