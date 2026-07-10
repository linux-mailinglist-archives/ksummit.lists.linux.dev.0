Return-Path: <ksummit+bounces-2964-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ubBDHofjUGqJ7wIAu9opvQ
	(envelope-from <ksummit+bounces-2964-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 10 Jul 2026 14:20:23 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B966173AB26
	for <lists@lfdr.de>; Fri, 10 Jul 2026 14:20:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2964-lists=lfdr.de@lists.linux.dev" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="ksummit+bounces-2964-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4311F30277FD
	for <lists@lfdr.de>; Fri, 10 Jul 2026 12:16:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368EB409298;
	Fri, 10 Jul 2026 12:16:31 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBDE3C4B9A
	for <ksummit@lists.linux.dev>; Fri, 10 Jul 2026 12:16:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783685790; cv=none; b=QV7ELHp0elk6o0kmGQVlKWELSXyqjesUTxxIFRT2DcRb52gfGlSR5ey0vzxDecAJViUMeX7peiWwhnXqurxuAXryBTjpFd4EOduY+mRG4gXcpD6XFIH0nTn27crEP5uLcCN0W02arj8NOm/H0jifymr1sro4XDEiYfqCIz005ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783685790; c=relaxed/simple;
	bh=LDySB71eUrFbmsOdfinscvvDAABRx7BGJFrtV0/ecy8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=rrfreDwBnae47cvKxdvdN1Knu9+lJ1BdJG2veoYiAeD0KUjfPyqd6iqhTj1OOJqM8CIk0kXCV7Iyy19ZANr/RmtwQgxsoen+ElZAU/qyYtIKXD++t0ZKxMfCOncMAFrIf2JbwD4eN16Ak1gFjXuo80jpnVgag7m34SvtPJAp8j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.12
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 3A6A8A03F4;
	Fri, 10 Jul 2026 12:16:23 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id A44D320027;
	Fri, 10 Jul 2026 12:16:21 +0000 (UTC)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 14:16:21 +0200
From: Joe Perches <joe@perches.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dan Carpenter <error27@gmail.com>, Matthew Wilcox <willy@infradead.org>,
 Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
In-Reply-To: <CAMuHMdUBHvY30ZuV=mpnkQ0Fip4vk0iqb252H9YNiOJ=AtPpyg@mail.gmail.com>
References: <akKBVsFBro_4QM74@casper.infradead.org>
 <202607090956.6381F35@keescook> <ak_WOfpcaZIuh99t@casper.infradead.org>
 <ak_rr7I4wVPieWYT@stanley.mountain>
 <CAMuHMdUBHvY30ZuV=mpnkQ0Fip4vk0iqb252H9YNiOJ=AtPpyg@mail.gmail.com>
Message-ID: <a3ce887f7d876c22f2a0048e6307fe75@perches.com>
X-Sender: joe@perches.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ny6u3jktsj5wgfngqc7g8967km57cc7c
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+0OZjQVhSr9UmQGAs+6UDep9uocWfOO64=
X-HE-Tag: 1783685781-417039
X-HE-Meta: U2FsdGVkX1/cJ9fz5kLMoOI0WGJNHbvbjjKdahTXt/mCYJdj9BHzlv+4h28w90PA4lXI8EqqTlzCOHLq/yPX3lAsH7d8rBYADsUppZH3jFvFV+Go7c4NdOjT7O8/HrflIXHV+arDIrpEGNAd42q148pRYpepvNoMiTxkbSpseTLbN99wmiepBHYjHWBV1frvjZBqDLOvRD0qHdbXqWvzHaCRADtjjft0i57FRHeVh15v4Zshl84ow/q8TJMrtu5GtyWRGQHi09wCMvwQz1euVvmGnjWKszT/g14uyZcpQ/9vSVJ4Gq30lTqsq0UC6OxI7PF2usHFvFSRjBlLtYQ/SrCeL5jCGlsBfEK2ELWWC87xYwzseU/CQrbA0/Q9vzbr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-2964-lists=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[perches.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joe@perches.com,ksummit@lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.dev:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,perches.com:mid,perches.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B966173AB26

On 2026-07-10 13:21, Geert Uytterhoeven wrote:
> Hi Dan,
[]
> You know that most people are using the devm_*() allocators  these
> days and so they do pass GFP_KERNEL? ;-)

One day they won't:

https://lore.kernel.org/lkml/eed0c57a2c897e34d411229c3de41c5402791894.1781575297.git.joe@perches.com/


