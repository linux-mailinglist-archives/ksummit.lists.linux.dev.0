Return-Path: <ksummit+bounces-2937-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id M0SKL4qPQmoa9wkAu9opvQ
	(envelope-from <ksummit+bounces-2937-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:30:18 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2827C6DCB0E
	for <lists@lfdr.de>; Mon, 29 Jun 2026 17:30:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DXGp37ka;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2937-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2937-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A94032C04FD
	for <lists@lfdr.de>; Mon, 29 Jun 2026 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42EA42EED1;
	Mon, 29 Jun 2026 15:07:53 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDD41C2FE
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 15:07:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745673; cv=none; b=Czt8K6GBDXk3+DHFWCI/Iwbe9cRBzB1oeOgkqRF2qkCCFpwtc0YFKfoo6sCjNOAlHtFvsiQxUIQoF1KWIUEJzi4hBFS9vHHk4ZcI0nf8xxfwt65nQUMXagq8cC0qDemDrczhvcE/oHSA1NVLpcxTIgusrXH1F2Rv7GQN7JZdFrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745673; c=relaxed/simple;
	bh=8dOSwySa275rHUKZE8krG2M4eTslZc8OH96h5oDLWy8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hg/4pMdaIAqH+qYck80zJZrck9GMN+KDJJTmUisY++O8bF/Ytu33b2vBBulD4zysSWqzOv8la3snzCvRhcjRcj11aAph7rWhkS9cCyNgkjpIOdShSqbg6xRJvGMgIzLY5LhhAAneMp2M6M20JpxBrUC/G3YzHbTDZrCfpaDg+l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXGp37ka; arc=none smtp.client-ip=209.85.160.50
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-44856d185bcso1262607fac.3
        for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782745671; x=1783350471; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Icg3NY662saIm5RmhA2YvbeB2x6A9wVrclR+ruulpmc=;
        b=DXGp37kal6ErswjAHRwjCebUoGbw2LbyHAKFF4si0xAZFHPe/Y2XSo0GyQkJguzCDD
         LeUIHmlZJiN/s3fdJlhNQiDK++TpRf+KCBzJG+INWMqlKmFXz0qLJzVNYhxZzF2MljaA
         bWQVtUckKLHtJm3MUtF17o/aSaqzaRxYJQ2Iz8v6npQStVaRZL2I5FpGgpcH/gk/u8xD
         Y3pz0zPH0YWnSPMl1LJY/GQKs/v0vhDwzDAwkD4qQlP/5LvgD9QPVATc7AhJw/NZ/1xs
         CeG7m4Ur2vBZXGJbQ2hVHIMujfpPy1ggtJEgdVDnm4rkb+UG6bMlxn2jyj8xrxDL1KVU
         Ibvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745671; x=1783350471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Icg3NY662saIm5RmhA2YvbeB2x6A9wVrclR+ruulpmc=;
        b=sHTMYwNSwZph+oOlFm7AVwpSc1VjlI4Jrx7ErACmDXW0RDu5j8u3FxxUvSPwq6RaqA
         auazmLLMF2AConrgW/63NSqHjKRMarznJZjdeiFenoo+PCJhzWT3z2JaGx8AgyBiaX3i
         01LRK2paaRKqJH4NPN/lGBya0/r4PLd5W940YSnpSdoFCW2/g1bJIoiZXm1DRCATKpMr
         cabZ/iYr2XNaedxRMcuwuKqmosvcX8trEt+m8rKzpaOM3SJlDzKbm/K6Jm65Nw2NW7Sh
         McsAxqq3ztYLo8BRXQJrZusOJMvTsVezeZFG/tFeZQCBTdlxVzmiS7CgVGihUzQihSUi
         CNUQ==
X-Gm-Message-State: AOJu0Ywl8iQhqY/wLapedap3Xk1Nw2gSMdpcKXqUVWVzcq+F2upDG7cP
	MA+uFuz+qZ37KJfiiOb2COTLgI7tSW2TxuxYLW+NbyEXxDV7VOPxQroW
X-Gm-Gg: AfdE7clsZzmYj+yuNFk/27qR0o/VFbCnl5/e+UTc+nBNvwhKPZjFIjtsjbSINZidEfZ
	MoBYAhXAR8ZzhWdIH3WOrqTcZYrlJ6bNEHnarNlxUGsYBI+rPcxDowMri45dj1EyPo7JVxd+pYB
	U3QFNGdj6CH5XE7pFDq1Ekv6FgnFowCLp8GT6nuGxos4jjH0YLO3uNyJLXtgTSa2sIVLNFpeK6O
	aD0ahI0fK74PRJIynFzMAwObxmbCHqq7XXDWARvr2bmprYmN4CCVtjAHUHF/uPbReaw0gCjHyVm
	M1ExITXqCQ+6kV0F3nXLyi1QP7K1Z4IFl0Tncs0s9B/nL5GCIVU5guGz62nMlkK5gPtXX1iHPYn
	L6xeY4XG5jdETZ4kr5lxOWv46Xi6bhP+uMU2fYvezHqJa3YkWo4xQP07Wb3H30cpbwtTFsujPMW
	BuHSZarco=
X-Received: by 2002:a05:6870:c289:b0:448:5591:15d7 with SMTP id 586e51a60fabf-44855912670mr7423403fac.35.1782745670965;
        Mon, 29 Jun 2026 08:07:50 -0700 (PDT)
Received: from localhost ([45.136.154.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-448db93e300sm39237fac.2.2026.06.29.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:07:49 -0700 (PDT)
Date: Mon, 29 Jun 2026 18:07:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <akKKP4SlVs846Qp0@stanley.mountain>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-2937-lists=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,xkcd.com:url,lists.linux.dev:from_smtp,stanley.mountain:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2827C6DCB0E

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
> 
> We'll also discuss the semantics of corner cases (fallibility, zero
> sized allocations, overflowing allocations and very large allocations)
> as well as out-of-bounds and use-after-free detection.

I'm not sure I understand.  You're saying that it's too complicated
and then you're suggesting we introduce a new kind of allocation function
as the fix.  It feels like the classic XKCD comic about standards:
https://xkcd.com/927/

Are we just collecting a wish list?

I wish that we would just acknowledge say that small allocations cannot
fail.  We could add a BUILD_BUG_ON() in km/zalloc_obj() which ensures that
it is only used for small allocations.  Then we could remove all the
error handling from those.

With regards to use after frees, my impression is that the places which
use caches are the worst affected and also where we do the worst at
detecting them?  Does KASAN detect use after frees with kmem_cache and
mempools?

regards,
dan carpenter



