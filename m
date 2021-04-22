Return-Path: <ksummit+bounces-121-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B57368810
	for <lists@lfdr.de>; Thu, 22 Apr 2021 22:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8ADEF3E6138
	for <lists@lfdr.de>; Thu, 22 Apr 2021 20:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DF22FA3;
	Thu, 22 Apr 2021 20:28:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6B12F81
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 20:28:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEE71613FA;
	Thu, 22 Apr 2021 20:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1619123312;
	bh=zLQ/88ZvjlcczWNF5LPxUk5A51kCmzR4XXTYGv2mDyw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Gi+MK507C3dhvAQJuFvxoKDZRqA8VNrFW7Qr5Z7Rz2AXZku5+OE0gMs+tchM4XFx1
	 n5M7gzND1eZBWUOrcfFXqOdH0IDQInauSPlovHCc/BZNee2JIHb/BG25TpF+An60vt
	 vsEc6DkhRcxwj7IPlr4gcaauMTMSGqF2w15v3ptY=
Date: Thu, 22 Apr 2021 13:28:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, Jiri
 Kosina <jikos@kernel.org>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-Id: <20210422132831.51a711b9c08678a37dad85b5@linux-foundation.org>
In-Reply-To: <CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210422123559.1dc647fb@coco.lan>
	<CADVatmM8Nrht+nWpP99WQSm8HtHimNkjmUFDjjRTmMjuB+401Q@mail.gmail.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 12:03:24 +0100 Sudip Mukherjee <sudipm.mukherjee@gmail.com> wrote:

> May I suggest that we have a separate tree for trivial patches like
> the trivial.git tree that Jiri has and all trivial patches goes
> through that tree.

I'd prefer that such things go through my own hands, please.  For
reasons such as those that started this discussion.


Also, yes, "who sent it" is a key input to how carefully the patch is
treated.  If I don't recognize the name, I'll go through the patch with
a toothcomb due to lack of trust.

If I'm still not confident and nobody else has reviewed it (believably)
then I simply won't send it upstream.

So, obviously, the way to get malicious stuff past me is to forge the
sender's email address.  But hopefully the developer whose address was
forged will be awake enough to say "hey I didn't write that" in
response to the 2+ copies which I'll echo back at him/her.


