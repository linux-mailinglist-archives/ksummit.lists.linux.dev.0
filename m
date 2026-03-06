Return-Path: <ksummit+bounces-2888-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOUDO1LsqmmOYAEAu9opvQ
	(envelope-from <ksummit+bounces-2888-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 06 Mar 2026 16:01:38 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 940742234E9
	for <lists@lfdr.de>; Fri, 06 Mar 2026 16:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C70113015B5C
	for <lists@lfdr.de>; Fri,  6 Mar 2026 15:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6F03AE70A;
	Fri,  6 Mar 2026 15:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nSZW27Rp"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F291930EF87
	for <ksummit@lists.linux.dev>; Fri,  6 Mar 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772809290; cv=none; b=UNiIvXEmz3yGErlXVnHos+Zbphj5bwOroohA3iiXyWXmJfS9/Hh7EYDEnI3uw5bLEU+5bvny8qaa19KK9jVLuEdIP6HQX7NODVpjVGw0/in0om3sMcapHPzudItmwF0srY3xiCPlTQwipxkkg14UKudJ9z5IqO+TDLGeDoxmTck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772809290; c=relaxed/simple;
	bh=QpEJUqXYvjZchJtJR3wcOdkkEzohyNBC/p3+3T7msHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kbK6wwr/Raltc4Zgx1a2M/j38OHADuoYgITT2oqGv8jJg+wwEmqh9uQSGB/aBd7FFkJKYgsJ5buTwxqVlc9Z55glF5gGLFtT3nXwt75tn1ETWJDQ/fAQcqCWTe4w3UXlrPd2Z/KIXaq85v9DtZiUP2Wxnp7xxEQRTiXEiXut9bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nSZW27Rp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (85-76-15-83-nat.elisa-mobile.fi [85.76.15.83])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 27D18591;
	Fri,  6 Mar 2026 16:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772809222;
	bh=QpEJUqXYvjZchJtJR3wcOdkkEzohyNBC/p3+3T7msHE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nSZW27RpuIRd87VvGptbLVui4j/urVksnubyME+IgP+mlETmjoETCZlIggUtBAZEF
	 kOXlnFNP74rmzawzJZlESN6054oIdetsazNwciMumnDmdXAv+MkTO812R5hZWUUEPL
	 5jIDhYqJ5OJNzSyougJ4k/6uD1fv+VcWf0YBl1ZY=
Date: Fri, 6 Mar 2026 16:01:24 +0100
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
Message-ID: <20260306150124.GD2879901@killaraus.ideasonboard.com>
References: <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
 <aaRegZjbE6SgyaDq@laps>
 <20260301161317.GA2906342@killaraus.ideasonboard.com>
 <aaRo1kuzKj0dxl5i@laps>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaRo1kuzKj0dxl5i@laps>
X-Rspamd-Queue-Id: 940742234E9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2888-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Sasha,

On Sun, Mar 01, 2026 at 11:27:02AM -0500, Sasha Levin wrote:
> On Sun, Mar 01, 2026 at 05:13:17PM +0100, Laurent Pinchart wrote:
> > On Sun, Mar 01, 2026 at 10:42:57AM -0500, Sasha Levin wrote:
> >> On Sun, Mar 01, 2026 at 04:35:26PM +0100, Laurent Pinchart wrote:
> >> > On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
> >> >> On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
> >> >> > On Sat, 28 Feb 2026 21:28:57 +0100 (CET) Richard Weinberger wrote:
> >> >> >
> >> >> >> Wouldn't that only work if the report is able to upload the kernel debug
> >> >> >> info too?
> >> >> >
> >> >> > Yes, this would be nice if we had the help from the distros that could
> >> >> > automate this process.
> >> >>
> >> >> So I've been poking at using LLMs for this.
> >> >>
> >> >> decode_stacktrace.sh is great when you have a debug build handy, but
> >> >> asking a random bug reporter to obtain debuginfo, set up the tooling,
> >> >> and run the script is quite the hurdle.
> >> >>
> >> >> The debuginfo problem is solvable on the server side though. Given a
> >> >> kernel version string from the oops, an LLM can figure out which distro
> >> >> and package version the reporter is running, pull the right debuginfo
> >> >> (or build from the matching config/tag if no debuginfo package exists),
> >> >> and run decode_stacktrace.sh itself.
> >> >
> >> > Do we really have to use non-deterministic tools that will inevitably
> >> > produce correct-looking but otherwise useless backtraces from time to
> >> > time, confusing developers and wasting time for everybody, when we can
> >> > instead easily develop tools that will work in a deterministic fashion ?
> >> > I'm getting *really* sick of people pushing for LLM usage when it's
> >> > clearly the wrong tool. Please stop.
> >>
> >> The LLM actually runs scripts/decode_stacktrace.sh. The non-deterministic part
> >> is being able to get our hands on various debug symbols from
> >> distros/vendors/etc.
> >
> > That was my understanding, yes.
> >
> >> Instead of just crapping on everything,
> >
> > Please tone the insults down.
> 
> Happily. Please stop telling me to shut up without offering an alternative :)

I seem to have failed to convey my opinion properly, I'll try better.

> >> can you propose a different
> >> deterministic solution that would have worked for
> >> https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/ ?
> >
> > Not as a procedure to extract line numbers that will work retroactively
> > of course, but I don't think that's the point.
> >
> > As we're discussing new developments to replace bugzilla, working with
> > distributions to streamline bug reporting would be more deterministic.
> > Running the stack trace decode in the server side is a good idea, and
> > the server should receive in addition to the stack trace either the
> > debuginfo or, when running a distro kernel, an identifier of the exact
> > kernel version to download the debuginfo from an authoritative source.
> 
> Look at the bug reports we discussed in the thread: one is a custom built
> kernel, and one is a kernel without available debug symbols.

Note that for custom-built kernels I think it's reasonable to ask the
submitter for debuginfo (probably in the form of a decoded stack trace).
If someone is able to build a kernel manually, I expect them to be able
to run a stack trace decoding tool.

> Even if we had the
> best relationships with all our distro friends, had a central DB with all debug
> symbols, we would still not able to tackle this.

Sure, nothing we do will be able to increase our bug report handling to
100% success. I even agree that there are cases where heuristics could
be helpful. This being said, I haven't checked personally, but I would
be very surprised if the majority of the bug reports were related to
kernels for which debuginfo can't be accessed one way or another.

What concerned me in my initial reply, and still concerns me, is
applying a non-deterministic method to the problem when the vast
majority of cases can be solved deterministically. It would mean we
would consume more resources to get a suboptimal results, which is
guaranteed to sometimes produce wrong but plausible-looking results.
It's becoming an increasingly common pattern to throw LLMs as a magic
solution to all problems, despite all the drawbacks, and I'm really
getting tired of that.

My initial thought, before seeing your proposal, was to handle the
majority case with a DB of debuginfo. Yes, it will require coordination
with distributions, and some development, but what is being discussed in
this mail thread is development of a new service anyway. Maybe I fail to
see where this would be difficult or require more development effort
than we can afford ?

I now see you've made a proposal in this thread to embed file and line
info in kallsyms. It seems better than what I had in mind, I will review
it.

> >> Or should we just let that bug report rot as it usually happens because you have
> >> some dislike for LLMs?
> >
> > Let's not resort to straw man arguments, you know that's not what I
> > said.
> 
> I know it's not your intent, but this is what happens in practice. Look at how
> many bug reports show up on our mailing lists and are either just ignored, or
> end up with a response or two that makes no progress.

I honestly don't know how much line numbers in stack traces would help
there. I feel the issue is more related to lack of maintainer bandwidth.

> > I will stand by my original claim, that using the community's
> > development resources to create non-deterministic tools when a
> > deterministic solution isn't more difficult is a waste of time and
> > resources. I've always disliked suboptimal solutions, it's not limited
> > to LLMs.
> 
> I don't disagree that a deterministic solution would be better. My argument is
> that I don't think we can have one.

Let's see if you proved yourself wrong with the patch you posted in the
mail thread :-)

> Again, feel free to prove me wrong, just don't tell me to shut up without
> offering a better alternative.

There are at least two ideas now (debuginfo DB and file:line in
kallsyms). Let's see where those leads.

-- 
Regards,

Laurent Pinchart

