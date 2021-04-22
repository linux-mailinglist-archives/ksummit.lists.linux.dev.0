Return-Path: <ksummit+bounces-126-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FF23688A4
	for <lists@lfdr.de>; Thu, 22 Apr 2021 23:36:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CEC203E48F1
	for <lists@lfdr.de>; Thu, 22 Apr 2021 21:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC5382FA5;
	Thu, 22 Apr 2021 21:36:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0A62FA1
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 21:36:40 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8050060BD3;
	Thu, 22 Apr 2021 21:36:39 +0000 (UTC)
Date: Thu, 22 Apr 2021 17:36:37 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Mark Brown <broonie@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Leon Romanovsky <leon@kernel.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <20210422173637.67354c26@gandalf.local.home>
In-Reply-To: <875z0exbiq.ffs@nanos.tec.linutronix.de>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
	<YID5xhy2vv45fnOv@unreal>
	<20210422124023.GD4572@sirena.org.uk>
	<YIFx/iorjncjslob@linux.ibm.com>
	<20210422132339.GF4572@sirena.org.uk>
	<20210422111939.0c555039@gandalf.local.home>
	<875z0exbiq.ffs@nanos.tec.linutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Apr 2021 23:19:41 +0200
Thomas Gleixner <tglx@linutronix.de> wrote:

> On Thu, Apr 22 2021 at 11:19, Steven Rostedt wrote:
> > On Thu, 22 Apr 2021 14:23:39 +0100
> > Mark Brown <broonie@kernel.org> wrote:
> >  
> >> > For me the most annoying is to get several patches from the middle of a
> >> > series. IMHO, sending at least cover letter to everyone is the bare minimum
> >> > so that people at least can take a look at high level details and request a
> >> > repost.    
> >> 
> >> Yes, the cover letter should always go to everyone.  
> >
> > And that's still the one thing that quilt send-mail does not support :-p  
> 
> It's not rocket science to fix that with some scripting around it.
> 

You can script it so that everyone in the Cc's gets all patches, but you
need to modify quilt to make it where it sends the extra Cc's just the
cover letter.

Another approach is to have quilt just save to a mbox, and modify that, and
use another mail program to send that mbox.

-- Steve

