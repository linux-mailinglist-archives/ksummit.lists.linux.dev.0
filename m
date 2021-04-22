Return-Path: <ksummit+bounces-48-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B33BE367E2F
	for <lists@lfdr.de>; Thu, 22 Apr 2021 11:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 219101C3FA9
	for <lists@lfdr.de>; Thu, 22 Apr 2021 09:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41DE62FA1;
	Thu, 22 Apr 2021 09:55:20 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F6571
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 09:55:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5BED6101E;
	Thu, 22 Apr 2021 09:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619085317;
	bh=0wgRuZqufQQshfQCSKDXanQJbS6u2CUdeyEmiL43pg4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cdrHJJBHGrAyJNGkjER4bbccIWGqx9O/Dmyp6hiKiKueYOCV8z4hS6W8rnepnbUf/
	 LDMyg1lxgnht5tKaJOqPhRfW9vk7MZnKf9IHr/t5HCpzvfJmPuD1aqPxHNBoCdlYuI
	 l5BKhezNpc90Ez4C9uFEBSK6Qbw88nSeFojvq/9hhd1v/MVQIoEL5uwHbPgKGwmyG7
	 tD14jsDOZSzv55rbBdzP/Bjbr9bP9U79M8DS74Ci2hO23Xzw8BLMeGwPULsvdkAspz
	 PzcB91Q1Q/75nM+3UYW4Uf7HvTAkJJhB7smTOIICZPdH4hOugklNkIsKw+dIvWIuP9
	 HHWowfGYTAVZg==
Date: Thu, 22 Apr 2021 11:55:11 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: James Morris <jmorris@namei.org>, Julia Lawall <julia.lawall@inria.fr>,
 Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier
 <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422115511.60d1f735@coco.lan>
In-Reply-To: <CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421152209.68075314@gandalf.local.home>
	<CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
	<alpine.DEB.2.22.394.2104212150230.20674@hadrien>
	<20210421132824.13a70f6c@hermes.local>
	<alpine.DEB.2.22.394.2104212233450.20674@hadrien>
	<d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
	<CAMuHMdU=c2bY1_sq+rSh1fON5QhNx8xWqMQLT+cD0BpqG0RtCg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Thu, 22 Apr 2021 09:34:38 +0200
Geert Uytterhoeven <geert@linux-m68k.org> escreveu:

> On Wed, Apr 21, 2021 at 11:50 PM James Morris <jmorris@namei.org> wrote:
> > On Wed, 21 Apr 2021, Julia Lawall wrote:  
> > > The apology states that they didn't detect any vulnerabilities.  They
> > > found three non exploitable bugs and submitted incorrect patches for them.
> > > When the patches received some positive feedback, they explained that the
> > > patches were incorrect and provided a proper fix.
> > >
> > > So they damaged trust, but not actually the Linux kernel...  
> >
> > The issue is that there was no consent and no coordination, so we don't
> > know the scope of the experiment and whether it was still continuing.
> >
> > We are this not able to trust anything the group said about what they'd
> > done or not done, until now [1].
> >
> > In all probability there is nothing further amiss but we would not have
> > expected them to use fake gmail accounts to submit bugs to the kernel
> > either.
> >
> > It's now on us to audit all of their known contributions, because we don't
> > know the scope of the experiment, which was based on the use of deception,
> > and we can't make any assumptions based on what they have said.
> >
> > We also need the identity of the 'random' gmail accounts they used,
> > although this should be handled by a small trusted group in private, as it
> > will lead to privacy issues for kernel maintainers who responded to them
> > in public.  
> 
> What do we gain by blindly reverting all[1] umn.edu patches, and
> ignoring future patches from umn.edu?
> I think all of this is moot: other people may be doing the same thing,
> or even "in worse faith".  The only thing that helps is making sure
> patches get reviewed[2] before being applied.
> 
> [1] Judging from the new review comments, many of the 190 patches
>     to be reverted were real fixes.

The reverted ones for media (29 patches) didn't contain any malicious code.
One was useless (because the media core already fixes the pointed issue),
but the other ones were valid patches.

> [2] Whether we can trust the reviewers is another question, and might
>     become the topic of another research project :-(

That's the main concern.

Thanks,
Mauro

