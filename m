Return-Path: <ksummit+bounces-2949-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t8m4JYLUT2qGowIAu9opvQ
	(envelope-from <ksummit+bounces-2949-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:04:02 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E073D733A9A
	for <lists@lfdr.de>; Thu, 09 Jul 2026 19:04:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DAuP8drq;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2949-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2949-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624CC3027115
	for <lists@lfdr.de>; Thu,  9 Jul 2026 16:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A878039A7F2;
	Thu,  9 Jul 2026 16:58:39 +0000 (UTC)
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D743126BF
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 16:58:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783616319; cv=none; b=lsxOSqvayPWgCiZKn3fFXdjLSMtR/IH7htTZJq6c/OmtjLayNHxyUNK7UN+sSmGYgQaNWJt5CLUXt5hUS0/8Om+vGj49r6Lt8NlkWySo/YuEybgYxPU8xq4su8/Zz6/Ys3fot6B12pQzvzpwmibvZJuRNrrLlZS0eC2qUwmgu48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783616319; c=relaxed/simple;
	bh=FcPiWtgPyubIXaoKBzOjc7W2MGzS0LnqUlApmj4Dss4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6+2GjkvbXECY5EawTBMNKqjuy82QkA6lywG0/9n6BDtqwSLBQdx1sV1gPuVZAXx4bEKPCxFuPAu1G0UxtSLwHidcNP9bv8/JRGlDOudn/UBTK1ZRAPN3C6pu4MPOxQ6ESxzuaOK+aR48i4bH1yF9z6L82tqH9e7Z1PnPssTWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAuP8drq; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A101F000E9;
	Thu,  9 Jul 2026 16:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783616318;
	bh=XU34zcRXsu3/To7u5u5p/2DI2iwKeyT3YMqBTI87UOc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DAuP8drqn02ufNxRZ1Zh7sySZOdTKDo85e6vjbbHtc0qW4rjyKUhItBjV0tUO0QzU
	 TXzGDZ83ioL0Jq3nWY9bVXe0NLHZus0pAxt0j2YKNLm7dPUrsJq7sdxIwTUT63G1u/
	 UxF2+/oi0JOh0/xk8i9kG8+ueV+vWiYfsgt2n1VfxreiEOfSXFsaA4bBo67/xbph/v
	 My55k5URJkYdpb0F3olZzhOnAjINs47tEZHnGDKiY7xjZtgF98jzRJ9Rba3aT38m4P
	 GebGrdybYZ3xz+7yOfKPdYswqwO3k1hFb7bWeOZqvp8IRDkYpGXYUTZDsYepul5+sZ
	 Xp0rESxANxDng==
Date: Thu, 9 Jul 2026 09:58:37 -0700
From: Kees Cook <kees@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <202607090956.6381F35@keescook>
References: <akKBVsFBro_4QM74@casper.infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akKBVsFBro_4QM74@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-2949-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E073D733A9A

On Mon, Jun 29, 2026 at 03:29:42PM +0100, Matthew Wilcox wrote:
> malloc() is a standard part of the C library.  Yet we force new Linux
> programmers to learn the difference between vmalloc(), kmalloc() and
> kvmalloc().  They even have to acquire an understanding of the difference
> between GFP_KERNEL and GFP_ATOMIC.  If they are particularly unlucky,
> they may have to understand other combinations of GFP flags.
> 
> This topic proposes that we should implement malloc() and calloc().
> Various options will be discussed, their increasing implementation
> complexity corresponding to utility in a greater range of situations.
> This will also benefit Rust as we can use the same infrastructure to
> implement std::alloc.

No surprise, but I strongly disagree with this. Those APIs are flawed
and we shouldn't emulate them. This is why we just removed strncpy(),
for example.

Allocations need to be type-based, not size-based. When we force people
to reduce it to just byte count tons of metadata that can be used by
both the kernel and the compiler is lost. The size is a by-product of
"what do you need space for?" "I need X many Foo objects" or "I need
Bar with Z many trailing Baz objects" or even "I need a plane of pixels
X by Y". The uncommon case is "I need X many bytes from this stream".

-Kees

-- 
Kees Cook

