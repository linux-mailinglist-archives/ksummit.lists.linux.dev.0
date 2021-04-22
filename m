Return-Path: <ksummit+bounces-129-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C6368918
	for <lists@lfdr.de>; Fri, 23 Apr 2021 00:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 65F3E1C5402
	for <lists@lfdr.de>; Thu, 22 Apr 2021 22:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB1A2FA3;
	Thu, 22 Apr 2021 22:40:01 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B970
	for <ksummit@lists.linux.dev>; Thu, 22 Apr 2021 22:40:00 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1619131199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VKYwA+wH6QJBskM+5fvYxpahZDI/7/NlXWP7JR/qd0M=;
	b=hgqOimi68OXVwiO+RKPnLrDsEzMN0jbehJ8Tllo234vLTzgPJd6LSWph7/2uoprmc80Dc6
	6UK3TTUGCX8S2OeHupC90HbhS8/RwV09VpfNZGxNoRt1pyLGdhFkc3S2ZmP18rQMqbHnxf
	1dWCATrMIl48fhYtIEFAlIFFoFZj52QGOC3l42gwDNEtQqNYLIplm4wjRGVGItlwjflamG
	E4RSz0xQZIikXtUGnb45iUr4AUB8SLsPclWD7RWFIF00sAzmci6xLzuFe7G5PbnWLRHKzu
	VrEvYwduX7BpS3A/qdiFWYiPc5CSMaa2LwBc9kTQTP52jkl46LuogYLagYZqwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1619131199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VKYwA+wH6QJBskM+5fvYxpahZDI/7/NlXWP7JR/qd0M=;
	b=yj/Sa/A9d233hFYZbAefZK4Cx278JnTnTcM3palEKMW3+RmU8BBdv2grHRDdQ0YIHH4vrB
	uTlH3EAubn/xI0Dw==
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mark Brown <broonie@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>, Leon Romanovsky <leon@kernel.org>, James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for "trivial" patches
In-Reply-To: <20210422173637.67354c26@gandalf.local.home>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com> <YID5xhy2vv45fnOv@unreal> <20210422124023.GD4572@sirena.org.uk> <YIFx/iorjncjslob@linux.ibm.com> <20210422132339.GF4572@sirena.org.uk> <20210422111939.0c555039@gandalf.local.home> <875z0exbiq.ffs@nanos.tec.linutronix.de> <20210422173637.67354c26@gandalf.local.home>
Date: Fri, 23 Apr 2021 00:39:58 +0200
Message-ID: <87tunyvt8h.ffs@nanos.tec.linutronix.de>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Apr 22 2021 at 17:36, Steven Rostedt wrote:
> On Thu, 22 Apr 2021 23:19:41 +0200
> Thomas Gleixner <tglx@linutronix.de> wrote:
>
>> On Thu, Apr 22 2021 at 11:19, Steven Rostedt wrote:
>> > On Thu, 22 Apr 2021 14:23:39 +0100
>> > Mark Brown <broonie@kernel.org> wrote:
>> >  
>> >> > For me the most annoying is to get several patches from the middle of a
>> >> > series. IMHO, sending at least cover letter to everyone is the bare minimum
>> >> > so that people at least can take a look at high level details and request a
>> >> > repost.    
>> >> 
>> >> Yes, the cover letter should always go to everyone.  
>> >
>> > And that's still the one thing that quilt send-mail does not support :-p  
>> 
>> It's not rocket science to fix that with some scripting around it.
>> 
>
> You can script it so that everyone in the Cc's gets all patches, but you
> need to modify quilt to make it where it sends the extra Cc's just the
> cover letter.
>
> Another approach is to have quilt just save to a mbox, and modify that, and
> use another mail program to send that mbox.

Which is not rocket science either :)


