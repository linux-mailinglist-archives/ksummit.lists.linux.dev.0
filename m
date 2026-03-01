Return-Path: <ksummit+bounces-2857-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BiTxAYpepGngewUAu9opvQ
	(envelope-from <ksummit+bounces-2857-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sun, 01 Mar 2026 16:43:06 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 570271D076D
	for <lists@lfdr.de>; Sun, 01 Mar 2026 16:43:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CB94300D152
	for <lists@lfdr.de>; Sun,  1 Mar 2026 15:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E1832FA38;
	Sun,  1 Mar 2026 15:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iufkWfYO"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FEE1A9F8C
	for <ksummit@lists.linux.dev>; Sun,  1 Mar 2026 15:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772379779; cv=none; b=VR6DcFmcqFnhXUVayggHCsSUwOcH5K8ug7KOMvsAVD/t/scVX/0alIIzZS9O+d6Ky1WLZ3qJXvFOvpsmCuag6YuqR86WGrES0ZZkC8bEdM8+bUXpcX4oBKNi3YJ1PVy8kO1H52adJgv9h9ol+YRAnTFa7U04EAtbU21WtTEuV9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772379779; c=relaxed/simple;
	bh=1csWjD7Nv8iDH/VDCmtGLDthqXer4lBqZyqGPDyrf3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pyvJ0WuVreLO2RtlBdspvpb48qBV41J0tkikj39qNZSvUaJ7RX0QeUMizNcDgd17NBbOYZB5m7xM1nxNXGutQ4LlpZ2DlQNxuo2F5tb97NczCO39mQJEVDIqQJQZmU34th/LQvQIiJT7ZmLR6b2PuzEHd9E13K+k8SXmvqKgiX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iufkWfYO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDDDC116C6;
	Sun,  1 Mar 2026 15:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772379778;
	bh=1csWjD7Nv8iDH/VDCmtGLDthqXer4lBqZyqGPDyrf3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iufkWfYOXiY44vuZub1vuy3d6EvLnSOupgT7oOCqYbU71hguRLJpQoRfuiBXX+kq5
	 lVABeut1ev7ssjpW1Fx2n2O2Stv4rXYYLG2NwTjqEbwF6bL4PbFJ+MhRuYb+iLfQF3
	 DhGklSNMvbekyqH0GSPYseOfsS+HMn6o8rFM1RwmJWaCGNzJ6YJVM+sB7F0RLMp9uQ
	 lprmWWt5ji1yJs86xMuWKoorksQugKd12GajmHkmmgajwgQQ5nWFVIJFqAM631FbjV
	 HgSe0YaPuqTWZdbLVGA4h3i1rC9lBuDrKVhQSRARXyNa1k1IDNvCTDp2yckPYObrpU
	 Ud2KlzRB7euFA==
Date: Sun, 1 Mar 2026 10:42:57 -0500
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
Message-ID: <aaRegZjbE6SgyaDq@laps>
References: <1655051015.2216.1772209338375.JavaMail.zimbra@nod.at>
 <5dea1bca-75fe-4e3c-950d-d489a438299a@leemhuis.info>
 <1786920159.1633.1772291851870.JavaMail.zimbra@nod.at>
 <CAHk-=wh3fsqZ=KUfm2cnq_D_U63Pk33Q7cs8_QYdyzbPXjE1bw@mail.gmail.com>
 <1661016163.157.1772303364121.JavaMail.zimbra@nod.at>
 <20260228152617.06b392de@fedora>
 <583136576.604.1772310537428.JavaMail.zimbra@nod.at>
 <20260228155611.70911c0f@fedora>
 <aaRZ1EIDE-SlqWOo@laps>
 <20260301153526.GE2860169@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260301153526.GE2860169@killaraus.ideasonboard.com>
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
	TAGGED_FROM(0.00)[bounces-2857-lists=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nod.at:email,decode_stacktrace.sh:url]
X-Rspamd-Queue-Id: 570271D076D
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 04:35:26PM +0100, Laurent Pinchart wrote:
>On Sun, Mar 01, 2026 at 10:23:00AM -0500, Sasha Levin wrote:
>> On Sat, Feb 28, 2026 at 03:56:11PM -0500, Steven Rostedt wrote:
>> >On Sat, 28 Feb 2026 21:28:57 +0100 (CET)
>> > Richard Weinberger <richard@nod.at> wrote:
>> >
>> >> Wouldn't that only work if the report is able to upload the kernel debug
>> >> info too?
>> >
>> > Yes, this would be nice if we had the help from the distros that could
>> > automate this process.
>>
>> So I've been poking at using LLMs for this.
>>
>> decode_stacktrace.sh is great when you have a debug build handy, but
>> asking a random bug reporter to obtain debuginfo, set up the tooling,
>> and run the script is quite the hurdle.
>>
>> The debuginfo problem is solvable on the server side though. Given a
>> kernel version string from the oops, an LLM can figure out which distro
>> and package version the reporter is running, pull the right debuginfo
>> (or build from the matching config/tag if no debuginfo package exists),
>> and run decode_stacktrace.sh itself.
>
>Do we really have to use non-deterministic tools that will inevitably
>produce correct-looking but otherwise useless backtraces from time to
>time, confusing developers and wasting time for everybody, when we can
>instead easily develop tools that will work in a deterministic fashion ?
>I'm getting *really* sick of people pushing for LLM usage when it's
>clearly the wrong tool. Please stop.

The LLM actually runs scripts/decode_stacktrace.sh. The non-deterministic part
is being able to get our hands on various debug symbols from
distros/vendors/etc.

Instead of just crapping on everything, can you propose a different
deterministic solution that would have worked for
https://lore.kernel.org/all/DGRCO9SL0T5U.JTINSHJQ9KPK@imlonghao.com/ ? Or
should we just let that bug report rot as it usually happens because you have
some dislike for LLMs?

-- 
Thanks,
Sasha

