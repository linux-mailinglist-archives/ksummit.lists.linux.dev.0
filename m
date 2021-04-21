Return-Path: <ksummit+bounces-19-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D719367442
	for <lists@lfdr.de>; Wed, 21 Apr 2021 22:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 1567F3E2507
	for <lists@lfdr.de>; Wed, 21 Apr 2021 20:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A9A02FA1;
	Wed, 21 Apr 2021 20:45:23 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4749B2F81
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 20:45:22 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 35DE261426;
	Wed, 21 Apr 2021 20:45:21 +0000 (UTC)
Date: Wed, 21 Apr 2021 16:45:19 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Roland Dreier
 <roland@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210421164519.4aa271b9@gandalf.local.home>
In-Reply-To: <alpine.DEB.2.22.394.2104212233450.20674@hadrien>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<20210421152209.68075314@gandalf.local.home>
	<CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
	<alpine.DEB.2.22.394.2104212150230.20674@hadrien>
	<20210421132824.13a70f6c@hermes.local>
	<alpine.DEB.2.22.394.2104212233450.20674@hadrien>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Apr 2021 22:37:55 +0200 (CEST)
Julia Lawall <julia.lawall@inria.fr> wrote:

> The apology states that they didn't detect any vulnerabilities.  They
> found three non exploitable bugs and submitted incorrect patches for them.
> When the patches received some positive feedback, they explained that the
> patches were incorrect and provided a proper fix.
> 
> So they damaged trust, but not actually the Linux kernel...

That's what they stated, but did any patch that they knew was incorrect
actually make it into the kernel? If so, then it's on them.

-- Steve

