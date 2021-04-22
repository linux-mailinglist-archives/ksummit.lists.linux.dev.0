Return-Path: <ksummit+bounces-123-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C78A36888A
	for <lists@lfdr.de>; Thu, 22 Apr 2021 23:26:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 73FE13E8A0D
	for <lists@lfdr.de>; Thu, 22 Apr 2021 21:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61EFD2FA4;
	Thu, 22 Apr 2021 21:26:09 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA82FA1
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 21:26:08 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1619126381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b66py62GIBeGKJIx3xBAI1xEzmQTRfu3F7c9sWWDEg0=;
	b=lO0k3HrhFaG0jB+cSUyY77/19phGAhjgc0mUnxC3Fs2w/8kt63mxtyuZJceqmu66Viqqbg
	qwIj4kDqCsj+hMwIeUDm3tovZJN/+MjTt+C9CNfTEwxs4GY8PBHfcP3pSInU5xuZT3mRc/
	XQlShotEFsXrb6QXk2LR5em5FFc5D9svIWJg5632/Z7QEntLqHuJO2U5Kd1wln2hwI8T0h
	Yfef5gUef4QrpxFIrzD3545LnAF+ou3p8kbdnNYm7u+rsjc4nT8459wnq2wryaOf6kgPDW
	iBUtEX4wJn3Uik7SU9NC0ClH8MEbUwH7yqBSHhJAKEqNSGsluN/PbNf/p4xjOw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1619126381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b66py62GIBeGKJIx3xBAI1xEzmQTRfu3F7c9sWWDEg0=;
	b=HULrowbLw0PKGHvoQ6IFUTzYT50YvgWNSO2btU/29qp2TmF7PpspwtqIPvipQNNpnMLs6D
	9aooE5irs/OkvQDQ==
To: Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
In-Reply-To: <20210422111939.0c555039@gandalf.local.home>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk> <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk> <20210422111939.0c555039@gandalf.local.home>
Date: Thu, 22 Apr 2021 23:19:41 +0200
Message-ID: <875z0exbiq.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 22 2021 at 11:19, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 14:23:39 +0100
> Mark Brown <broonie@kernel.org> wrote:
>
>> > For me the most annoying is to get several patches from the middle of a
>> > series. IMHO, sending at least cover letter to everyone is the bare minimum
>> > so that people at least can take a look at high level details and request a
>> > repost.  
>> 
>> Yes, the cover letter should always go to everyone.
>
> And that's still the one thing that quilt send-mail does not support :-p

It's not rocket science to fix that with some scripting around it.

Thanks,

        tglx

