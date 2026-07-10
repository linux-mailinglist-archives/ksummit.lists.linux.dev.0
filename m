Return-Path: <ksummit+bounces-2963-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WqwvKdjbUGqg6QIAu9opvQ
	(envelope-from <ksummit+bounces-2963-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 10 Jul 2026 13:47:36 +0200
X-Original-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 936C473A644
	for <lists@lfdr.de>; Fri, 10 Jul 2026 13:47:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b="sQSrmd/x";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2963-lists=lfdr.de@lists.linux.dev" designates 104.64.211.4 as permitted sender) smtp.mailfrom="ksummit+bounces-2963-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A16F13007AD7
	for <lists@lfdr.de>; Fri, 10 Jul 2026 11:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1E43F39E0;
	Fri, 10 Jul 2026 11:44:46 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2A341B374
	for <ksummit@lists.linux.dev>; Fri, 10 Jul 2026 11:44:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683881; cv=none; b=ePZcQQduNds3cheWIxMTMw3An9qYYfgvtTNZldCIsbpV7fXVbkZPwgJbvaMEwBqUZc0zXTVXEkYv04QA9HCgU2LUoH3fn0RqM5X8Ehr4LkuWI7KpvqWpPBUXNIGEoygcX3houTBbKGfQRfL+1DxUBD+191cjmtLYskwDHWcAa9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683881; c=relaxed/simple;
	bh=c6m6WBZurZsdw9FftoLvNiIJw9pdSiOMDHdcfbASVPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/jaMnWEP+qF+lWKIb04N0iv4P+ic/Cf8uI3DLhaboQCTKUF9He30RRl6IAbgYwpMD/GEuWG0MKiYCgI+s8HHbWsXJffPtXVMJyyZ2liFDE9El/8oUwMUCFwfov4Ij1W84bTr18yuUjh2LzHBHKJVsA9dIoQICYaXxzTVoF1o6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sQSrmd/x; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19CD012F;
	Fri, 10 Jul 2026 13:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783683812;
	bh=c6m6WBZurZsdw9FftoLvNiIJw9pdSiOMDHdcfbASVPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQSrmd/xLPan2grdU7PTMWD2KMDufvBnTgbVyFMUnfnwUIB+4MWEK38aJOsSotJT7
	 +KQeOzqy43DGE+FAJjsoYKi7nvz8NqHBuwy/Wn4h+338bQ6VhTO9Aj28z6cLTtXWEg
	 n1/6mH7tfY+qMjiBXvRIN3BP4M2C6lZzZ50pdOFA=
Date: Fri, 10 Jul 2026 14:44:21 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <error27@gmail.com>, Matthew Wilcox <willy@infradead.org>,
	Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <20260710114421.GA1127719@killaraus.ideasonboard.com>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org>
 <ak_rr7I4wVPieWYT@stanley.mountain>
 <CAMuHMdUBHvY30ZuV=mpnkQ0Fip4vk0iqb252H9YNiOJ=AtPpyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUBHvY30ZuV=mpnkQ0Fip4vk0iqb252H9YNiOJ=AtPpyg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-2963-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,ideasonboard.com:from_mime,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 936C473A644

On Fri, Jul 10, 2026 at 01:21:23PM +0200, Geert Uytterhoeven wrote:
> On Thu, 9 Jul 2026 at 20:52, Dan Carpenter wrote:
> > On Thu, Jul 09, 2026 at 06:11:21PM +0100, Matthew Wilcox wrote:
> > > I agree that many memory allocations benefit from providing more semantic
> > > information to both the compiler and the runtime, as you suggest.
> > > What I don't think we benefit from is "And you have to pass this magic
> > > GFP_KERNEL argument too.  Unless it's GFP_ATOMIC or something".
> >
> > You know that most people are using kzmalloc_obj() these days and so
> > they don't pass GFP_KERNEL...
> 
> You know that most people are using the devm_*() allocators  these
> days and so they do pass GFP_KERNEL? ;-)

I know that lots of people overuse the devm_*() allocators in ways that
are very harmfull :-)

Jokes aside, I think Kees mentioned he would extend the object
allocation API to devm_*().

-- 
Regards,

Laurent Pinchart

