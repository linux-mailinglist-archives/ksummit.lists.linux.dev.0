Return-Path: <ksummit+bounces-2869-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEZ+C85zpmkuQAAAu9opvQ
	(envelope-from <ksummit+bounces-2869-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 06:38:22 +0100
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB941E94B2
	for <lists@lfdr.de>; Tue, 03 Mar 2026 06:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C9208305022B
	for <lists@lfdr.de>; Tue,  3 Mar 2026 05:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A42A1DF261;
	Tue,  3 Mar 2026 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaZcc/NV"
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82BF2AD03
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 05:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772516296; cv=none; b=NKziRZsi5VqWDdK3BqdnhvrCPgEg+2+ok+n4FjFKjCmKRXE89IYpf3FYd/854cyIRwxUaYDUoiQx2zrrlak55xQ3kyA5ESk2mqvebtdQ4q45niF70X2sOfLwKvaHam0TA4zIYYCknJKyuZtlCjssoMMfbpUHgRewH/g9upgFjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772516296; c=relaxed/simple;
	bh=nGnyG2rKAK28agcjFXZxIKw7z4EJbUV7GdS+AqZrt+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PzwjoHC8U+YwqcF0fgNfX5bqQylT94X2nAswPJa29sBODtn4ysD2I2/3RDG+P1F6h1GB9usvBfm6C59a8okPS0HQI/SCuLhvck/zhbLWwqYABmeDGOkPSJCPiPRAAnCMurwN3gZY+H5hxDx41UI+/m3oDc9xgAb1uw+AdU0dtDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaZcc/NV; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48370174e18so29741495e9.2
        for <ksummit@lists.linux.dev>; Mon, 02 Mar 2026 21:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772516294; x=1773121094; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpIdZ9Y4OtCFHLn9n/UH21WO8yQvx/FPgACDFVQp4eo=;
        b=HaZcc/NVcZPizey2NR/055i9DiKnOQhboT6qZ9CGS/zqgn84uPGCNyRhC6HuAC20T/
         xaJV1S0YeslAj/BESe9DmrTsdFWm/T5QZNABTEU0m6DniwRkxh7HCJRwghgo7P+cjRZw
         tRofiCrLlXJPuWtmkUgn2HIUtpX3ImLkD/pKPx8KRje2zxARmUBwkxj9WggQUz98QIw7
         fvu1eXm/vJ/8gbarW5OlGsm6Mo6fDcz83v2DZ3W7MqPT2W0bkDT5iuNQMfVcm3A7hC7L
         Vj0zpcUzmWS+k1TYuhiIPG/XZ24xixi5i5DqzdJ6Gc/4wd7X58SZH6Lt7j91LC8SmCgR
         t98w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772516294; x=1773121094;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KpIdZ9Y4OtCFHLn9n/UH21WO8yQvx/FPgACDFVQp4eo=;
        b=Gk1+PM1r7WfsAGPo1ht1O8vypdAaqFEuqAKHCWVYykGgyrbqFcgb4m02se57Mfu6Oj
         phx1BtwgDfxzjGKo+QmJqvPf7qSeckQWbHN3pGQzHJC/x+nEtC/QntLlmT5kotemkOYe
         ueTHnELeu8nr/1uUoDJIX26Qi1iUUiJURGLz6Y7dTOR/UxUeX7kriJVBSZNU9ZavZgdN
         u5wbflkroYp9GBl7FAY7Q8BtdBHiZgp/4UbEyGJwrGruMyVrdcZzNmmKidoUcJ45GTko
         byRcddLAp6QwmXPst3XSg9FYWQPifg1LoGJzwJr0bYuD4J6PNV5/kwxc3zPx7dzsCCkF
         1hAg==
X-Forwarded-Encrypted: i=1; AJvYcCXeEg344r3+nfP0dgXY4UTDjvsUDWdam0IVr7esEgvqvL93uRJTF2lG59vdeVHx9P7zfmLnnygn@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1KtWJkeksnv+Y+yWAXA+ixJ7br+LPeuWdjf4AzwYT34z1CpsQ
	imUzp1po6+7T6U/+hr2Ukyg2xDKfeALbt1JmVAXyAOS2QTOXTAY5ZEo=
X-Gm-Gg: ATEYQzzXX9WnyA8553fV2+tdjlbJQWKy2Baq/eC2HUcXBoiude7xgiATUcnASnW3gwY
	YHgkcIKjWlJIZhfLfXeacH28QVVPnNLSpcHS1CK8U+wx3aRFbNIKfwpi6+2WhJdGP16rbONtXiO
	eAqDHGVFWjTkGzaSk0C+aA5KxddDedQ0OMJ64C7bxjY2kmlohRC0B030i/88QpV9WGQlb+ewCdY
	FmG3vD65U1o27SlcafJqoFkwg3tmdKLg2LWgHY7xVHpsNdSvWNUXP0oHUj2XV8v6bYjBCOiMZAi
	umglbEYnQxTUKOFt8YZ6BJ6jM/OMsevM9lKD5cy6CoK7fjW3ixNQe/3nl91tdaXSIUs2onvYlM9
	f5R7LVy/RyK+MOTpoyEe+m7LkS2POhvhJrDlimtP+bfBVWFCCMGNHcrCt5HBIfvB05yxqmAri2H
	tKgsiO/YgNIqKs04Nm6MyUBLc=
X-Received: by 2002:a05:600c:a0a:b0:47e:e20e:bba3 with SMTP id 5b1f17b1804b1-483c9b9425emr237301305e9.7.1772516293828;
        Mon, 02 Mar 2026 21:38:13 -0800 (PST)
Received: from p183 ([178.172.147.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a25dsm31628240f8f.21.2026.03.02.21.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 21:38:13 -0800 (PST)
Date: Tue, 3 Mar 2026 08:39:36 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: torvalds@linuxfoundation.org, akpm@linux-foundation.org,
	geert@linux-m68k.org, konstantin@linuxfoundation.org,
	ksummit@lists.linux.dev, laurent.pinchart@ideasonboard.com,
	linux@leemhuis.info, richard@nod.at, rostedt@goodmis.org,
	users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302202828.2722037-1-sashal@kernel.org>
X-Rspamd-Queue-Id: 9AB941E94B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2869-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adobriyan@gmail.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 03:28:28PM -0500, Sasha Levin wrote:
>   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)

This is super useful, thanks.

Can the 0x prefix be dropped as well?
It is shorter to print in decimal up to 1 million.

() are just character noise, I'd drop them

