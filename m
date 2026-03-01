Return-Path: <ksummit+bounces-2863-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id XQ/3Bd9opGkigAUAu9opvQ
	(envelope-from <ksummit+bounces-2863-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:27:11 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C51D0A0A
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D0DF3010171
	for <lists@lfdr.de>; Sun,  1 Mar 2026 16:27:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474B8319617;
	Sun,  1 Mar 2026 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tX0DHyrU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81F530EF96
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 16:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382424; cv=none; b=IkNW8PILtwQHapYL7kANU/tGAOYpHss9my3metw4JICHTCUDbMC7Q4mpn9JhFIDwoKPSWqK8sfACqayLhnhjV8owCz1O85YYfhUiI7/LZK25Jw6ph0oGCawK9GAV9wzWtFGnjMyAmE1GPAcSWx+rx0o9kCTwBSgOwQ6suuXKdZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382424; c=relaxed/simple;
	bh=ibsjSHcbhSHYE8L1cvALbemWR4uYeAk0vetAyBnfGoM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dbhski0tKMZ50FF76sUfjca8+TX25UlXlb8dyLutH4r5en/Vdu/SMg+qoDOLyGorpP1ZiihVv0RmZSP0ieJw9ligDYeluWcc0SytRxXpmxAolDxHQkcYbSr5xGFZ6/QisoEYvtwvZvhhNFj8+yp9hCbbIKPqI7tXsW9WY5dMpbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tX0DHyrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1569C116C6;
	Sun,  1 Mar 2026 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772382424;
	bh=ibsjSHcbhSHYE8L1cvALbemWR4uYeAk0vetAyBnfGoM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tX0DHyrU9rWswJEtRs7rxUhjEbOgw3/9t9TVJm4m1Xy1HN0Npc94VPHWW4CfoXmUo
	 pO5eHwPbhKpOH18vgs/9kkTu0XVK7QYBwff6SiKDj13Y4j+Z3pzykCMAIU+d2yzk2q
	 YrzXrZlt+LlszdIqu7xLgCREjxCepz6jkTdAtLFnH3xEbnxQu9+pmw1CdDJ4MxiUx+
	 V0j4tt/lpgTp/o9WQW53bLl6UtJ6NMVTIJATSZCG3Ny6N0lDPLF+jCNr2m514Xy7R5
	 vdSEpwKaiLfEs/8lii8dCFp0LStUdh8JbfO3JO9Z/bdUP8oE6EY0RgcdqZ15gb2Rv3
	 pmV/rycOnguUw==
Date: Sun, 1 Mar 2026 11:27:02 -0500
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
Message-ID: <aaRo1kuzKj0dxl5i@laps>
References: <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
 <aaRegZjbE6SgyaDq@laps>
 <20260301161317.GA2906342@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260301161317.GA2906342@killaraus.ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2863-lists=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6C8C51D0A0A
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 05:13:17PM +0100, Laurent Pinchart wrote:
>Hello Sasha,
>
>On Sun, Mar 01, 2026 at 10:42:57AM -0500, Sasha Levin wrote:
>> On Sun, Mar 01, 2026 at 04:35:26PM +0100, Laurent Pinchart wrote:
>> > On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
>> >> On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
>> >> > On Sat, 28 Feb 2026 21:28:57 +0100 (CET) Richard Weinberger wrote:
>> >> >
>> >> >> Wouldn't that only work if the report is able to upload the kernel debug
>> >> >> info too?
>> >> >
>> >> > Yes, this would be nice if we had the help from the distros that could
>> >> > automate this process.
>> >>
>> >> So I've been poking at using LLMs for this.
>> >>
>> >> decode_stacktrace.sh is great when you have a debug build handy, but
>> >> asking a random bug reporter to obtain debuginfo, set up the tooling,
>> >> and run the script is quite the hurdle.
>> >>
>> >> The debuginfo problem is solvable on the server side though. Given a
>> >> kernel version string from the oops, an LLM can figure out which distro
>> >> and package version the reporter is running, pull the right debuginfo
>> >> (or build from the matching config/tag if no debuginfo package exists),
>> >> and run decode_stacktrace.sh itself.
>> >
>> > Do we really have to use non-deterministic tools that will inevitably
>> > produce correct-looking but otherwise useless backtraces from time to
>> > time, confusing developers and wasting time for everybody, when we can
>> > instead easily develop tools that will work in a deterministic fashion ?
>> > I'm getting *really* sick of people pushing for LLM usage when it's
>> > clearly the wrong tool. Please stop.
>>
>> The LLM actually runs scripts/decode_stacktrace.sh. The non-deterministic part
>> is being able to get our hands on various debug symbols from
>> distros/vendors/etc.
>
>That was my understanding, yes.
>
>> Instead of just crapping on everything,
>
>Please tone the insults down.

Happily. Please stop telling me to shut up without offering an alternative :)

>> can you propose a different
>> deterministic solution that would have worked for
>> https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/ ?
>
>Not as a procedure to extract line numbers that will work retroactively
>of course, but I don't think that's the point.
>
>As we're discussing new developments to replace bugzilla, working with
>distributions to streamline bug reporting would be more deterministic.
>Running the stack trace decode in the server side is a good idea, and
>the server should receive in addition to the stack trace either the
>debuginfo or, when running a distro kernel, an identifier of the exact
>kernel version to download the debuginfo from an authoritative source.

Look at the bug reports we discussed in the thread: one is a custom built
kernel, and one is a kernel without available debug symbols. Even if we had the
best relationships with all our distro friends, had a central DB with all debug
symbols, we would still not able to tackle this.

>> Or should we just let that bug report rot as it usually happens because you have
>> some dislike for LLMs?
>
>Let's not resort to straw man arguments, you know that's not what I
>said.

I know it's not your intent, but this is what happens in practice. Look at how
many bug reports show up on our mailing lists and are either just ignored, or
end up with a response or two that makes no progress.

>I will stand by my original claim, that using the community's
>development resources to create non-deterministic tools when a
>deterministic solution isn't more difficult is a waste of time and
>resources. I've always disliked suboptimal solutions, it's not limited
>to LLMs.

I don't disagree that a deterministic solution would be better. My argument is
that I don't think we can have one.

Again, feel free to prove me wrong, just don't tell me to shut up without
offering a better alternative.

-- 
Thanks,
Sasha

