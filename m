Return-Path: <ksummit+bounces-2881-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKM5A3DfpmlkYAAAu9opvQ
	(envelope-from <ksummit+bounces-2881-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 14:17:36 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D431F00FA
	for <lists@lfdr.de>; Tue, 03 Mar 2026 14:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 149993022980
	for <lists@lfdr.de>; Tue,  3 Mar 2026 13:17:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 222F7311975;
	Tue,  3 Mar 2026 13:17:21 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4441E230E
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 13:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543840; cv=none; b=Ag8y9b6foXL9iVj41eLQ4bqswk9gu03gc2jEhsI2rG2ZSfhn5EHaZ1ucQcC2/2k6I2lw7FWVoDBRXxjS7jvIiyrd0bNRWyoKN6wV/QuqpSk2B3MuvWn9ToB24AzD0kIqi1NoWRCXMdJiAbMR6tuLG28YplQXBu1TsUJeNGKIBHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543840; c=relaxed/simple;
	bh=QClaprxph6VGp99U3t5clu0YF163ot4mfKv07vMJBYg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUt3X7mwohu0Z5TtJ8R1FNZO1FbU+QBCWid2nlK/2F7VRZ3tmIo7d932yqejBxGuZhUPG+i7tI77L2DAa3aqlYlixWa+B2bRVQuMVMhLtA1FogJN8FyB1x+GCn7ZywttfOfkehjlUexw/skmaPz3RsPRXfc5RkVdrpbTneKsrqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf16.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 5B1B2B6A2D;
	Tue,  3 Mar 2026 13:17:17 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf16.hostedemail.com (Postfix) with ESMTPA id E424520013;
	Tue,  3 Mar 2026 13:17:14 +0000 (UTC)
Date: Tue, 3 Mar 2026 08:17:48 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, torvalds@linuxfoundation.org,
 akpm@linux-foundation.org, geert@linux-m68k.org,
 konstantin@linuxfoundation.org, ksummit@lists.linux.dev,
 laurent.pinchart@ideasonboard.com, linux@leemhuis.info, richard@nod.at,
 users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <20260303081748.3d48c3f6@gandalf.local.home>
In-Reply-To: <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
	<20260302202828.2722037-1-sashal@kernel.org>
	<7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: wpaeg67zfr7iknookjuzuw8ci11acmd8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19RgnWlD2UJvFbsX0zT0QI3PITw36JYTPI=
X-HE-Tag: 1772543834-348093
X-HE-Meta: U2FsdGVkX18YOnzfy9o9Y4hO3u24gyiKjHACxWypsJA2mKq5RWsBTHbM+mU+sZqvqQJkVX3T2FrSKpgNGuoqWIUUSKCcqg0UR9dodlBzW5tKuYoB7eQkUwfHfKFljoTiydu8eNxugD0NWxVPpWEWZUTiApWTR6FoKDTqDEF3YyA9t6tSN8QtnY22jCwcZkbwgcu9gGwwnR0sg6OP3THVNnMmGheM7rvwJ+o0yAhrNDrlqQahvW614Gb6ppNPSYf7Ipa/gQhBoEid5kQZ6Icbg3ZtpObfL7k/gthmyRE7XFqaCzd74hzghFppfNzFmWaFhYO2CwMQwYvoRFt+tatrgOn2VHO+4yI4
X-Rspamd-Queue-Id: 13D431F00FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	NEURAL_HAM(-0.00)[-0.515];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-2881-lists=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,gandalf.local.home:mid]
X-Rspamd-Action: no action

On Tue, 3 Mar 2026 08:39:36 +0300
Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Mon, Mar 02, 2026 at 03:28:28PM -0500, Sasha Levin wrote:
> >   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)  
> 
> This is super useful, thanks.
> 
> Can the 0x prefix be dropped as well?

And print in decimal? Without the 0x, it could be ambiguous that it's hex.

> It is shorter to print in decimal up to 1 million.
> 
> () are just character noise, I'd drop them

I actually prefer them ;-)

Anyway, this looks more like a feature that is for us kernel developers
debugging our own kernels than something that should be added to a distro.
decode_stacktrace.pl can be used for those because distro kernels always
supply debug data that can be downloaded at any time.

I can see this being very useful when debugging something that causes a
crash, as it will save me time from cat'ing the output into
decode_stacktrace.pl after each crash. Although, I can see this having the
same issue as gdb has with static inlined functions.

-- Steve



