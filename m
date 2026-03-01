Return-Path: <ksummit+bounces-2864-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w1QaH2NqpGnwgAUAu9opvQ
	(envelope-from <ksummit+bounces-2864-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:33:39 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6161D0A3B
	for <lists@lfdr.de>; Sun, 01 Mar 2026 17:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1135300AB22
	for <lists@lfdr.de>; Sun,  1 Mar 2026 16:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC2B31280C;
	Sun,  1 Mar 2026 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGJVpgWV"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AAD4315A
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772382812; cv=none; b=cPXV1LYtM8s+4riCUPNnF3oSoh/3GF86/+JgBho3BnCi8tf1pR/Y2RHAC1ThY5NveS4W8KqjU8SHIhwg7Q9WNKyOkxv2eNyhtieicqOa17YwPTrMVnTF5JW/TTo5KVd3aidyix0lSv1IY2fqRrVEjiyXhbhhlhaCmEGJd5nUAyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772382812; c=relaxed/simple;
	bh=xPyIBuGpBUnGzGMaOymjqcMcaAQkzVlAwxnZnFZldbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lYoZnn0v0220iDP8MlUXG4OjyXZKRtjGSTA5Px5e8rmBp0d8WMJXihauIOlfePWWuXOIvyScsA2XEW9HLbyVB38aBw5hm/7WDypaaBUGSoDo3NmY7ouER+uOKbABWCSqaXvg+1yOGJ6aGuel8wiEAThSTQ0l9vxcwiLUfSHM6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGJVpgWV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4994EC116C6;
	Sun,  1 Mar 2026 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772382811;
	bh=xPyIBuGpBUnGzGMaOymjqcMcaAQkzVlAwxnZnFZldbg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGJVpgWVzxtMczf9irMx0VfM66UQF5Ra+/fxT599H7DJxqrKlBDr+6azUsnuq/B/c
	 BskLP6siDj2psry1APWk2/gprzUG2hxMH6C5mEr258DJNwEOihcrd0KJ+YiJemvOFG
	 yKdJRRURLFd8w+W4LmvqQE1TgXrqCqAkX8kgdDt8TzedtVU8XGuOkgCd510m3tXJbw
	 e2rPUkNWaFiVuVClOalCFV6QxjEYAH0xFZ50EKrAmmCyhUUGbs0u7nxKQR5r/eK2KO
	 uRHRSNBKBaiqczxxih/CCVe7k42wn1sQTSukMSi60MX8YKqV57241kapT58NRtJMub
	 cZSRvgaMtfuJg==
Date: Sun, 1 Mar 2026 11:33:29 -0500
From: Sasha Levin <sashal@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Richard Weinberger <richard@nod.at>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users <users@kernel.org>, ksummit <ksummit@lists.linux.dev>
Subject: Re: slowly decommission bugzilla?
Message-ID: <aaRqWUAqFDKVCqyF@laps>
References: <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <f998ee02c352c316e747ce14148449bcbacf6cc7.camel@HansenPartnership.com>
 <aaRmRGzJutgAruJt@laps>
 <19bb78f4ef64941abc64b15e3a7afa807fcbe13a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <19bb78f4ef64941abc64b15e3a7afa807fcbe13a.camel@HansenPartnership.com>
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
	TAGGED_FROM(0.00)[bounces-2864-lists=lfdr.de];
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
X-Rspamd-Queue-Id: CA6161D0A3B
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 11:25:32AM -0500, James Bottomley wrote:
>On Sun, 2026-03-01 at 11:16 -0500, Sasha Levin wrote:
>> On Sun, Mar 01, 2026 at 11:01:07AM -0500, James Bottomley wrote:
>> > On Sun, 2026-03-01 at 10:23 -0500, Sasha Levin wrote:
>> > [...]
>> > > As an example, this bug report came in today with no replies:
>> > >
>> > >   
>> > > https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/
>> > >
>> > > I fed it to an LLM. It decoded the stack trace (as described
>> > > above), then traced the crash to iptfs_reassem_cont() at
>> > > xfrm_iptfs.c:905: skb_put() on a non-linear skb. It identified
>> > > the offending commit (5f2b6a9095743), the code author (Christian
>> > > Hopps), the relevant maintainers, and a couple more vulnerable
>> > > call sites in the same function. Not perfect, but enough to get
>> > > the report to the right people with useful context already
>> > > attached.
>> >
>> > Lore says there's been no follow up to that email ... shouldn't
>> > someone
>> > check with the reporter that the fix actually works?
>>
>> Hmm? I don't think that there's a fix available yet.
>
>In your report it identified a commit.  The next step it could take
>would surely be reverting that in a kernel the reporter can try.  In
>this particular case I admit the candidate commit looks like it won't
>easily revert, so perhaps based on the LLM's own advice, it could
>construct a patch and try that instead?

Ah

I'd probably want to avoid having it generate code and send it to users. I
don't want to take responsibility for potentially causing harm to their
systems.

>[...]
>> I don't want to send every single incoming mail through the LLM to
>> determine if it's a bug report or not. That would make it slightly
>> expensive :)
>
>Well, that gets us on to the problem of who pays for all our AI use;
>but while they're willing, I'm sure we can tap the vast funding
>resources of AI companies for this.

If the volume of reports is somewhere in the single or double digits a day we
won't even need to ask for any extras :)

>But since ksymoops already did it, there is a more deterministic way of
>picking oops reports off the lists before handing them over to AI.

I suppose we can grep for "Call Trace" to catch those, but we should still have
a story around bug reports without call traces.

-- 
Thanks,
Sasha

