Return-Path: <ksummit+bounces-2948-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 40tlJHwSRGrinwoAu9opvQ
	(envelope-from <ksummit+bounces-2948-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 30 Jun 2026 21:01:16 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC536E75F3
	for <lists@lfdr.de>; Tue, 30 Jun 2026 21:01:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=temperror reason="query timed out" header.from=goodmis.org (policy=temperror);
	spf=temperror (mail.lfdr.de: error in processing during lookup of "ksummit+bounces-2948-lists=lfdr.de@lists.linux.dev": DNS error) smtp.mailfrom="ksummit+bounces-2948-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A613A308F2C7
	for <lists@lfdr.de>; Tue, 30 Jun 2026 18:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 285CF3E0081;
	Tue, 30 Jun 2026 18:59:43 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9D739C658
	for <ksummit@lists.linux.dev>; Tue, 30 Jun 2026 18:59:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845982; cv=none; b=Ri0kVBQ4R9shUbm9wxI0FM9i949X/hVNywGRjjGe5SVMge1mhB88SljELjb3cTwyVJocuAETqQeCgGVx4b5DNBRKd56HvK4GsLas0vbn5/4xRbnrDjyJrS3WVHSR/JHX62R+Ate+IROj2oOOVktVd6bCsRHSDdHxGtWA5fUd01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845982; c=relaxed/simple;
	bh=nhq2xK7KJ96F3vKsPspGYgcNn60Hi6ntzgs74NlB/cA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rvvusPm0nHaQoFhbH085fRH4wlr0k4LZPWgJPSnHiIOaVL0sCDz2Owok1llQ2KyG/PiWFNMQtjfuZvRoIcjJCpjxeJDhcIp4sClmK14AH8+8Ko1PO6NgiZrNK1IcetcqduQh7iW4Naj0DCgil2RAwLp1wrZiy5XKSbHPU3oLFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.14
Received: from omf08.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id DA4F21405CD;
	Tue, 30 Jun 2026 18:54:01 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf08.hostedemail.com (Postfix) with ESMTPA id 4CAFA20027;
	Tue, 30 Jun 2026 18:54:00 +0000 (UTC)
Date: Tue, 30 Jun 2026 14:53:54 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Implementing malloc
Message-ID: <20260630145354.3119c1fb@gandalf.local.home>
In-Reply-To: <akK3KACxE9gIFZSH@casper.infradead.org>
References: <akKBVsFBro_4QM74@casper.infradead.org>
	<c48a77db-98a3-4860-ab30-bcbbe0884baa@zytor.com>
	<akK3KACxE9gIFZSH@casper.infradead.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ebkx83p6g6btqft3kfg1ijidq3s1tejn
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/oz+srPBTZ2LxdBJKH/X5ccGlJaV8gwMk=
X-HE-Tag: 1782845640-444463
X-HE-Meta: U2FsdGVkX1+k5tUjw/iBFSJncQywzKjUMY38yLgOzoG6ZsZOau8nnYUtff0Fbzrd+1c7YDH/KyOuEQTwu8z+gki68GdnE96EKWVeg7wlWKbKHiBkRq54owYMvjA3EQpX3PCQDpVJ5KqEh1SusidB8RwZoE+htOZt/Nv6Na/kNbMM8BTQmQBzrXtl5XhPzlKbMCHzjEvc8+buD+Cl1feI85VyB+S5XaDhe0IQjLXS0urQPSRyY8i/hFzO+2dg/c7gQ2tBTII2A5q36VluKuN8S15wsMDkM/6iwYj4U0KlAqe53z7xSU53gkLrpTQsbgcZwqA4aPoHp73KnZIB4BSnkhzZhxQ0HtBYEu8KqwGcGVmRB/HZ00JB8jlNYoJv1OHdkilTaK79mwhkFHmRZ3UMoQ==
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.26 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RSPAMD_EMAILBL_FAIL(0.00)[rostedt@goodmis.org:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,lists.linux.dev:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,goodmis.org:from_mime];
	URIBL_MULTI_FAIL(0.00)[gandalf.local.home:query timed out];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2948-lists=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[goodmis.org:query timed out,infradead.org:query timed out];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[goodmis.org:query timed out];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:query timed out];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,ksummit@lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	R_SPF_DNSFAIL(0.00)[~any];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[infradead.org:query timed out,goodmis.org:query timed out];
	DBL_FAIL(0.00)[gandalf.local.home:query timed out];
	R_DKIM_NA(0.00)[];
	DMARC_DNSFAIL(0.00)[goodmis.org : query timed out];
	SURBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:query timed out,goodmis.org:query timed out]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CC536E75F3

On Mon, 29 Jun 2026 19:19:20 +0100
Matthew Wilcox <willy@infradead.org> wrote:

> #ifdef __KERNEL__
> #define malloc(x)	kvmalloc(x, GFP_KERNEL)
> #endif

If anything, add a might_sleep() to that, so it triggers a very bad warning
if called in any context that does not allow a schedule.

-- Steve

