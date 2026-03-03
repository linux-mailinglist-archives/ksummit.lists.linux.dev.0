Return-Path: <ksummit+bounces-2883-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEUGCZ8xp2kjfwAAu9opvQ
	(envelope-from <ksummit+bounces-2883-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Tue, 03 Mar 2026 20:08:15 +0100
X-Original-To: lists@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B90281F5AA0
	for <lists@lfdr.de>; Tue, 03 Mar 2026 20:08:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E2ED6303909A
	for <lists@lfdr.de>; Tue,  3 Mar 2026 19:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4FE13D75AB;
	Tue,  3 Mar 2026 19:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP0S0zkW"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A453264D5
	for <ksummit@lists.linux.dev>; Tue,  3 Mar 2026 19:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772564891; cv=none; b=hI9/6MJtv4clbdEKD2cwP8A9rQebh18QC6Pz7WDwksUfLuzmegrECHIx+36zWGAbQoNJUiV5epXrpdj9UlnLMUWJUj2U3eiNigSXFZq+D0NK2+77R5vw5NmAhxdeFMy+hB5AVXeUNZfebQX/kpt5oSPcXmciZ7StLG7Xf4tGxCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772564891; c=relaxed/simple;
	bh=wstWL3hMtCZeU0LkYSNcLs6SPYi72Ui+fqZlxkcdtWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e86wY0+EaqhjIIaRoaKsAqCv/tH1kzc+3xVxFi1ovnnx+6UbdyLy0GJLpFtI9ESbbJZCp20gI5a/AYGLakPl9AS6ferhwLEa9zic4+1nP4Awu+hqikP1xKPbyaF0C87dWsawu1T7yFTKS6y3Q6vjkLE1KUhZEWnQ9l/Jhze3HBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP0S0zkW; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439ac15f35fso3135028f8f.0
        for <ksummit@lists.linux.dev>; Tue, 03 Mar 2026 11:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772564888; x=1773169688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rY3635oPEzxJZabhTyeCA0oxEQ0Oex59aBFHDY9dzCE=;
        b=DP0S0zkWG8S2zOCDkihix3U6k8RCL3qOc8HEuHr9ZLMTsKPyJHddJphP5KXZyQzWta
         jISISmrkKlo7jAvCElGatXDYuCDv+wff7G7NNzEpBdZGzvUcTU4ImrTaYPxqXedj24In
         sa97VhctQeC+ZDOtX5g7cX4d2KqAsC0cNu1NPm5aVlnDgjLYTf2JVA5dDjQ6piXqq8zl
         +29adhcp31nATb41FiQX+L/ZmkNQJYak9gzMkgMKzl5juIDid4uX0uoCcaVApoQxd3c4
         8Nw2oH21gMVP/2ETnFkmF1AvsCVYPSqlojU1sVVQIZDupTm/vl6yIbVspaB761EnZ322
         QHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772564888; x=1773169688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rY3635oPEzxJZabhTyeCA0oxEQ0Oex59aBFHDY9dzCE=;
        b=g6f2GzDJTMyVlt4wjdleBR420JSigJwCYTq594EX2Y3DzUtJFoEiDG58KEuvh03P4k
         FWNP6Br861hEFK/15pI4BOVgEtFME+koLAx+j9XvWdCTKGuluiqk+QMWVlT4fuWCflTU
         hpbIZRpf1JSyUajKS1fs1va4r+oLD6p0zvPeG9wsPSJQLVJFHReXD2wyy/gQcduGgx0g
         2Vmb88/Z0lXhirVVfPKrL6wbZfk/HZOrHyhoeZUNCSq4Kl5WJfB3oRQTGW/oZFoV7SA8
         /wyv1s5cZ2+RcOwiOPl6FRpNnFQ2JT0EZ9tM3A59iXFXCLg/9rxqd8hd6HyfzDrsbB5y
         Rwng==
X-Forwarded-Encrypted: i=1; AJvYcCXCDj2ROSRgiK47pnBnIz4oiV04Gcbsh2TSiBfjvpoR62bUrSAW9/QEivkGrHUHTzGjAzQTDaHO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywf5KgiTd6f+/unDqu30GcCNGoVjkP3P6DoplrY1ctQ69cmseHh
	JfQV9lP3ANGnbZ84Dz8NutG7JOJvUG0yRsRRNgRHordlijH+vire+OU=
X-Gm-Gg: ATEYQzzFzWEh3U/GNsXHDPmr+6YEP2xdGHyaArLzQHRO1+F8eE7MxvwBNUFQPMeet7B
	uusPdqtXpf60Ta2KE+GZfwqsrRa2QNlxmQCOJhdjLGSek42GPkaQnQ41Eqp5fPANqI2JIw7kSbO
	3GJg32j4EZgmm5OgYKYwh+jK/gRrMP/i/bzgmubzhKPBIMo3C0xOTky/ArXHzEUvWBZDznIYH3n
	miAyBE51c9PoAmy4fFfatXbjY8g05F24HpZwv5oUs1AGH+Shym5GUbAPqi1akMu9uvey0L5cLSN
	E8JDvdCh0+eYFVi8npKtTXqmGKnS8FXSFCv/aYGKrls5XhvfYI37/RzQvA7J01LVlzrR+o4sGBl
	1RKrYe5kT2oSLBhx8piZoxBpI6z0bqkLGHx8k4gEkpgMXKfS3YTmPj+qJ8JGncJWSGRAyLhucAB
	nisHWLSAYTcaM+
X-Received: by 2002:a05:6000:1acb:b0:439:85bf:2366 with SMTP id ffacd0b85a97d-4399de3d897mr28937106f8f.52.1772564888131;
        Tue, 03 Mar 2026 11:08:08 -0800 (PST)
Received: from p183 ([178.172.147.242])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439c65e0b23sm499859f8f.32.2026.03.03.11.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 11:08:07 -0800 (PST)
Date: Tue, 3 Mar 2026 22:09:30 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sasha Levin <sashal@kernel.org>, torvalds@linuxfoundation.org,
	akpm@linux-foundation.org, geert@linux-m68k.org,
	konstantin@linuxfoundation.org, ksummit@lists.linux.dev,
	laurent.pinchart@ideasonboard.com, linux@leemhuis.info,
	richard@nod.at, users@kernel.org
Subject: Re: [RFC] kallsyms: embed source file:line info in kernel stack
 traces
Message-ID: <5a65b41f-da2e-4ddf-9eeb-246d818d868a@p183>
References: <CAHk-=wiUOYn4nyWyuvLh1O0j2reB_ec+4DAO06h7Pu36aA4iDg@mail.gmail.com>
 <20260302202828.2722037-1-sashal@kernel.org>
 <7e3ee6b2-62f9-4876-ae1a-d1473d126309@p183>
 <20260303081748.3d48c3f6@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260303081748.3d48c3f6@gandalf.local.home>
X-Rspamd-Queue-Id: B90281F5AA0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-2883-lists=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adobriyan@gmail.com,ksummit@lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 08:17:48AM -0500, Steven Rostedt wrote:
> On Tue, 3 Mar 2026 08:39:36 +0300
> Alexey Dobriyan <adobriyan@gmail.com> wrote:
> 
> > On Mon, Mar 02, 2026 at 03:28:28PM -0500, Sasha Levin wrote:
> > >   [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)  
> > 
> > This is super useful, thanks.
> > 
> > Can the 0x prefix be dropped as well?
> 
> And print in decimal? Without the 0x, it could be ambiguous that it's hex.

Yes. It is ambigious only if someone doesn't know that previous kernels
always had 0x in the backtraces.

> I can see this being very useful when debugging something that causes a
> crash, as it will save me time from cat'ing the output into
> decode_stacktrace.pl after each crash. Although, I can see this having the
> same issue as gdb has with static inlined functions.

It is also useful for _not_ dealing with corporate rpm dumps.

Kernel started to print pagefault in string form at some point,
maybe it is time to finish the job with this patch and even go as far as
disassembly.

	alexey+0/1

