Return-Path: <ksummit+bounces-23-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077C13674E4
	for <lists@lfdr.de>; Wed, 21 Apr 2021 23:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 1A46F1C24B9
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB0B2FA1;
	Wed, 21 Apr 2021 21:49:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.namei.org (namei.org [65.99.196.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36A52F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 21:49:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.namei.org (Postfix) with ESMTPS id 5DE1DDC1;
	Wed, 21 Apr 2021 21:37:24 +0000 (UTC)
Date: Thu, 22 Apr 2021 07:37:24 +1000 (AEST)
From: James Morris <jmorris@namei.org>
To: Julia Lawall <julia.lawall@inria.fr>
cc: Stephen Hemminger <stephen@networkplumber.org>, 
    Roland Dreier <roland@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
    James Bottomley <James.Bottomley@hansenpartnership.com>, 
    ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial"
 patches
In-Reply-To: <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
Message-ID: <d95ee281-4dc0-c5c1-ec87-81d83f44979@namei.org>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <20210421152209.68075314@gandalf.local.home> <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com> <alpine.DEB.2.22.394.2104212150230.20674@hadrien>
 <20210421132824.13a70f6c@hermes.local> <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 Apr 2021, Julia Lawall wrote:

> The apology states that they didn't detect any vulnerabilities.  They
> found three non exploitable bugs and submitted incorrect patches for them.
> When the patches received some positive feedback, they explained that the
> patches were incorrect and provided a proper fix.
> 
> So they damaged trust, but not actually the Linux kernel...

The issue is that there was no consent and no coordination, so we don't 
know the scope of the experiment and whether it was still continuing. 

We are this not able to trust anything the group said about what they'd
done or not done, until now [1].

In all probability there is nothing further amiss but we would not have 
expected them to use fake gmail accounts to submit bugs to the kernel 
either.

It's now on us to audit all of their known contributions, because we don't 
know the scope of the experiment, which was based on the use of deception, 
and we can't make any assumptions based on what they have said.

We also need the identity of the 'random' gmail accounts they used, 
although this should be handled by a small trusted group in private, as it 
will lead to privacy issues for kernel maintainers who responded to them 
in public.


[1] The UMN CS leadership has made a public statement now that the 
research is now suspended: 
https://twitter.com/UMNComputerSci/status/1384948683821694976


-- 
James Morris
<jmorris@namei.org>


