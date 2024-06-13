Return-Path: <ksummit+bounces-1234-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC33906744
	for <lists@lfdr.de>; Thu, 13 Jun 2024 10:44:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0167E1C21E03
	for <lists@lfdr.de>; Thu, 13 Jun 2024 08:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA281419A9;
	Thu, 13 Jun 2024 08:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="AL6oDhDs"
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077713D8B3
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718268125; cv=none; b=fnV5wu0M9dhL5fDeNVrhdp6pu1HmxcT/FGrSWzIjdu7N0LkFcjuTyEFrJ1MJj4LHD+CklAL2RjQHJOHQidELnvtLRNlGp1JiOVlZTPp4eYFmMNkFs5cFyf4vnQLfO9CN4LCbl969sGnwUnz1OMdvS8se83EiN2u2Z3WF5aMtcDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718268125; c=relaxed/simple;
	bh=8hfoYXFxMgGWHmGV8iCwhOXqhoYbtX9Q/PZDk0fy0uM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=d2dI0ujTVszFvjHKw/4MYTs9ztzmp9lLnq0ZhuaxuBII2KdDowo4IKu7J+7s0pqwsSJRUEhf+0BcpAL8Broe2WtsQxfWHTIOmDjHbuP2cqAU9GalRPXt3mxp6GIS6VACAyFQcML6JS3DBNnXp43CvmwByxJaYCrzbpz4CEBRn24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=AL6oDhDs; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=8hfoYXFxMgGWHmGV8iCwhOXqhoYbtX9Q/PZDk0fy0uM=; t=1718268123;
	x=1718700123; b=AL6oDhDsuKkl9IXocYFe97E+wFs12xkd0dPhuwtis2Qm/2CTz/sjfTRyjU9v2
	dNxLKWi/xIR6OU+9RujfnowPKuy+Et1t/66ylYBCfYjhk49OOeCQqUntjqDrBHFTctnbeHEDzdF83
	8vkp+5Jl/UvhURJTj9J50vfhedONmE0h2CqIJZhj3agJGkzUbyuPDJTx63CHseBtVOHDcyMdnMoC8
	8iMGcByImKMTcZWG+r4ku7raPPAhkYr9cgDNmrVW5oBlqYkAoeZ+aH7YjJec/f/GERS8/8f4YRX73
	4K6H2ZI5TwiORsy4VtdvErpeX/DTi7Pbjj8dv2jRQYb7boG+Xw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sHg1x-0007ND-FT; Thu, 13 Jun 2024 10:42:01 +0200
Message-ID: <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
Date: Thu, 13 Jun 2024 10:42:01 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent backports of
 commits that turn out to cause regressions
From: Thorsten Leemhuis <linux@leemhuis.info>
To: "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Language: en-US, de-DE
Autocrypt: addr=linux@leemhuis.info; keydata=
 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 n7RI
In-Reply-To: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;linux@leemhuis.info;1718268123;aca25bb1;
X-HE-SMSGID: 1sHg1x-0007ND-FT

I would like to discuss how to better prevent backports of mainline
commits to stable that turn out to cause regressions.

The scenario shown at the start of the thread illustrates a problem I
see frequently: commits with a Fixes: tag end up in new to stable series
releases just days after being mainlined and cause regressions -- just
like they do in mainline, which just was not known yet at the time of
backporting. This happens extremely often right after merge windows when
huge piles of changes are backported to the stable trees each cycle
shortly after -rc1 is out (which even some kernel developers apparently
are somewhat afraid to test from what I've seen).

I do not want to criticize the stable team for their approach to things,
as I can understand why they are doing this: there is no simple way to
distinguish "this is an urgent (security) fix that should be quickly
backported" from "this should be tested in mainline for a while first"
or "this has a Fixes: tag, but is not backport-worthy at all" -- which
is why they handle changes about equally. I think untangling that aspect
and backporting the non-urgent ones more slowly could help a lot to
prevent many regressions from hitting stable trees.

The thing is: I'm not sure how to achieve that. Here are a few thoughts
my brain came up with:

* For patches that are tagged for backporting it's easy to for
developers to influence the timing, as they can use a stable tag like
`Cc: <stable@vger.kernel.org> # after -rc4` to delay backporting (see
Documentation/process/stable-kernel-rules.rst for details). But for
quite a few developers this is not an option, as such a Cc: implies that
the developer wants the fix to be backported -- and thus should ideally
have tested it, will provide an adjusted patch when needed, and is
willing to handle any fallout. Maybe untangling these aspects from the
stable tag might be wise, so that developers can signal "I think this
should be backported, but I don't want anything to do with it" could
help. If this becomes the norm then maybe the stable team could even
stop taking nearly everything with a Fixes: tag. But I'm not sure if I
like this idea myself, as it has downsides, too.

* We could ask the stable team to only backport changes once they have
been in mainline for a certain time (something like "at the earliest two
weeks after the change was present in a mainline release or
pre-release"?). But to not delay urgent fixes we then would need
developers to mark the urgent ones somehow. That is likely a hard sell,
but maybe less so then what the previous point outlined; untangling
could help here, too.

* Maybe convince the stable team to consider all commits with just a
Fixes: tag as "non urgent", if they were merged during a merge window
with a committer (or author?) date from before the merge window -- and
then only backport them after -rc4 to ensure they got at least three
weeks of mainline testing before they are backported. This is imperfect
and has downsides, but would be relatively simple to realize.

* We could extend the Fixes tag in a fashion similar to the stable tag
(see above) to establish something like `Fixes: cafec0cacafe ("foo: bar:
foobar baz") # after -rc4 if considered backportworthy` -- but some of
these lines will become awfully long (they already are occasionally even
without this add-on note).

Ciao, Thorsten

P.S.: Related things that could be discussed:

* One cause of regressions that happen in stable trees (and not in
mainline) I've seen quite a few times are backports of commits with
Fixes: tags that were part of a patch-series and depend on earlier
patches from the series. The stable-team afaics has no easy way to spot
this, as there is no way to check "was this change part of a series".
Sometimes I wonder if a dedicated tag linking to the submission of a
patch could help -- and is something quite a few maintainers already
really want and add using a "Link" tag despite Linus dislike for that
(IIRC). But following that link for each and every patch slated for
backporting does not scale for the stable team anyway, so it's likely
not worth it.

