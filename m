Return-Path: <ksummit+bounces-2805-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKZSMMm8c2kmyQAAu9opvQ
	(envelope-from <ksummit+bounces-2805-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 19:24:09 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D2C7990A
	for <lists@lfdr.de>; Fri, 23 Jan 2026 19:24:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 169203004908
	for <lists@lfdr.de>; Fri, 23 Jan 2026 18:24:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B506323A99F;
	Fri, 23 Jan 2026 18:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T324AjT+"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21721238C3A
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192640; cv=none; b=rjlIU3choqTBQBziTMnl2uwkorUUzDvzQ7l/F4JZWyh3UBsfX+h3IIToo7r/jgHHKcbKtgGBkWCJoGnpeHZSkXbBUvwIx4xtXuMih8SlbggqmY2qNzAHjkj2vBu44qoxe4ICsl9RlfgiJ82qBTmDXlBiAsXVkqEoLKak2x2xjV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192640; c=relaxed/simple;
	bh=6yP6fREMIERfownSmdBNIcNnTCnFtFCOWe3aWHqr6Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZwER3Rhlo1AMeMYdIdvsFYMLgH2Pelk1TGq+ISFH8c/Dw8cAAmwX9XT7GOFi71EQUAuCPpYHaafKJqVBZhPZ0+XHvr/wFuEWz/nzwNArvn7OBdUWGYqMCxhuXeNTVrnPjqd6gSBpoOsF7QpWgF5jSaeY9iAVriS/SyjM6c6YBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T324AjT+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92819C4CEF1;
	Fri, 23 Jan 2026 18:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769192639;
	bh=6yP6fREMIERfownSmdBNIcNnTCnFtFCOWe3aWHqr6Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T324AjT+nd6l83CSB1ktSmB5J0DSIPksN5Kbd+yA33sDrMikDsUlv3qM6WIVbkMXb
	 6wpym/EqOIwWwuG8s/03Soyeug4ceAoAd8lsOKiq1RCU1xuvods8oTVzpytiSRq6v4
	 +HFuAI834V4yvRtW4M8MKGSNcaBKMyu9Z+dhWo5fLxYC0N4rQerOXGZvTHjxCp4y+W
	 DgJF9keVkITcilZV9SG3q0y/7VfikjMW0wciJmC1BDzxJlFHfQGM2lE8bUnvCqWxNy
	 zNy7a+mxKkhs0x46GvunGEvqkDBnfc1SLCb8J5utlj7OTkuEQzk47GPX/+383N1P7b
	 Ip07EnUhBWW3A==
Date: Fri, 23 Jan 2026 13:23:58 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123-provocative-tungsten-curassow-cc2aac@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2805-lists=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65D2C7990A
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:23:09PM -0500, James Bottomley wrote:
> > > Could you please stop doing this?  The Open Source norm is to
> > > release early and often and long before you have stable code so you
> > > get feedback incorporated *before* you're committed to something.
> > 
> > I'm not doing anything here, sorry.
> 
> You're listed as a presenter on the session Mauro pointed to.  And
> you're the only kernel developer on it, so I was presuming you were
> helping them out with kernel requirements.

They are primarily working with me, and just so it's clear -- this is not
any kind of assured thing. Here's where things stand:

- they asked us how we currently do our trust framework and I described the
  process and its drawbacks, which are real:

  - I am the bottleneck in the process, because all updates have to go through
    me; even if we add more people to have access, this would still be a
    bottleneck, because the more keys there are in the web of trust, the more
    finagling the whole process requires to deal with expirations, key
    updates, identity updates, etc. We can rely on modern keyservers for some
    of it, but not for third-party signatures, which are key for our
    distributed trust.
  - We can't reasonably expand this to all kernel developers (not just
    maintainers), because of constant churn of people coming, going, taking
    breaks, etc. Maintaining the web of trust consisting of thousands of keys,
    as opposed to hundreds, would become a full-time job if we stick to how
    it's currently done (via the git repo and manual verification on my part
    for all key additions).
  - We're limited to PGP only, but it would be nice to also support something
    like fido2 ssh key signatures.

- they said they could come up with something that would use self-sovereign
  did's that would allow scaling the trust framework to all kernel developers
  and be self-sustaining and verifiable via cross-signatures.

- I said: sure, come up with some code and let's see, as long as the following
  is assured:

  - It's opt-in; anyone who is happy using GnuPG can continue without any
    change
  - We're not forcing a complete rekeying or resigning of all keys
  - There is no central service that must be up and accessible for the tools
    to work
  - It's not written in some esoteric framework that requires curl | bash
    every 2 weeks to get the latest version

- I also made it very clear that the kernel community will have the final say
  in whether this is adopted or not.

This is pretty much where we stand.

-K

