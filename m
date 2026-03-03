Return-Path: <ksummit+bounces-2884-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OJuLmNkp2mghAAAu9opvQ
	(envelope-from <ksummit+bounces-2884-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 23:44:51 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C481F8206
	for <lists@lfdr.de>; Tue, 03 Mar 2026 23:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBE68305C8FC
	for <lists@lfdr.de>; Tue,  3 Mar 2026 22:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E375E3750D6;
	Tue,  3 Mar 2026 22:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="hNMZ1ezV"
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693AC33688D
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 22:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772577886; cv=none; b=dY3T35LC9UNJX7V0rQ33p+kTPA56leBdWWHjgWj5WzF+avIVZzZDU3aEX6PgF0GrpE1yU7aKBOBJKKPxg444/fzwmPfgKDqyGIhwjXYEjxvGhz5QRv/m4gpm6tpMgM1nb9iROtS/RjT9NobbI5H4PWAxKcAhrmL0mgfS7mGi1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772577886; c=relaxed/simple;
	bh=GNjF9Jb2KVeH4EWeKjOSw1OAZXEoPnJ01JhW3NIePaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmoPyqvwvUDjBkTUI7fSWQEzS5QMVnhe/Ki0/JKqiUZCpF/gaf+11gUM3crvRDfoboujp484IFBhYwHCRuoRkI2X3Cl+g3YxMsd2UGV3lpcEX66IbbArYt9aR5/zRNQOq/yRILQpAF0RrJzaMmVXJjfmoqAxXcCfbbzuVw6ztGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=hNMZ1ezV; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772577870; x=1773182670; i=deller@gmx.de;
	bh=5UM2ZTgjyhBgEQySjMNe77ROvOcByfqrUiGcXMQ4Ros=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hNMZ1ezVtHt5Hy8DHjjy7/Dyb0syA9EUKYKPmQntwWmVJ8AH+l3eFJ4Ir+mhZeJB
	 ea9lp8biQDJ7CHhiPCZmIOX3HYsIy9WWUxZc+zSUK/Tt/EFiA2UmLmQoAnnitsVS0
	 ARJ+Ol9PfwEjhStnz2M1z2mhzC97zuPWlucDFid82vgNmW1dN9yzk+588vv75ZD+F
	 TYCGW5LLqJKMidpjaO4QVluvy0YY8PNj1ch1IYBuaO4kArXaKHQjyuigH1E5/ojOE
	 EjzGYVd75fxNpNQtLT5lR0O5AsSN2AMbwtyKFB9doIoNWxxUvY+Am+naGXxdVCLb/
	 4WSK2SrgC8CK4YfM+w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4b1o-1vvu393ZVG-00B2s4; Tue, 03
 Mar 2026 23:44:29 +0100
Message-ID: <1d3c74ca-d2de-4655-b4c1-a1dc120f38aa@gmx.de>
Date: Tue, 3 Mar 2026 23:44:27 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
To: Sasha Levin <sashal@kernel.org>, torvalds@linuxfoundation.org
Cc: akpm@linux-foundation.org, geert@linux-m68k.org,
 konstantin@linuxfoundation.org, ksummit@lists.linux.dev,
 laurent.pinchart@ideasonboard.com, linux@leemhuis.info, richard@nod.at,
 rostedt@goodmis.org, users@kernel.org
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20260302202828.2722037-1-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0RRVZqNB6vdCDJne5fhLtRhZjdBu3GU0a9JZSWt4glEFMjJlpNC
 OQU1fhgI1PbIk8vVWu9ZGtbcJnuhdLx7CcI3n3Xqxqr21uC87U9Vtfhbjk9bcsm2H6Hj/JT
 CMIJZf89wA6xnY3DwXRxUmgTMuniQl5+02WyXuc9ZC8BHzRNObFnyTfw3h3PUjqkHjigZY+
 L4iyZ+OuodXyX6l4JBJKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Qlngv37PWvk=;4Q+hujGdSyRvyM03ZtjiFooDToc
 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
X-Rspamd-Queue-Id: 18C481F8206
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmx.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[gmx.de:s=s31663417];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2884-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmx.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmx.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deller@gmx.de,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gmx.de:dkim,gmx.de:mid,localhost:email]
X-Rspamd-Action: no action

On 3/2/26 21:28, Sasha Levin wrote:
> Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> lookup table in the kernel image so stack traces directly print source
> file and line number information:
>=20
>    root@localhost:~# echo c > /proc/sysrq-trigger
>    [   11.201987] sysrq: Trigger a crash
>    [   11.202831] Kernel panic - not syncing: sysrq triggered crash
>    [   11.206218] Call Trace:
>    [   11.206501]  <TASK>
>    [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)

Thanks Sasha!
That's exactly what I often needed.
I've just tested it on the parisc architecture and it works nicely.

So, I'd appreciate if it would be included in the upstream kernel
(with the memory optimizations others already suggested).

Helge

