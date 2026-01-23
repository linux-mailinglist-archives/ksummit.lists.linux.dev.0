Return-Path: <ksummit+bounces-2800-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAd4JCikc2kbxwAAu9opvQ
	(envelope-from <ksummit+bounces-2800-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:39:04 +0100
X-Original-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC2378990
	for <lists@lfdr.de>; Fri, 23 Jan 2026 17:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97A0A302C754
	for <lists@lfdr.de>; Fri, 23 Jan 2026 16:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDFDA315783;
	Fri, 23 Jan 2026 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="irJWg1Gl"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD757311C17
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 16:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769186320; cv=none; b=rA53IbEpw+/PlrtrdHaYAwf0nKKlvMT5eOA3At5EnZ/Od04ov31tocwc8p6EP+D8mT2FH5j6r34lFxQloFTf8bVLXA6PxErl8OiUY0yfn5DGdW9X05Ec/hSS0OWlsg6lxzkLgQLcOFzQlkFvyggWYj5mnxC8t9jeT4V5OlTBlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769186320; c=relaxed/simple;
	bh=LmBD8TKxRTYEQbBoCVChtksxfjK5Mk5AZu6YUjl6Z64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeAtjzK4EaajLyhMQLQAIHsAUNcEeIWw719KnIUfSrW7q+RoK+vimsA4rSRwZOdnof45lnc2NKi42DSRslOtTQL+M4rvvhzc1i979cMfltuiwpNiToH1hInaK+nW6bWCX2wkwiFnU3NVh6FEoG9o1qnYptiOrjynUREXFDxCeis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=irJWg1Gl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D8A8C4CEF1;
	Fri, 23 Jan 2026 16:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769186320;
	bh=LmBD8TKxRTYEQbBoCVChtksxfjK5Mk5AZu6YUjl6Z64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irJWg1GlwfqHmrj2ZJ7v/jktfzrqCEIeQGZRvAFwqOi4+uVmnGLmoRBfKKHExFjoK
	 poy97xHDXA6PKuznoSdxN1f1ev58k6jOP2uqPC3ll2h/nd8bFcH2Mrzc92UD+FqOT+
	 AhVq79+r/jhXNzt1DxYCP9C+dJH9XnZ+XGiPyu2Zm6+wU9nuDNCNrHoTfx1hMRcimM
	 tmqNW6MeBvVeI84ARJQmr/GZb4ZsiszcHuPoL+e6IOcpB0qeSpODu0NgGmvP8ezjM3
	 hRvsqSrkI1NKyoJPEth1v8+uqX+uYDeSCy69ZHfI71HU1I37yn/YmkpflnamBXnxXy
	 HHNqoYu3ut1Hw==
Date: Fri, 23 Jan 2026 11:38:39 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123-hallowed-catfish-of-pizza-bde94f@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <806a695eff99bd2eba935d0d5ada29cc29b31818.camel@HansenPartnership.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2800-lists=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0DC2378990
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 11:24:33AM -0500, James Bottomley wrote:
> > There will be a presentation about this in February at a conference
> > and hopefully it will be made public then as the work is still
> > ongoing.
> 
> Could you please stop doing this?  The Open Source norm is to release
> early and often and long before you have stable code so you get
> feedback incorporated *before* you're committed to something.

I will provide this feedback to them when we meet in a week. It's not the LF
itself who are writing this code, but a bunch of security devs funded by
OpenSSF and they *are* closely working with me and Greg during the initial
iteration to make sure that what they come up with is actually going to be
suitable and well-received by the kernel community (like, don't write it in
nodejs or something).

So, I'd say we're doing it right -- write the initial tool based on the
requirements provided by some key users, then release the 0.1 for broader use
and do iterative development based on feedback.

-K

