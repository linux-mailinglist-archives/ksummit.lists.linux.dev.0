Return-Path: <ksummit+bounces-2820-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHHBGhWVd2n0iwEAu9opvQ
	(envelope-from <ksummit+bounces-2820-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 26 Jan 2026 17:23:49 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 023938A9F5
	for <lists@lfdr.de>; Mon, 26 Jan 2026 17:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 59A263005992
	for <lists@lfdr.de>; Mon, 26 Jan 2026 16:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4347C33A037;
	Mon, 26 Jan 2026 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgwWG0nv"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49832AAA1
	for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 16:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769444624; cv=none; b=GCkwfT+PZBocoP1cYpn+JVs+vJQldNXvKrVc0zpJ2U9JltXczmvO1LRoY+oY8+FftyVmY6au1XsJs9OAUM0TY6ksP8IuqOxE3ZdaBTkJQxNSeCgGUkgbGG1s09nepzjHT+G5b9SCvuL6RRBVlbmtGVsIUh6bKN6Rv8x19W2TqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769444624; c=relaxed/simple;
	bh=xb9l7ZGWvDgmvSg3D8ZNfAcIZmZQ69ixAjWzE++EahQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lC1+vHLMIVNsUo5+nO3k2+MqY96jq2EZ1pcCYwjMVznj+yWVZDn07GyGyQ4vTAfkeJRrzCyefPGAgVM9atvBwOK4fSdSLwbNsYywKUCs2KTLdeMzsys/8BTuP84azfzY5b5SwfdIdxy5fzE08ZkTUxoUXkI8SxOQCKqgMEC1XOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgwWG0nv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACD3C16AAE;
	Mon, 26 Jan 2026 16:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769444624;
	bh=xb9l7ZGWvDgmvSg3D8ZNfAcIZmZQ69ixAjWzE++EahQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jgwWG0nvZbRxXg7dNOW11veKNPiUmsctrgKJg/ZDqgcIzzpq5zoWPF6MRdbach2YA
	 azplx//Al2YQncmyWe1RUQ55RZhsBsFW0Y1VfEuGhSGjdY9cuqOeIgecBkyfigz+bd
	 6JHV0h5FUxc3vzJ/RgKUupEvZQayq8k+v/g0Y4rxAziw+Sh6FNHbj3OviXvypFHh2j
	 UcHbj/64dSeOBRUXRcGGt9W68wSHLAvuTGUpxLtHAs20qAAvf5sH3psqmOECItmGe9
	 i2hnJ0Gl6tHSE7AfNM605zmgX49VxXJ9hQABUOYTvFXEhTFWT2aLtfSh22saA6WIGl
	 /bXDWejKnqZHQ==
Date: Mon, 26 Jan 2026 11:23:43 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2820-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,ksummit@lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gpg.fail:url]
X-Rspamd-Queue-Id: 023938A9F5
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:12:39PM +0100, Uwe Kleine-König wrote:
> >   - I am the bottleneck in the process, because all updates have to go through
> >     me; even if we add more people to have access, this would still be a
> >     bottleneck, because the more keys there are in the web of trust, the more
> >     finagling the whole process requires to deal with expirations, key
> >     updates, identity updates, etc. We can rely on modern keyservers for some
> >     of it, but not for third-party signatures, which are key for our
> >     distributed trust.
> 
> Just to ensure we're talking about the same thing: This is about calling
> a script once a week or so, check the resulting diff, commit and push,
> right?

This is for updates, yes, and this is mostly hands-off except final review.
Adding new keys is usually a lot more involved, because there's frequently a
back-and-forth required (they sent a key without any signatures, there is not
enough signatures, the signatures are too far removed from Linus, etc). We
currently have about 600 keys in the keyring we maintain, and we clearly can
do a much better job like being more proactive when someone's expiry date is
approaching. I'm worried that if we tried to maintain a keyring for several
thousand people as opposed to several hundred, this would snowball into an
unmaintainable mess.

> I personally am happy with PGP and I don't see the benefit of using ssh
> keys instead. But I'm open to look at the approach that we will see in
> February.

Supporting ssh keys (along with minisign keys) is a Frequently Requested
Feature (TM) -- not so much among kernel users, but among several other
projects that use non-forge workflows.

PGP and its tools (GnuPG, primarily) are seen as extremely unfriendly, arcane,
and prone to breaking. This is largely a perception problem, I agree, and it's
not helped by efforts like gpg.fail -- I appreciate the work the researchers
have put into it, but I hated the presentation for its "lol pgp" vibe.

> (Maybe apart from self-sustaining) this sounds like PGP. I consider it
> self-sovereign as it's only me who has control over my certificate and
> cross-signatures work fine, too. I agree that using GnuPG isn't nice for
> newcomers and people only using it occasionally. But it is able to do
> all the things we need from it, it has integration in git and mail (and
> also ssh if you want) and I'd hesitate to throw that all over board for
> something shiny new.

For the record, we're not. I don't see a (near) future where PGP will stop
being our recommended attestation mechanism. However, this doesn't stop us
from looking at alternatives, and this effort is exactly what it is -- looking
at alternatives. A group of security researchers are saying they can do a
better job with decentralized trust management and I am happy to let them try
and evaluate the results.

> Having said that, I'd like to support you in the maintenance of the
> pgpkeyring if this is considered helpful.

I do appreciate your work!

Thanks,
-K

