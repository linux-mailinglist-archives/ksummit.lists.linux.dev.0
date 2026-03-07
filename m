Return-Path: <ksummit+bounces-2890-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id PrJoLDdQrGnDogEAu9opvQ
	(envelope-from <ksummit+bounces-2890-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 07 Mar 2026 17:20:07 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E3422CA88
	for <lists@lfdr.de>; Sat, 07 Mar 2026 17:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2C8B3029E7A
	for <lists@lfdr.de>; Sat,  7 Mar 2026 16:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707BD3A4522;
	Sat,  7 Mar 2026 16:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X/QhU8BI"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD560328251
	for <ksummit@lists.linux.dev>; Sat,  7 Mar 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772900399; cv=none; b=NDPO5Wm2ggNxNt8/2s9zl3CH+ts9LfF9qzPWMKxzOjAdB7Alt0csSviMUHBA9jytehf5lpotaUwSkCyEuJJg6/tY0bUJ8pv8XZp88gZkXefOLJKg6PjyAS/iS9tm/w1SGeFa2Y1ywXZz8tk53MKmFc5OEkdBbJ92t7KuKg5aNiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772900399; c=relaxed/simple;
	bh=nx507oHUwoXqYg2sJlsCMVzNdhUzoxeY6kkP1NAg6h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cu4BvKIe0BuEgbJmjuFjbL2g29OdVAPD99rAydEy571NuvJFi9mo3CYqsAwk/j9MgrrkuTEEZB9PaTRJhgsbTR51rDOip2fA4bfZTFUS589QyAzg3c8RN82i9dqDOEfjgmjwK7IvHjVXTQEqTLX6KtPx3YPJZTXb44sMPU/kglw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X/QhU8BI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31745C19422;
	Sat,  7 Mar 2026 16:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772900399;
	bh=nx507oHUwoXqYg2sJlsCMVzNdhUzoxeY6kkP1NAg6h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X/QhU8BIsEdgo1XYZomf6SvjGfZon/u7gJFHEV770w/VBZ8H5PPtpShruoUtebbNf
	 9gJahodFqrDPz07HDcq5LxfTf/J4erfy+GLkPv/RUAEwpJ47IXctsH1Z4SAfxA7fRy
	 AqXYB5NPwqy8iIyegnoYWs3/HdP9WYW1cOfHlz+NvzxUAOW0pRrjpx+DSvYShaThNF
	 vV0fZuKP90qXKIPADWPaYcwd3Vz7v4Y2Kl6rLkGrfQSJ2GV4I1Zc3dZViBJfqQhr75
	 fLixxsVQCNPsCqlP1MrXLHS0j7Y5Xkb1GZLU+STys7hd54labgHyDj85kI8vTBizFV
	 GCAo8GYRVEAHw==
Date: Sat, 7 Mar 2026 11:19:57 -0500
From: Sasha Levin <sashal@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <aaxQLSmMlpwwcOA-@laps>
References: <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
 <aaRegZjbE6SgyaDq@laps>
 <20260301161317.GA2906342@killaraus.ideasonboard.com>
 <aaRo1kuzKj0dxl5i@laps>
 <20260306150124.GD2879901@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260306150124.GD2879901@killaraus.ideasonboard.com>
X-Rspamd-Queue-Id: 04E3422CA88
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2890-lists=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.940];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,get_maintainer.pl:url]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 04:01:24PM +0100, Laurent Pinchart wrote:
>I seem to have failed to convey my opinion properly, I'll try better.

Thanks, I appreciate that. Let me try too.

>> >> can you propose a different
>> >> deterministic solution that would have worked for
>> >> https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/ ?
>> >
>> > Not as a procedure to extract line numbers that will work retroactively
>> > of course, but I don't think that's the point.
>> >
>> > As we're discussing new developments to replace bugzilla, working with
>> > distributions to streamline bug reporting would be more deterministic.
>> > Running the stack trace decode in the server side is a good idea, and
>> > the server should receive in addition to the stack trace either the
>> > debuginfo or, when running a distro kernel, an identifier of the exact
>> > kernel version to download the debuginfo from an authoritative source.
>>
>> Look at the bug reports we discussed in the thread: one is a custom built
>> kernel, and one is a kernel without available debug symbols.
>
>Note that for custom-built kernels I think it's reasonable to ask the
>submitter for debuginfo (probably in the form of a decoded stack trace).
>If someone is able to build a kernel manually, I expect them to be able
>to run a stack trace decoding tool.
>
>> Even if we had the
>> best relationships with all our distro friends, had a central DB with all debug
>> symbols, we would still not able to tackle this.
>
>Sure, nothing we do will be able to increase our bug report handling to
>100% success. I even agree that there are cases where heuristics could
>be helpful. This being said, I haven't checked personally, but I would
>be very surprised if the majority of the bug reports were related to
>kernels for which debuginfo can't be accessed one way or another.
>
>What concerned me in my initial reply, and still concerns me, is
>applying a non-deterministic method to the problem when the vast
>majority of cases can be solved deterministically. It would mean we
>would consume more resources to get a suboptimal results, which is
>guaranteed to sometimes produce wrong but plausible-looking results.
>It's becoming an increasingly common pattern to throw LLMs as a magic
>solution to all problems, despite all the drawbacks, and I'm really
>getting tired of that.

I don't think this is an either/or thing though. We can do both - have
deterministic tooling *and* use LLMs where they help. They solve
different parts of the problem.

If I'm arguing for using an LLM as a solution for something, it doesn't mean
that I object to any other approach.

>My initial thought, before seeing your proposal, was to handle the
>majority case with a DB of debuginfo. Yes, it will require coordination
>with distributions, and some development, but what is being discussed in
>this mail thread is development of a new service anyway. Maybe I fail to
>see where this would be difficult or require more development effort
>than we can afford ?
>
>I now see you've made a proposal in this thread to embed file and line
>info in kallsyms. It seems better than what I had in mind, I will review
>it.

Thanks, I'd appreciate that.

But I also don't think either kallsyms or debuginfo DB can do this alone.
Decoding the stack trace is just step one - someone still has to figure out
what actually went wrong. The LLM approach I've been hacking on goes a lot
further than just running decode_stacktrace.sh: it reads the relevant source,
digs through git history to find the commit that likely broke things, and
searches lore for prior reports and related discussions.

Take the CC list as a concrete example. get_maintainer.pl gives you the
subsystem maintainers for the affected files, which is fine as a starting
point. But what you really want for a bug is to reach the person who wrote the
offending commit, or the developer who posted a related fix that never got
merged, or someone who reported a similar crash six months ago on a different
list. The bot finds those people by searching lore and git history and CCs
them. You can't really do that with a deterministic tool - it needs to
understand what's actually relevant in context.

>Let's see if you proved yourself wrong with the patch you posted in the
>mail thread :-)

I really really am not trying to religiously argue for or against LLMs: we can
keep throwing ideas at the problem and see what sticks. Tools that work well
will live on, the ones that fail will disappear.

There's no one way door decision we're making by giving LLMs a spin. If they
suck, we just drop that tool.

-- 
Thanks,
Sasha

