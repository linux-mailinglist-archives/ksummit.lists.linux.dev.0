Return-Path: <ksummit+bounces-2822-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEaFCFfWd2mFlwEAu9opvQ
	(envelope-from <ksummit+bounces-2822-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 26 Jan 2026 22:02:15 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D698D721
	for <lists@lfdr.de>; Mon, 26 Jan 2026 22:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26E3630205D3
	for <lists@lfdr.de>; Mon, 26 Jan 2026 21:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 810522DCF41;
	Mon, 26 Jan 2026 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngWMeGXU"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3EB2DC78C
	for <ksummit@lists.linux.dev>; Mon, 26 Jan 2026 21:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461321; cv=none; b=kF6w7MFud2wozMicN2Pduc0i924+77WQC+HJIxNC0BfdRAmrz4BWSLQvmRdhE+cJJkmNlTV6mEqodLRbuQs4GQfAXmR0/lRkdNQpt6hsH+N5d5iArV8ju0ZkoNePHNiNxQasnyOKyFNcYylnMezQhLMgIYUizg4pxsvUKRKj4p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461321; c=relaxed/simple;
	bh=2sTcAg2o32JALRAkGGX6GTg5z6oCoEIzhFYMd5ZjntY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c9otohLxzFZQi1HG3F84QVUNczL3qMOrYXpcMFYzTmZPmpl7geYt9pHw5ahVRTw6fJ6zm7gTb5W9KRMm4cPptw9oUEqubRhD8uvlK+Bkj+AVX+/7lAgLncJTb/sLdcXYmSXasUu/iyJlteVqFFp6HaUZOk4h9ZcKrtwmMx8yoOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngWMeGXU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F47C19422;
	Mon, 26 Jan 2026 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769461320;
	bh=2sTcAg2o32JALRAkGGX6GTg5z6oCoEIzhFYMd5ZjntY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngWMeGXUa5uIeN1nx4247MnTyi5xKh0c3geQSx65WNmsEY+bpL03o+cism/KwKkFY
	 cVBR9jpHFdsNfRdl2DXpayhWFUnqwmnWGVkmKqWIX/f1MHLv79kntpTI+ETGceYi/E
	 ++cP93xbLOO0sKw110ELe6bDTw/KBQKlZRgYI2puQOwykadi2QYPFbj1bwIlICNjZv
	 3rS70bmX8/C4rhc1xKFGmJdp4XoxyXiabtDIS87bj8i0J8GX5G15ZEhdgn7H57iSb4
	 b8vMplqpsg/xzuIEYNT9/RVjPvnQuNVs8q0DobNF29fqAcL0dF+hxpRkzgfozA0NTg
	 mDFKIP3uANvDA==
Date: Mon, 26 Jan 2026 16:01:59 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, users@kernel.org, 
	ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260126-denim-quetzal-from-shambhala-aedeb0@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
 <2026012340-wildlife-scratch-1efd@gregkh>
 <8fde8057e2bacb1bd3bd2c15134a6f69ef037699.camel@HansenPartnership.com>
 <20260123-provocative-tungsten-curassow-cc2aac@lemur>
 <c4aa6604-e076-4f04-85a6-d0267a3fb8e8@kernel.org>
 <20260126-sophisticated-beluga-of-hurricane-00e16b@lemur>
 <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <x5nnix4t2w74flef4xnivzw43gx7wdk7v3cirawq52qfd6qdty@he74b5uk26zc>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2822-lists=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mricon@kernel.org,ksummit@lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B2D698D721
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 06:32:22PM +0100, Uwe Kleine-König wrote:
> Actually I'd like to see you/us add still more burden and asking
> developers to only hand in keys with an expiry date <= (say) 3 years.

That would mean me too, eh? :)

I don't want to make this decision unilaterally, so I will bring it up on the
users list.

> I suspect that among the 600 keys we have now, a considerable amount is
> actually unused and it would be good for security to drop these. With an
> expiry date detecting such keys would be much simpler.
> 
> I wonder why you expect the number of keys to rise considerably?!

That's only if we ever consider expanding the service to everyone sending
patches. It's not tenable with the current "must have a signature within 4
hops from Linus" requirement, but we could also have a special "lax" mode
where we only require an email roundtrip for verification. The b4 web frontend
is about to start publishing a keyring like that.

> > I do appreciate your work!
> 
> Areas that I see where I could be helpful are:
> 
>  - moderating the keys ML

Yes, I don't see why not. The mailing list server is in the final stages of
pre-migration work to RHEL10, so I'm limiting changes to it at the moment, but
I'll be happy to add you to moderators/gatekeepers once the migration is over.

>  - giving feedback to patches
>    (currently I mostly see the patches when they are already handled
>    because you seem to do moderation and patch handling in batches.)

Yes, I have a weekly task in my todo to review on Fridays, but sometimes I
snooze it to Mondays instead. :)

-K


