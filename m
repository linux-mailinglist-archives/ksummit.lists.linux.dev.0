Return-Path: <ksummit+bounces-2865-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOQ+OSNupGnwggUAu9opvQ
	(envelope-from <ksummit+bounces-2865-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:49:39 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1855C1D0BA9
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A5737300621D
	for <lists@lfdr.de>; Sun,  1 Mar 2026 16:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31AAF30FC23;
	Sun,  1 Mar 2026 16:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C6NoO3V8"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8ED30FC39
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 16:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383769; cv=none; b=JumItleuH8f52ODB+TO3Hjk6Lm+atVilqt7NPvgorePHJci/XUIfPYQpz6i5xJBpRpCrynecNyTIoby53Hyqm1HT6WrvNvBNbshXitXM4aALNWK9crE0mqETgbaBWELmG4HgLEDYBtEFED5qJr38nL8BF2gzqmHi2o4pO6Ny4gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383769; c=relaxed/simple;
	bh=JhX6mzZAqa1Y5h4/UaIwvTlQdUMDeBxfOAf7S+K1xpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YjZP2q/1u50OgPeXgjhURInVrUNFhkcnY6CHG81b3ReaXsk7Nc9WoCdp84qGl3DILALVUtMRphYPykoqlpiHCOylEFj8TM5fCiCdclLMxihscITbba+NAfWveLMBUU5CphCq6OPddHhVqvFABoqG4p2idUzvgoIZDObhB9iSjeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C6NoO3V8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [83.245.248.187])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A46176DC;
	Sun,  1 Mar 2026 17:48:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1772383706;
	bh=JhX6mzZAqa1Y5h4/UaIwvTlQdUMDeBxfOAf7S+K1xpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C6NoO3V8CPoa7L+jNX+siVgzOxBcEs4BXrVYfGkCV5u3YsnIyY9dylh74LKm9U8Re
	 ogemrT/TjV4gjhukuee11RaJOEQqIHgTzd/EvHX+FPRAfOmOhjGNz23jte/ZMuC+4s
	 e5GMZxtSsRYlijAif4gFRpeCrjZOquI7hbYopC4s=
Date: Sun, 1 Mar 2026 17:49:22 +0100
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260301164922.GB2906342@killaraus.ideasonboard.com>
References: <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
 <f748d3e345d0e0df0b927be20693ae4dee02d3de.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f748d3e345d0e0df0b927be20693ae4dee02d3de.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2865-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 1855C1D0BA9
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 11:15:53AM -0500, James Bottomley wrote:
> On Sun, 2026-03-01 at 16:35 +0100, Laurent Pinchart wrote:
> > On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
> > > On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
> > > > On Sat, 28 Feb 2026 21:28:57 +0100 (CET) Richard Weinberger wrote:
> > > > 
> > > > > Wouldn't that only work if the report is able to upload the
> > > > > kernel debug info too?
> > > > 
> > > > Yes, this would be nice if we had the help from the distros that
> > > > could automate this process.
> > > 
> > > So I've been poking at using LLMs for this.
> > > 
> > > decode_stacktrace.sh is great when you have a debug build handy,
> > > but asking a random bug reporter to obtain debuginfo, set up the
> > > tooling, and run the script is quite the hurdle.
> > > 
> > > The debuginfo problem is solvable on the server side though. Given
> > > a kernel version string from the oops, an LLM can figure out which
> > > distro and package version the reporter is running, pull the right
> > > debuginfo (or build from the matching config/tag if no debuginfo
> > > package exists), and run decode_stacktrace.sh itself.
> > 
> > Do we really have to use non-deterministic tools that will inevitably
> > produce correct-looking but otherwise useless backtraces from time to
> > time, confusing developers and wasting time for everybody, when we
> > can instead easily develop tools that will work in a deterministic
> > fashion ?
> 
> So "non-deterministic" is the new anti-AI phrase?

It's a characteristic of the tool that I don't think anyone disputes.
Even Linus said so in his now widely quoted opinion about vibe coding.

> I get that some
> people think it's never useful, but this does seem like one of the
> cases where humans can't be bothered most of the time and AI can
> provide a reasonable response.

I don't think I said "never useful". What I said here is that we should
focus our resources on a desterministic solution that we can trust, and
only use non-deterministic options when all else fails (or is too not
realistically possible due to a prohibitive development cost for
instance).

> We could even give it bonus points for building the kernel with the
> revert and asking the reporter to try it (which should also be possible
> if a bit expensive in terms of cloud resources).

I'd be very, very careful about deploying a system that tells people to
run unsigned kernel binaries downloading from the internet. That's even
less safe to advertise as a solution than curl | sudo bash.

> > I'm getting *really* sick of people pushing for LLM usage when it's
> > clearly the wrong tool. Please stop.
> 
> That's both uncalled for and unfair.  If we're not going to let AI
> write code then the most useful thing it can do for us is automate
> repetitive task we can't be bothered to do most of the time.  Bug
> triage seems to me to be an excellent example of that, particularly
> with reporters who aren't on upstream kernels.  Rather than having it
> declared useless ab initio, let's give it a chance to see how useful
> the actual results are.

One thing we can probably agree on is that LLMs seem to generate heated
discussions. Let's try to cool it down. As I wrote above, I never
declared it useless. I said that augmenting the stack trace with line
numbers using an LLM to guess the debuginfo will lead to incorrect
results from time to time, frustrating developers and wasting their
time, when we can work with distros to create a deterministic stack
trace decoding service. You can then use LLMs if interested to perform
additional tasks that would be much more difficult to handle in a
deterministic way.

-- 
Regards,

Laurent Pinchart

