Return-Path: <ksummit+bounces-2814-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y6VQGmgvdWkNBwEAu9opvQ
	(envelope-from <ksummit+bounces-2814-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 21:45:28 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B44F57EF44
	for <lists@lfdr.de>; Sat, 24 Jan 2026 21:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74344301050A
	for <lists@lfdr.de>; Sat, 24 Jan 2026 20:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72395280014;
	Sat, 24 Jan 2026 20:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uOShsgGN"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F014B3EBF03;
	Sat, 24 Jan 2026 20:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769287518; cv=none; b=cVkDQilrlm4nLvgFgCelgU7kI8Pt8ULTfXkMwVswgOCDwr5hZddBApJcuSPiTNbtjc4jDrAZ0DeKbhsdCHfy0mV6nHvsrgdz2p8tz1G/599T+v3DrtBoNgszUhSdpFzeiOI2LjNZx2raVbWsjOOU9apvVBIZGk2FlYhWBr9STc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769287518; c=relaxed/simple;
	bh=Nn/mFeZsUuW3QZNTIcWWrnVhXKVZiBeqn9RJwFBsmws=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uOQhbvzHg6CEwE44VPb/hqZLYI3iVrjpJi0FnfZdMlA9qiqmggVts1gm1Jb2IPlcr8TUTs4wn9zsgr1Hy64c8RHb/owbp/7PJPg4zkAQckGAvsrQfrinZTZI9uTGp5vSaQhQBz6OmOTZiXBwLFFIhLI9CC/MteafU/LAjzta2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uOShsgGN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682F9C116D0;
	Sat, 24 Jan 2026 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769287517;
	bh=Nn/mFeZsUuW3QZNTIcWWrnVhXKVZiBeqn9RJwFBsmws=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=uOShsgGN1ihYjjwpA9psz4gJK8R2GYAo0bXu2zEgUC6MFpkRZtt4x8MkYrWNiAhRF
	 Rdz/wgruUWtiiLm+d9eeIfyqkt13bo8eL0PuGZBAhmMJRvCwcarsVAz082oqXrDnYR
	 nAKorcET5VNGp9plSxHVL8oJ4o2xKV+Ru8tAHah1DlRzCLnjA2q3shLW2i7E7pOQ00
	 Pj4OFM/BXFEGPW6Tsl3SjLEExkgxy//sUkkKxfojITtDOQSsoVrl9La4OJkjAvNl4p
	 hZ2KESN0O9KTAvUhhlZ//M8WrStNtWfgBmN9S+f/C9hAujG6vUIhtRx/SQGkFDTpCB
	 mNMDV7jkwWf/Q==
Date: Sat, 24 Jan 2026 21:45:14 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
cc: Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net, 
    ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
    tech-board-discuss@lists.linux.dev, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] Documentation: Project continuity
In-Reply-To: <20260124082939.40715e13@foz.lan>
Message-ID: <934p49q9-r248-74s5-o936-431oo97o20on@xreary.bet>
References: <20260124012256.1856709-1-dan.j.williams@intel.com> <20260124082939.40715e13@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2814-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jikos@kernel.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,xreary.bet:mid]
X-Rspamd-Queue-Id: B44F57EF44
X-Rspamd-Action: no action

On Sat, 24 Jan 2026, Mauro Carvalho Chehab wrote:

> > Document project continuity procedures. This is a plan for a plan for
> > navigating events that affect the forward progress of the canonical Linux
> > repository, torvalds/linux.git. It is a follow-up from Maintainer Summit
> > [1].
> 
> The idea behind this document is interesting, but IMHO it is too
> optimistic for a contingency plan ;-)
> 
> Conceptually, contingency plans are written to overcome all foreseeable
> bad consequences that might happen. So, it should include backups
> for each possible bad scenario.

I agree with Greg here, that covering each possible scenario is not really 
realistic an feasible anyway.

I believe that rather than the actual deep details of the plan, it's much 
more important to have it written that "there is a plan".

I for example know for sure that there are people out there who believe 
that there is some secret testament hidden somewhere within the depths of 
Linux Foundation on this topic, and this explicitly clarifies it. Which 
should be the main prupose, in my view.

-- 
Jiri Kosina
SUSE Labs


