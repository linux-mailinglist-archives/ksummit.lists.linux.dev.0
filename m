Return-Path: <ksummit+bounces-2812-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RO9fBHqRdGkz7QAAu9opvQ
	(envelope-from <ksummit+bounces-2812-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Sat, 24 Jan 2026 10:31:38 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 502E07D1AB
	for <lists@lfdr.de>; Sat, 24 Jan 2026 10:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E755A300B454
	for <lists@lfdr.de>; Sat, 24 Jan 2026 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAC722126D;
	Sat, 24 Jan 2026 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CkH0gr1M"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0063EBF1C;
	Sat, 24 Jan 2026 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769247087; cv=none; b=Ngk3x68aWU6fqD6jgN0XDA4drZhhvmcAmjO4PlGwsompHv1dXgAm88l9juNFUD0JJ5YQnZKqzcK8VFqhixJTkHLjXvJc962w+1YpGztG8ad+grnBYsxfFaDK/6rJM/6X/z1X7mNfCiN2CXFn4vv4yNUR/RjjDF3e8qTRe8nBgVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769247087; c=relaxed/simple;
	bh=0boULBzOqolceekIbnAkeMqOMuPoOw+Ksf7bKBs+QHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWjotXcGQwYzMJRX/P36CpW9/LQncJdLt/ZnYWCwoiZzR7g0ykfXbHXYFIuzUB9GywCASSd+qosXY8+xSqsLtgQbvLRyDzAWvMh4PbmLb3V6khbyJKZAmYy42iimUgxbjqTTsco7poj35FUdFhOfKD05K0DxuZVVNfIigMu1Egk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CkH0gr1M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5CBC116D0;
	Sat, 24 Jan 2026 09:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769247086;
	bh=0boULBzOqolceekIbnAkeMqOMuPoOw+Ksf7bKBs+QHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CkH0gr1MHVrTqs9ypGWulumOoRu7P2N+Sr5Z8jxpmfMztS2+hSFou0gPUSemUPxom
	 AGE8c+qiH6jWfZRGd5W3/XG3zeqrQgB2HPoTtR0hvcDs7sMPSQucmF1WJEOolm0oyn
	 2TUIqWlSBSzzspeISAchUY8kfcjXpDAtWz4OS/WE=
Date: Sat, 24 Jan 2026 10:31:23 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Dan Williams <dan.j.williams@intel.com>, corbet@lwn.net,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
	tech-board-discuss@lists.linux.dev,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH] Documentation: Project continuity
Message-ID: <2026012441-jolliness-cringing-7e9f@gregkh>
References: <20260124012256.1856709-1-dan.j.williams@intel.com>
 <20260124082939.40715e13@foz.lan>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124082939.40715e13@foz.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2812-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 502E07D1AB
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 08:29:39AM +0100, Mauro Carvalho Chehab wrote:
> On Fri, 23 Jan 2026 17:22:56 -0800
> Dan Williams <dan.j.williams@intel.com> wrote:
> 
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

That is not the goal here, we aren't going to enumerate all of the
potential issues/plans for every possible scenario, that's just
impossible and would take forever and likely result in something that is
unworkable.  This is here to say "these are the steps we will take to
form a future plan if something goes wrong with our current one."

thanks,

greg k-h

