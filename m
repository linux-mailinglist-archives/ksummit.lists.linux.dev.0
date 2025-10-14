Return-Path: <ksummit+bounces-2526-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E48FCBDB041
	for <lists@lfdr.de>; Tue, 14 Oct 2025 21:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2D814F3C5D
	for <lists@lfdr.de>; Tue, 14 Oct 2025 19:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FE62C032E;
	Tue, 14 Oct 2025 19:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="bc5ONS4V"
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801CD2BE7A6
	for <ksummit@lists.linux.dev>; Tue, 14 Oct 2025 19:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760469164; cv=none; b=VRuSNuOl4hZAI9eeOJ6L0mGJY3+eGn4fuNNDKrR7eIdsCGUfQefeVNE+M8NYhLlvIGh6oreDn/1fafYmos40xjYODhvAoj96CAqtLZHxInxe16mFxuZBepSAIS3c0oq0fmBy7XdFOAcSDPOIvVOvmH/cRd42oJFDne4e9Bsr67Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760469164; c=relaxed/simple;
	bh=3U9uxmuoHCH+q0KSrmPqCxkDl+djtJVbjVpQZCky1gA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fUFvU3yw84LOSioVVLgbC/Lr+rxGSIYRPPICT0kqaPvRP0CwmzLUBwbyFwF0MReXey04Sn1QUZTcr7RCO5yWDwNHf2Y/HhgehoMtVsWJsVlLurbR9yRrt1j3zB5Vqos6MlBeoZOAf3WurbeNFIvedutQzqqHeK6SDn2Ec6u4ZAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=bc5ONS4V; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=3U9uxmuoHCH+q0KSrmPqCxkDl+djtJVbjVpQZCky1gA=;
	t=1760469162; x=1761678762; b=bc5ONS4Vw39Bvs8V/iiLBrlfLPuh2fmWTpptDcOuM/B7cfO
	RGYPHgYzP6D5PwWVLFkK+2gsDsYIttEJWdtMOtRgZhUY6pC/6R8qix3igDUz9UUiqDvggWIiQFCgq
	362fv3n0ZDpYGGHJQ0az2GBdlUeYA7vf7W6SMEtLD+EPkeAjQDQDetP1wHRC98Ockl221yglT/J2p
	KGBu5R5kixYfkEnaoHF/JWWa7SL7OUx3q9xLu32bqZy/U5/UvP14Y7d25fKqIh0xrByKd3uwngirG
	sq0YaFSzv/dKXxksl3ORGsDFddMTbvgVqy9sdIcGqR4FgxNcUM98R8Jht8urUvFw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1v8kRm-0000000CkqT-0O8e;
	Tue, 14 Oct 2025 21:12:34 +0200
Message-ID: <8572506ccdaa6211e177d5976a74737268486492.camel@sipsolutions.net>
Subject: Re: Replacing Link trailers
From: Johannes Berg <johannes@sipsolutions.net>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, James Bottomley
	 <James.Bottomley@HansenPartnership.com>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Tue, 14 Oct 2025 21:12:33 +0200
In-Reply-To: <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
References: 
	<a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
	 <6b188d9e-3d47-4a30-8452-3e57e09cf8e3@efficios.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Mon, 2025-10-13 at 08:25 -0400, Mathieu Desnoyers wrote:
>=20
> Based on prior email discussions I've seen, I don't think Linus is
> convinced that tagging commits with a unique identifier brings value,

Well ... the way I read it, he's basically saying "it's useless to me so
you don't get to do it."

> whereas people actively developing and using tools based on a
> workflow that relies on patch revision tracking see a lot of value
> in this.

It's not just that, btw. We use it much for tracking the internal vs.
external version of a commit, which may differ due to kernel version
backports (e.g. added ifdefs or changes to additional files that aren't
upstream [yet]) that don't and sometimes shouldn't exist upstream.

All of this discussion pretends that whatever happens to a commit
outside the context of upstream is entirely irrelevant, but I suspect
that for many of us not purely tasked with 'develop upstream', but
rather 'enable device X' or similar don't have the luxury of ignoring
everything that happened before something went upstream.

There are already _so_ many roadblocks for contributing upstream. This
just adds another one. On the one hand, it's just another "small" one. I
don't believe it's as small as some people would like to believe, "b4
dig" will do nothing for "life before upstream" type usages.

Ultimately, this is yet another question of how much you want to make
life harder for contributors of all sorts. A link gives bug reporters
who somehow find a commit (e.g. bisect) more context to go on [1], gives
people working on things like hardware enabling that happens pre-
upstream (in a way) a lot of context, makes things faster in general,
etc.

And we're taking it away because literally *one* person thinks that it
adds irrelevant noise.

[1] Sure, they can use 'b4 dig' if you pretend they all already know to
use it.

</rant>

But seriously, why is this such a big thing? Linus is, in general,
asking literally everyone else much much more to suit his ways in the
kernel than "don't click the link if it starts with patch.msgid.link"
...

johannes

