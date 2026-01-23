Return-Path: <ksummit+bounces-2809-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +G1XAYf8c2mf0gAAu9opvQ
	(envelope-from <ksummit+bounces-2809-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 23:56:07 +0100
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 101857B4CE
	for <lists@lfdr.de>; Fri, 23 Jan 2026 23:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA3283004412
	for <lists@lfdr.de>; Fri, 23 Jan 2026 22:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB1022857F6;
	Fri, 23 Jan 2026 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YUBPUJF1"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748BE25F98B
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 22:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208955; cv=none; b=i2CnLk/rHGUrweOjXDhLx0LxJqmNPNliqFXHKW5v6ltBP9o0zMelSyze9Vd1v1/BaszDDL1m9/AQTvvg6Xyeii2p1VB6vNY2byCo88AuR3XQK7vM6fxexkqOs1EtJDsOJ9oxyJAHeXjDEyRnyUpKzHvUqSbRAbQIJHRlwgUj7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208955; c=relaxed/simple;
	bh=Y5U/wJTfbiAnjOt0/0ZPa+E4q27Rqm0qtPkPOJLRLTI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dYXtUaSxWYLzRllTFK+1m3g70zLOqwPL2ksCFbvPvzw6okINDjnhcTVvJA1d+ohiRDySSH/4Bx8bT8kzk3M+Iv3T34YbZMGP8kbT76lHE6Ads+VB0qHJlwUXKbNKhkIp1LGMl1A5oIPErTDOWI8kKPJTCHrBLoKfPQmAr5VJDm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YUBPUJF1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F66C19423;
	Fri, 23 Jan 2026 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769208955;
	bh=Y5U/wJTfbiAnjOt0/0ZPa+E4q27Rqm0qtPkPOJLRLTI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YUBPUJF1GR3U71mRwLpRAOO4VJ7Bf+vradfTbY9Q6FpU3iAFqNsNXqvYihaszEF3N
	 U1MeJ+kuWO1lpV+2lARX6lpQVTYIjPL1cUjYx3yjZWzU5u/ehL/bhmHGhsl7d69MMO
	 W3blk+eQBpVWow4wmM53lZbaWwfUtKnlHQS6rNYcoLIFhNQ8RKji1UJBsvRPTgw/Ae
	 poVYEc+B5R923X+wKKxAZKfZQOEZO/gw6AtkgYcTfd0D1aSWNNIGqRm7zO4KePQoJn
	 3+agAurOcrjWO/92WwEZI+bR4Pjd7XmCwaE4DCe7e2VzSFenilFWETjWMMcH9UflHA
	 D2oUVUVa/O8Kw==
Date: Fri, 23 Jan 2026 23:55:49 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Greg KH
 <gregkh@linuxfoundation.org>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?=
 <ukleinek@kernel.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123235549.45e0f75b@foz.lan>
In-Reply-To: <20260123-provocative-tungsten-curassow-cc2aac@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
	<6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
	<2026012340-cannot-spud-5d46@gregkh>
	<806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
	<2026012340-wildlife-scratch-1efd@gregkh>
	<8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
	<20260123-provocative-tungsten-curassow-cc2aac@lemur>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2809-lists=lfdr.de,huawei];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foz.lan:mid];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 101857B4CE
X-Rspamd-Action: no action

On Fri, 23 Jan 2026 13:23:58 -0500
Konstantin Ryabitsev <mricon@kernel.org> wrote:

> - I said: sure, come up with some code and let's see, as long as the foll=
owing
>   is assured:
>=20
>   - It's opt-in; anyone who is happy using GnuPG can continue without any
>     change

This insurance is enough for me, provided that I can still revoke my
current keys and create new ones whenever needed. For this to keep
working for the ones that don't opt-in, it should still be possible
to update the existing GPG keychain and having gpg key parties from
time to time.

However, it actually means more work for the ones maintaining the
infra, as you'll still need to maintain the current web of trust - at=20
least for the current users on it - and then maintain the new solution.

-

=46rom my side, I don't intend to opt-in to a new solution until I trust
it enough - and even after opting in - I'll continue using my GPG key
as a backup plan.


Thanks,
Mauro

