Return-Path: <ksummit+bounces-2802-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPrlDzSpc2nOxwAAu9opvQ
	(envelope-from <ksummit+bounces-2802-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:00:36 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D43178BB8
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA0573037880
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A9228D8FD;
	Fri, 23 Jan 2026 17:00:22 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97249274641
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 17:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187622; cv=none; b=PXOI0GE7LdILhDt4FUGAGTP8njvFbAPMDRMoY3UF+Q/AHUeB2TsTWAO0Nosetc+DRryNa8i4EXyQ+HPSZTkdHmGuDCmLlDaji9GejT1BCieKFta6DebqrQ+94J7GPRo0tD4PlxVCMlSH3qGwj4NdGLKQFtH4goU6wkT/AH67PFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187622; c=relaxed/simple;
	bh=HpGe6RHmfi+5UCbociUObB9nIzpSU3gsT8sxpzh6xxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsujGEETruGMM9Z49yg2YbQyOMMEnqm5qF8Btq6SSq9CPqHgaODUcUP1RVv6oG2SFlhYgP8Jo+2zMNEQzQuOckhHBh2tuN9jOtBwZMKa02LmHB60TxMO829qlOVRmXca1ZIL0Jr1vjAmqkj1WXt+G7UbuH2+37EQkFsndavZzKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf19.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id B487B13B006;
	Fri, 23 Jan 2026 17:00:18 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf19.hostedemail.com (Postfix) with ESMTPA id B790620027;
	Fri, 23 Jan 2026 17:00:16 +0000 (UTC)
Date: Fri, 23 Jan 2026 12:00:44 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Joe Perches <joe@perches.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, James Bottomley 
 <James.Bottomley@hansenpartnership.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <ukleinek@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123120044.6290c453@gandalf.local.home>
In-Reply-To: <677cb7ad745541bdd38a5598d476af66ed2e7aeb.camel@perches.com>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
	<806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
	<2026012340-wildlife-scratch-1efd@gregkh>
	<677cb7ad745541bdd38a5598d476af66ed2e7aeb.camel@perches.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: t6njk8yojwuij6fibfcg6h39pxgxocit
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1958u0xPh1Vx/2Ih0Y6NMbRayCZCiHZdBk=
X-HE-Tag: 1769187616-774543
X-HE-Meta: U2FsdGVkX18IF+3hKCl12FPf3J3d2YPeXpGB0cnn0G/vDFrtzf9pZIpVBEMl6ukpwkqVZg/kPz5QkP8N1dpI7lwtJ9SCoIvAW5Kk0+FFUWDWoC2ScuFFcBchaLciFTNrIB/iY39rnm/jaiNAOWN4WuAmHbPYlvjoiwal3fXVpNfO2lPqYslLKRc/dpkaM2+Hsw0PmDfPOaglomS0M9siMW9NX8GwIjGSvU4MeMGQewS5afXn1c1qtZeHMZxvG669wuRcUgnGfmFSCcndbPH5M+/a7ZFI5OFBRNG5c7BC7TNBZ2WE3RXGQOEcTWskHDK7aw8e7Vf/M0CCwn2XDZRXAe7mHqV8tazDiBJ4A+u32+T1Whr+3Tg5tHlhz+qRmHAdU/U28+T3MaaIW41yDuPu1A==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2802-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perches.com:email,gandalf.local.home:mid]
X-Rspamd-Queue-Id: 8D43178BB8
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 08:42:51 -0800
Joe Perches <joe@perches.com> wrote:

> On Fri, 2026-01-23 at 17:33 +0100, Greg KH wrote:
> > Surely you don't want us to be touting a bunch of vaporware at this
> > point in time, right?  
> 
> By announcing it before showing it you _are_ touting it.

Nah, I call this "Conference driven development". Where I submit talking
about something that is vaporware which drives me to develop it before I
give my talk about it.

Then at the talk I learn more about better ways to update the feature and
modify it before it gets in an upstream release.

Although, I don't think there will be a lot of kernel folks at the Member Summit.

-- Steve

