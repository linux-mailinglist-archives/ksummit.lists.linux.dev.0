Return-Path: <ksummit+bounces-2796-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJhMAYV+c2nDwwAAu9opvQ
	(envelope-from <ksummit+bounces-2796-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Fri, 23 Jan 2026 14:58:29 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 65820768B2
	for <lists@lfdr.de>; Fri, 23 Jan 2026 14:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3378D3022947
	for <lists@lfdr.de>; Fri, 23 Jan 2026 13:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A640A2E8DE3;
	Fri, 23 Jan 2026 13:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BL1bW2rP"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E9A1FDA61
	for <ksummit@lists.linux.dev>; Fri, 23 Jan 2026 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176629; cv=none; b=ZPsqnIB4uF1LkXOrpii2R+3QMStazs8fglcchth4YWKs99QAgH9N9TE+43db1lhhsVPkZdsl1E8bu58LfEWf4kRi3MIZmL1RBQBIDiw3+GbOFA1Sn7CculTJvJF9ArhVwhfeJm5buWU+BA3AhgqxfhvlmN+2IHPidWCs2L0+hXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176629; c=relaxed/simple;
	bh=es7bgQHpEnlGysJs2S7sYcbzWhgHIyrOChcEdlNsvu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lz8LwNzH8JE30bF1LLWZCIc9EJWmuEffhqdGKonDhstUZexR43PdEiWhgGP7gumJKWe531i3sH4pZsNMJNE/6bNyijcV45JnO7tjAET60O0lFQeWeW5jq9k5iKu5dSAQK6BVev7K6h7VxttPCV/cktZRJc+EWqsBevUHF9K6UfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BL1bW2rP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A78BEC4CEF1;
	Fri, 23 Jan 2026 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769176628;
	bh=es7bgQHpEnlGysJs2S7sYcbzWhgHIyrOChcEdlNsvu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BL1bW2rPxwbvqEKLq9ejQb563+yqOlHrDfc4ndtQT4g/l3VkNwMnPy69SMPMoYmK2
	 GMdDKAlh5LInoTCxrkz0+FpyZgQdgbODtYfrZo2Zh+TxgVsMC48Z17B03sV2Qkfqqd
	 ds+rfwVMMKV3LrwYkU0hMkiYOGrodglZZziXFj2g=
Date: Fri, 23 Jan 2026 08:57:07 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, users@kernel.org, ksummit@lists.linux.dev
Subject: Re: Web of Trust work [Was: kernel.org tooling update]
Message-ID: <20260123-impetuous-catfish-of-cubism-dd40ea@lemur>
References: <20251209-roaring-hidden-alligator-068eea@lemur>
 <6e0c8c00-4efe-432a-92e8-c51aa15b4a34@kernel.org>
 <2026012340-cannot-spud-5d46@gregkh>
 <20260123124700.0ab2a954@foz.lan>
 <2026012320-tiptoeing-backspace-241b@gregkh>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2026012320-tiptoeing-backspace-241b@gregkh>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2796-lists=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[huawei];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxfoundation.org:dkim,sched.com:url]
X-Rspamd-Queue-Id: 65820768B2
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 12:58:48PM +0100, Greg KH wrote:
> > I got curious when I saw something about "First Person credentials"
> > at https://lfms26.sched.com/event/2ETT5?iframe=no that 
> > "would begin with the Linux Kernel project" - and more importantly
> > how and when it would affect my duties. I guess I'd need to
> > refrain my curiosity until the end of Feb :-)
> 
> Ideally it will not affect anything, just replace the use of gpg however
> you use it today for kernel work.

Small correction -- "gpg web of trust" specifically, not gpg in general. You
wouldn't be forced to change anything in your current workflow if you're
already using gpg.

-K

