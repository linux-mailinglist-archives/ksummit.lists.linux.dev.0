Return-Path: <ksummit+bounces-2867-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E+VH9tQpWnS8QUAu9opvQ
	(envelope-from <ksummit+bounces-2867-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 02 Mar 2026 09:56:59 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F7D1D50BA
	for <lists@lfdr.de>; Mon, 02 Mar 2026 09:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13DFC301A7DD
	for <lists@lfdr.de>; Mon,  2 Mar 2026 08:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84E538BF60;
	Mon,  2 Mar 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQHgtxOg"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62ECE38A71C
	for <ksummit@lists.linux.dev>; Mon,  2 Mar 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772441760; cv=none; b=HRSDgwXG3nVC7jBH6Q33MZcArOfNKlQ9ZU4iA8512rqO5+Vt00a+rkErvG6D1QmeMuwYSzjQqeSfcUKM1ueQhc2zJT38XlW3vhJ124Izu7N0QJoB+2igdEHeMYqSwjU67mWSBz3oZKQZzzQcwieeOZWOejDkBeo6g+C1JntdwPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772441760; c=relaxed/simple;
	bh=WId2eLBsRbziq4Ervkbn2juOSwZdpEd9snIXbYFJe6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iwm4Qb02UXQ6aotyJQ/5fYCSjKB3pcJRUbEhbVngtGoQ5bfz2khoWfs3KHj9y937wTip+7iK3IDV570UIj9I6JUUou6PVd5Ud55aIftmnbaqykXp2uB8d+WEZCP/2+5sg+yEQndcQGC5/bQ9SgTuM7bYWumiPVgTvZmLTqZgv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQHgtxOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5E49C2BC9E;
	Mon,  2 Mar 2026 08:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772441760;
	bh=WId2eLBsRbziq4Ervkbn2juOSwZdpEd9snIXbYFJe6Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iQHgtxOgmV05FrF2W91vHJjHT2FPiAe1vBj8s/wZosRFAn8p9bRCM3OX/00s4q5GE
	 DjghFoUFU6/g0CmHXvcCHhay1m8AHvEXfO1aW9LrLtnXv3pkwNcqCR4HNCLK2BzbHZ
	 eD4+bJg6XndnrCCKh3zcZqHDiaqP77TTp+ABGoEdWW9lB2BOPuhyRxrCA7lajWyBWC
	 9lSHmpbYYvMKHZNv8AnUm4xT7biC7HOdjeklNqAkLVXfCky/B8fSVcCsbp1/ckU1z9
	 nlaNa3TEMUOWepK2/JDQGx8qWKMzk7n2ntD8e61SfrKAUcleU77vDkmCwh2EPSbyl8
	 fdI8OoRtmCsjQ==
Date: Mon, 2 Mar 2026 09:55:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sasha Levin 
 <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Richard
 Weinberger <richard@nod.at>, Linus Torvalds <torvalds@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Andrew Morton <akpm@linux-foundation.org>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users
 <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <20260302095554.3ee591d6@foz.lan>
In-Reply-To: <f748d3e345d0e0df0b927be20693ae4dee02d3de.camel@HansenPartnership.com>
References: <CAMuHMdWHRdsXahgxXMsSDFuuUwxzpvkT4oujg=tje2Rr5jr3SA@mail.gmail.com>
	<1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
	<5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
	<1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
	<CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
	<1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
	<20260228152617.06b392de@fedora>
	<583136576.604.1772310537428.JavaMail.zimbra@nod.at>
	<20260228155611.70911c0f@fedora>
	<aaRZ1EIDE-SlqWOo@laps>
	<20260301153526.GE2860169@killaraus.ideasonboard.com>
	<f748d3e345d0e0df0b927be20693ae4dee02d3de.camel@HansenPartnership.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-2867-lists=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,hansenpartnership.com:email,decode_stacktrace.sh:url]
X-Rspamd-Queue-Id: E9F7D1D50BA
X-Rspamd-Action: no action

On Sun, 01 Mar 2026 11:15:53 -0500
James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> On Sun, 2026-03-01 at 16:35 +0100, Laurent Pinchart wrote:
> > On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:  
> > > On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:  
> > > > On Sat, 28 Feb 2026 21:28:57 +0100 (CET)
> > > > Richard Weinberger <richard@nod.at> wrote:
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
> So "non-deterministic" is the new anti-AI phrase?  I get that some
> people think it's never useful, but this does seem like one of the
> cases where humans can't be bothered most of the time and AI can
> provide a reasonable response.
> 
> We could even give it bonus points for building the kernel with the
> revert and asking the reporter to try it (which should also be possible
> if a bit expensive in terms of cloud resources).

Sounds an interesting idea, but making AI write patches (or produce
an output that requires a more strict format) is not something that
doesn't work out of the box, if you use only LLM. 

I did some tests myself, writing a program meant to strings on a .po 
file, meant to complete a language translation(*). The only way it worked
is when I used a prompt asking it to produce a "from/to" table, and
then writing a function that would do the string replacements.

If we want AI to produce revert patches, it is probably better to:

- use a prompt for LLM to pick the original code and generate a new
  code to replace;
- compile the code to be sure that LLM didn't break it. If it does,
  send back the issues to LLM - eventually repeating this step a
  couple of times before giving up;
- run "diff" command line (or use a diff library) to produce a valid
  output.
    
(*) In the end, I opted to not use it in practice, nor the produced
    patches, as despite LLM translation were not bad (I tested it on
    languages I can understand), it didn't pick right some more
    technical messages. It also mangled a little bit with message
    capitalization and whitespacing. 

    If I had enough time to do translations myself, though, I would
    use it, as the core of the translations are good, but a
    significantly amount of them would require manual adjustments. 
    Still, it could reduce a lot the time spent on doing 
    translations.

Thanks,
Mauro

