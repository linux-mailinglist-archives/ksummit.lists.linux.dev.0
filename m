Return-Path: <ksummit+bounces-2816-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id s7TSFPxLdWlNDgEAu9opvQ
	(envelope-from <ksummit+bounces-2816-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 23:47:24 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DAE7F2A0
	for <lists@lfdr.de>; Sat, 24 Jan 2026 23:47:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 133C2300C82E
	for <lists@lfdr.de>; Sat, 24 Jan 2026 22:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0232F1D5174;
	Sat, 24 Jan 2026 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKKRsZ4q"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ECC3EBF09;
	Sat, 24 Jan 2026 22:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769294836; cv=none; b=Z86vQEXbjyufxPVpUDk3fKV08wpsNGfuddcW3lzlbrGl5/93C04jNkBLR8/jGZ7GwrE5Gcj43vXykNbHSBRSvhJjYwdXzj+j1vhUvBC3fFtQgEXOOlv+QZ8JiF2c2DH/5NZCxmTdFgTVLJcTdFBDGePAyV/lU8wSbnSD9MbiW0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769294836; c=relaxed/simple;
	bh=v5i945rsxdRPOnac8FtdEXRvSwdZDDATSrtGFsd16hU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HmivAC1dIjeFzpamOw3SV2lsRVP+hlbngLgN3NVNaf6gaeL2omdQHYNas9IrUbK9DejHyXtMfbxNwE3jvidbkbQDB5kh/zGKuOGZX7LAKegPrnKbT77yG8oXc9FqHQ2ujLsNrorNmINDmpAjPPSYHdn8mCreFN67hvzApAH9uHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKKRsZ4q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C342C116D0;
	Sat, 24 Jan 2026 22:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769294836;
	bh=v5i945rsxdRPOnac8FtdEXRvSwdZDDATSrtGFsd16hU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nKKRsZ4qCMt3leBEPR70Ew2rT9q/ZCKBlyRIPmUYTWec3mrIqmqQxCc44lKy6uv8N
	 eOFH8L9pBDVg23N0+vWTb08E46om49xhX7sD/UdvvGIJBJvnuNN8+TZVEaJXY1rdrc
	 mWbHchyR4GUZNPsv45r2Zc4fywor1sCX9NtRIU9Dw572OqNLGf3NCQs6o7nlRswjDm
	 lumn+QRR3mGCx5OfbUMDOAYSpNEc8zx79neZRujY/e64+YE38EgxHsUHxfGp/Mti4L
	 RjScLudC4/gMBUX5ZVshydNrZiyBlDE5/nu1RpBZjJcRgVRtlEmdkJ9D625l048Gwk
	 Xl0RTlL9F63lw==
Date: Sat, 24 Jan 2026 23:47:13 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
cc: Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net, 
    ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
    tech-board-discuss@lists.linux.dev, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] Documentation: Project continuity
In-Reply-To: <CAHk-=whUg3js1GV4f0dmC+nvJbiNfsM7QZv7k8Q6AoFUfeH-KQ@mail.gmail.com>
Message-ID: <o552411n-nn6s-q3rp-nrp8-2669so1s868s@xreary.bet>
References: <20260124012256.1856709-1-dan.j.williams@intel.com> <CAHk-=whUg3js1GV4f0dmC+nvJbiNfsM7QZv7k8Q6AoFUfeH-KQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-2816-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B8DAE7F2A0
X-Rspamd-Action: no action

On Sat, 24 Jan 2026, Linus Torvalds wrote:

> > Document project continuity procedures.
> 
> I think I'll just commit this as-is, and directly.
> 
> Sure, it could just go through the doc tree, and that would be
> "standard procedure", but when it comes to something like this, I
> think it looks better to just have me commit it myself than have me
> pull it from some other source.
> 
> Any future updates from further discussion can then go through the doc
> tree as normal...

FWIW

	Reviewed-by: Jiri Kosina <jkosina@suse.com>

(or Supported-by:, or whatnot).

Thanks,

-- 
Jiri Kosina
SUSE Labs


