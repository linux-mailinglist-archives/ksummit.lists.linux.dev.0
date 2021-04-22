Return-Path: <ksummit+bounces-47-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF20367DE2
	for <lists@lfdr.de>; Thu, 22 Apr 2021 11:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 16FFE3E42A8
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 686D52FA1;
	Thu, 22 Apr 2021 09:40:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C871
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:40:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 429C8600EF;
	Thu, 22 Apr 2021 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619084403;
	bh=89hUERu6AWWSJH0Ltr76m819+IeselIp1zUHFoElXfM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZGPTflsgd6qLu2OnH7oXluxjTizwqp5IWO/OmBD1DOhGUawmRGMFylL9bJ5dHV2bt
	 sVhG8qFK8DPRkcg22jhJXqzejDAI1B69dblQjJ6EEI97Xxut9c6MtAigpbzTuXRI8A
	 weozoyfqbBalvBw5tWyLrU5/NnzJcAAVynChdxlQ+WxS4fLcvPFdXNPy5l9zzvCaM3
	 gmwBl/yMQ/JqbillWzspoBq92abLC27AApCkvwiNONX8fM3PpAK660kXDyLBfPRI+4
	 otbT/WcNdvgmGT7BZ9EuVWhQCP/FqG0TotRg+YHpsXRtKd9npfEcWMxNkxe9zfU3+K
	 SsO43EHmgNJrA==
Date: Thu, 22 Apr 2021 11:39:57 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, James Morris
 <jmorris@namei.org>, Julia Lawall <julia.lawall@inria.fr>, Stephen
 Hemminger <stephen@networkplumber.org>, Roland Dreier <roland@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422113957.70200813@coco.lan>
In-Reply-To: <YIEq8NOigBgnYKgg@linux.ibm.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421152209.68075314@gandalf.local.home>
	<CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
	<alpine.DEB.2.22.394.2104212150230.20674@hadrien>
	<20210421132824.13a70f6c@hermes.local>
	<alpine.DEB.2.22.394.2104212233450.20674@hadrien>
	<d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
	<CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
	<YIEq8NOigBgnYKgg@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 10:51:12 +0300
Mike Rapoport <rppt@linux.ibm.com> escreveu:

> Hi,
> 
> On Thu, Apr 22, 2021 at 09:34:38AM +0200, Geert Uytterhoeven wrote:
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
> > [2] Whether we can trust the reviewers is another question, and might
> >     become the topic of another research project :-(  
> 
> Hopefully such research will require too much effort and won't get funding :)

I suspect, however, that the publicity gained by this attempt will
actually attract hackers that will try to do the same. We need to take
extra care to avoid other similar issues.

Thanks,
Mauro

