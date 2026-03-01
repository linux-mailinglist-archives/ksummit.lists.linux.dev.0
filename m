Return-Path: <ksummit+bounces-2859-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FA9MbVlpGlcfgUAu9opvQ
	(envelope-from <ksummit+bounces-2859-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:13:41 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B206A1D08CC
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:13:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D12B300FED1
	for <lists@lfdr.de>; Sun,  1 Mar 2026 16:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741543203A0;
	Sun,  1 Mar 2026 16:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sN0Qzr1i"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09C0317157
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 16:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772381607; cv=none; b=nBvOIt3DVkCgh29NHWSZlJshlTDcGyvPMgV42M2A0CRYex42E7wvunNAT7PL9Isa+oA4I8dYQhQLD5pU4oHaHZeewqHYKPW0sbM1q4AIhyzu/8Sfv8HMSt8A60CDFR1GzEVbqoyVX950TpthJk0yRA9jkvV8HFtgSao6KjZVOb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772381607; c=relaxed/simple;
	bh=G7PHH6syJfNZBU4uT1IIGE05Rl97nY7MhLHlXZxPHPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHU9l81HjN/kxogjYOHRjQ8UV7YC+OvlcxAgfnOknG4A5WASRuktXDGQIv/8497TvTTuKRufiQILBpc4CLzW1Pp52VBSye7iXxfRbXS6YKTZ035QBT7MivapGotflNoDV8ai1Hf6cIEhNtrvuUW+7/JYOpocF6E53LJrqhLqE98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sN0Qzr1i; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C41C7673;
	Sun,  1 Mar 2026 17:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772381542;
	bh=G7PHH6syJfNZBU4uT1IIGE05Rl97nY7MhLHlXZxPHPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sN0Qzr1ixEK/CN2IStK1JaJHgIzg5E9g87Pjz7lKqIuf6nHYWgSzohbk/FDdLwOmB
	 LvADSK3+cYxcNc4ZzyHbY9cq0kLHOZrEZJ99w+DdqbQp0gvpwW6bY5BrKkwvy5GlM5
	 Vdy/o8JwZVcYWuZs9MiMTD9k8iPGxLLUTWA+GlhQ=
Date: Sun, 1 Mar 2026 17:13:17 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260301161317.GA2906342@killaraus.ideasonboard.com>
References: <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
 <aaRegZjbE6SgyaDq@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaRegZjbE6SgyaDq@laps>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2859-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,decode_stacktrace.sh:url,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: B206A1D08CC
X-Rspamd-Action: no action

Hello Sasha,

On Sun, Mar 01, 2026 at 10:42:57AM -0500, Sasha Levin wrote:
> On Sun, Mar 01, 2026 at 04:35:26PM +0100, Laurent Pinchart wrote:
> > On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
> >> On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
> >> > On Sat, 28 Feb 2026 21:28:57 +0100 (CET) Richard Weinberger wrote:
> >> >
> >> >> Wouldn't that only work if the report is able to upload the kernel debug
> >> >> info too?
> >> >
> >> > Yes, this would be nice if we had the help from the distros that could
> >> > automate this process.
> >>
> >> So I've been poking at using LLMs for this.
> >>
> >> decode_stacktrace.sh is great when you have a debug build handy, but
> >> asking a random bug reporter to obtain debuginfo, set up the tooling,
> >> and run the script is quite the hurdle.
> >>
> >> The debuginfo problem is solvable on the server side though. Given a
> >> kernel version string from the oops, an LLM can figure out which distro
> >> and package version the reporter is running, pull the right debuginfo
> >> (or build from the matching config/tag if no debuginfo package exists),
> >> and run decode_stacktrace.sh itself.
> >
> > Do we really have to use non-deterministic tools that will inevitably
> > produce correct-looking but otherwise useless backtraces from time to
> > time, confusing developers and wasting time for everybody, when we can
> > instead easily develop tools that will work in a deterministic fashion ?
> > I'm getting *really* sick of people pushing for LLM usage when it's
> > clearly the wrong tool. Please stop.
> 
> The LLM actually runs scripts/decode_stacktrace.sh. The non-deterministic part
> is being able to get our hands on various debug symbols from
> distros/vendors/etc.

That was my understanding, yes.

> Instead of just crapping on everything,

Please tone the insults down.

> can you propose a different
> deterministic solution that would have worked for
> https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/ ?

Not as a procedure to extract line numbers that will work retroactively
of course, but I don't think that's the point.

As we're discussing new developments to replace bugzilla, working with
distributions to streamline bug reporting would be more deterministic.
Running the stack trace decode in the server side is a good idea, and
the server should receive in addition to the stack trace either the
debuginfo or, when running a distro kernel, an identifier of the exact
kernel version to download the debuginfo from an authoritative source.

> Or should we just let that bug report rot as it usually happens because you have
> some dislike for LLMs?

Let's not resort to straw man arguments, you know that's not what I
said.

I will stand by my original claim, that using the community's
development resources to create non-deterministic tools when a
deterministic solution isn't more difficult is a waste of time and
resources. I've always disliked suboptimal solutions, it's not limited
to LLMs.

-- 
Regards,

Laurent Pinchart

