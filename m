Return-Path: <ksummit+bounces-2943-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ef/fEOuhQmrt+wkAu9opvQ
	(envelope-from <ksummit+bounces-2943-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:48:43 +0200
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B89336DD7DD
	for <lists@lfdr.de>; Mon, 29 Jun 2026 18:48:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=drrGiDSo;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2943-lists=lfdr.de@lists.linux.dev" designates 172.232.135.74 as permitted sender) smtp.mailfrom="ksummit+bounces-2943-lists=lfdr.de@lists.linux.dev";
	dmarc=pass (policy=none) header.from=zytor.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2470530089BF
	for <lists@lfdr.de>; Mon, 29 Jun 2026 16:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866714657F8;
	Mon, 29 Jun 2026 16:48:38 +0000 (UTC)
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EFB4611F4
	for <ksummit@lists.linux.dev>; Mon, 29 Jun 2026 16:48:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751718; cv=none; b=uB371MjtN3wASKorLFwNm3XJYw3tonTMTp5Fx0Fld9aOVpK7S87YzxlYP+REfEI4EXsQ5HrHMA9V6ULKsAYbGsJOKIruxxz0ZQswrfu5HPF24H0kHHpHY2FlaE2KchHmPZdNgbPXo0T7jdUGJP3VCQTRRqnDNEM6E335/v1icJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751718; c=relaxed/simple;
	bh=p9mSBOeRdjbqRyIZQvAcDf52aq4Yct4QUAl328mlXGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HucoToBpN6qcP0zSsWW7NS1uCOtDKw9ohZ3AlQ9ZyqNIAdjzkDwCnINbuZw/rz2fg7MGpd7/TlWaT+Xg8lQuK4HJ14uI0ae6wLH5u7cJbMr0Z65XigTwcjODoFFWZCiIKVqn42O5WdQbxTl+XtB+1WeoNWnXxgHy7gxfK5s8nqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=drrGiDSo; arc=none smtp.client-ip=198.137.202.136
Received: from [IPV6:2601:646:8081:7da1:68c9:ba90:b2f5:8138] ([IPv6:2601:646:8081:7da1:68c9:ba90:b2f5:8138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 65TGmU3Q667223
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 29 Jun 2026 09:48:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 65TGmU3Q667223
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1782751711;
	bh=ZjzyEUoqFKpt90TH0DSxMsudnf+U1lzw1BAy1DnYddE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=drrGiDSouBPuSv3YXytFKZP2iE5znNFf2Mifhm8A2/XKzgur8NBf1S0xN0xAc4A4/
	 LpSw/lGLyPmoDWOWiX34LtoQbWh10CAddhRyzFLh7hjonj+yvG4pK1FUYk2ACkMpWw
	 Ctoy9mUDgYzzJ0hAfPe892gcvDflxSGs7IqaELg5AuFnX9M/ZmHvdGra7lQvoE2Xhf
	 znXR3lWGuAjv8d0I+65EzFEQHixOC7PuPXp58jsjetXT4NyPqgxbijG3aGj+MLFePv
	 Fkm5mIfbJnRXbh6h18wfUOQqc2MSWomzKNksElcS9txsVp3gCBdv6vUbYWlG8qWWrd
	 lXtCYnLayDhsw==
Message-ID: <c48a77db-98a3-4860-ab30-bcbbe0884baa@zytor.com>
Date: Mon, 29 Jun 2026 09:48:25 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Implementing malloc
To: Matthew Wilcox <willy@infradead.org>, ksummit@lists.linux.dev
References: <akKBVsFBro_4QM74@casper.infradead.org>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <akKBVsFBro_4QM74@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2943-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[zytor.com:+];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,lists.linux.dev:from_smtp,zytor.com:dkim,zytor.com:mid,zytor.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B89336DD7DD

On 2026-06-29 07:29, Matthew Wilcox wrote:
> malloc() is a standard part of the C library.  Yet we force new Linux
> programmers to learn the difference between vmalloc(), kmalloc() and
> kvmalloc().  They even have to acquire an understanding of the difference
> between GFP_KERNEL and GFP_ATOMIC.  If they are particularly unlucky,
> they may have to understand other combinations of GFP flags.

You *NEED* to understand that if you are going to program kernel code. There
probably isn't anything more important, *really*.

The kernel is a memory manager first, a scheduler second, all else is commentary.

	-hpa


