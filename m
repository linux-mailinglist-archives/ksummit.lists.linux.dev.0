Return-Path: <ksummit+bounces-2960-lists=lfdr.de@lists.linux.dev>
Delivered-To: lists@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a92yFUDzT2oNrAIAu9opvQ
	(envelope-from <ksummit+bounces-2960-lists=lfdr.de@lists.linux.dev>)
	for <lists@lfdr.de>; Thu, 09 Jul 2026 21:15:12 +0200
X-Original-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F235734D52
	for <lists@lfdr.de>; Thu, 09 Jul 2026 21:15:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=AiysdDCw;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "ksummit+bounces-2960-lists=lfdr.de@lists.linux.dev" designates 172.234.253.10 as permitted sender) smtp.mailfrom="ksummit+bounces-2960-lists=lfdr.de@lists.linux.dev";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1238030E9921
	for <lists@lfdr.de>; Thu,  9 Jul 2026 19:08:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FD53F6C50;
	Thu,  9 Jul 2026 19:05:13 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2803EFD30
	for <ksummit@lists.linux.dev>; Thu,  9 Jul 2026 19:05:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783623912; cv=pass; b=DIkEo3jBCCcO2hm36H6tE77t1zed9uW+uiJDx2uYyveCDbgQFl+fLDNHbg4/n4pvFPWWO/AOZPuySVB865lZQB4g6FVlFtiQg+xiu3r/e24fFSW3PP/kBCFGXap3kQjSHhyCRZzU7zXik+HhNnQ4a0ZTgsNUhBNVG9LiQW4kDAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783623912; c=relaxed/simple;
	bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ICpqgwrm+m4VYOtJgmFGhelf6PVUQ9MoSKkSq53I/rxMrTznbC51nDbZgerOgzan6xvWNryPIrt8YDCVZmHUVROAfTTSfMOxctxSGuoz58T64DzG8TRMWEOCXIcimC+mVjlfs2v1RM9UuH5tHFAsQxeafvAZCsajyM2eQ1m2hrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AiysdDCw; arc=pass smtp.client-ip=209.85.216.46
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso48913a91.3
        for <ksummit@lists.linux.dev>; Thu, 09 Jul 2026 12:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783623911; cv=none;
        d=google.com; s=arc-20260327;
        b=QhfVaO+rPYxx1E7sS2HplpOB02Xl7z1CO5gNE77wNxFlCkcgdwj8OfkIYsHohWPY+m
         FCFJCKDmQ37ljczZaWewJsiH5D2l7C/IYLT+goldXBF50DBbxmc/qQpy8etKSqN2pPfe
         AZ6obACJPSumVG98m+9KPlGbEQMWOVW9wDGAfGgJryyYtvk3WOr2B3/PJspOXjb4TwO7
         YpobnQ8IAgX0fgbtySl20IIEfCNCsS+oii79DybvezVG1L0w3GSzOsDeWqSwq2xRowYo
         SGfA0UXjRjm98VYT3pXjzeFkTggx4fgpg6Mp7GUfYb0aXe1RYqzyrOGZ0Vi6ft+6uMEA
         BBkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        fh=uEZ/Fjdg59+YcmtYkx7arUk6pIRMfxOx0Lb8cRf/zxU=;
        b=PpPO3zuodynsSdDa/79jVax9J5w80QK3s0u55JXXtSqdkASxcHUaOK0DdO0g7aoKVM
         1UBcyhPpon8/TdkWXmkTgzsoyNYphzS+dRtNPggE9yC0Kw7Vh0yUsKnnDaHcu/+5rCHb
         QGSMizVNjt7ufnbZvgtqLgjrhN3/TLXSb1tS7TfVYgbtohYDuPo9HVXkOpljZL0h8IzM
         54ZOWCg061IQoPD3cGvpM6gvg+icsspnkX4hnOtlwyn99cto2+h/LXwb0tolIMC8ERol
         B7Zc+6y3ffv9/Y1YLTdw+sda0f8eB7rS3rU2HlBtj4lsUMQITAMlJVIBIre09fJcT1my
         BWKw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783623911; x=1784228711; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        b=AiysdDCw0h3Kq03gO3aEin3W+QKUgV2ZyzTHzqJSaVgQ5RSpWjDhjl4Jp5NRHpnU6Q
         V7qPzIhAm6HAGDkE8mpZa1EVfau6Wie+9gGeWUjhacmV2UxzMcb6TjyxGTAl+W77kFQG
         7fbGQhUX6e1ByvUzTKaZYCtQF3ZB3AYbh2WlXK+M19ubg8T48eQ7/36zb2res0tAZPyg
         yzNNTkSb5gcntDJkESmA51NMjEBzzEVAQqNO0yqD30giNrZnqHQFgKgJUHiZGoyk2XKh
         qgrvQETBXgUKSEkI6WCvGQu6znJTlZW1xvGz9GYmsVBwmUaiprhmqIpuBeAKVXevDklR
         Zx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783623911; x=1784228711;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNhSqHrQHIbTEVu6bWLeszyYUIIxqj9fqyC2oMDPU1k=;
        b=R3akOIAowETn/JWduMV5f1aIcUtaoffvXC5EwJp/eOR6QHclvSP45L57T3Lh0f0HcY
         beGwdauSfIdvNGiRMZml+CKIXaelTkrlEDzzHBhFqJbcitWJDJgvnJ++VzWplamhg1ii
         +NFFybdReKyqCu6bLOFF4npNYrlXp3Q8mcFVSszkiXxXfLRBaTpoVyiLRIJd4DJeVI/Y
         V7eil4JWRvNCRsJZfwDw3MCgx15pEJKunO4PTOptXzoBWKCOkRSiPQcSlEd55DQ9Wqi3
         MDdOi6C4ICIspJ3qeXsKUgYg93E48w0ESniY8O5f+Zyc3lyRjr9t2GxeXmqEug6PF6x4
         gDmQ==
X-Forwarded-Encrypted: i=1; AHgh+RqdGVjTLVqWgvySdXFHcmjZE/kQh5Bw9qiJxJGxBX43DhSyxk/K+Mm1QeeeCWm7bVFHS8lQGqws@lists.linux.dev
X-Gm-Message-State: AOJu0YxIEeFthvyHwzsf2AYSt9skhdFIP6BeLrgbG/F9diJrfIVX1ywE
	7JftOQgjotOXuSaCUkl/Kq0z/6nLf7KlWBLQi4qd/+oyCnBdXvjSHRaHs7VXlPS9ENBMqY8yAuf
	mtxAisM5U8swuSIQGqUFCXzO8nm4OIO4=
X-Gm-Gg: AfdE7cnnIa22dCZJ6Rm3MHYXImavGAjFkXqse8Cg7M08NalB1IBrWZxZXQWeY9alX9t
	o+BXaMcpEmc5dA+J0+5AaZncGsjShCZIVCSU5bGO0eKrkwJA91dbPuZolOiAVKOqhzhJ5L3cyqc
	tIIKw29Hsad6uCZWzdiz3xmk2IE7HcCvTZG2RstwNjZNz80orsO5BMLNC7pfLyUHm+iKD3zDzGB
	OHvcf7kGl2Q7uw1ui+B5M3crtjDbpydKimF54I0WrBLn/Ph0QvwrxDVCM9x2BKlNMBvswSvyWDw
	tOpYv7yGB9/y1/D6l8wsZ+BMufRqCqCEir60OL4q7o1F0R98uz9bnqUC1OYG7R78t2DOPV2m3dJ
	KlbV1k+mqftF1v0JBJ619aXw=
X-Received: by 2002:a17:90b:58c6:b0:36d:b30b:14ed with SMTP id
 98e67ed59e1d1-38a1f1de22amr4261994a91.2.1783623910451; Thu, 09 Jul 2026
 12:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <akKBVsFBro_4QM74@casper.infradead.org> <202607090956.6381F35@keescook>
 <ak_WOfpcaZIuh99t@casper.infradead.org> <CANiq72nQ=BmM0GRVrcmXHfE6VqD2hsssxqJEE40TirDiy82+wA@mail.gmail.com>
 <1F884E12-63DA-4A65-A811-C2D40FD9B5F7@zytor.com> <CANiq72m+YTQ7NG4m8h7ho+GCkx_1Gdk6WuAeZ+KAORiETytWig@mail.gmail.com>
 <AF2564E2-7537-432F-B6A2-4CCE8F746BBC@zytor.com>
In-Reply-To: <AF2564E2-7537-432F-B6A2-4CCE8F746BBC@zytor.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 9 Jul 2026 21:04:56 +0200
X-Gm-Features: AUfX_mxlayaag3-kx4SR0EgjgdrsJvDbEWYl_EdK7BAhqdu5ATkc3V5L2mm4aHo
Message-ID: <CANiq72n56wPBgRfSr0nrDj4XGF8_rnGm=axsvNvhOG1=1_NuSw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Implementing malloc
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Matthew Wilcox <willy@infradead.org>, Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-2960-lists=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,ksummit@lists.linux.dev];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zytor.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F235734D52

On Thu, Jul 9, 2026 at 8:50=E2=80=AFPM H. Peter Anvin <hpa@zytor.com> wrote=
:
>
> All of the above. It has been a concern of mine for a very long time.
>
> It's a really big asymmetry versus the C side, and at some point someone =
is going to want to implement a core subsystem in Rust.
>
> "Two Debian stable" is a blink of an eye in comparison with the stability=
 criteria that people are demanding for gcc/binutils.

I still don't understand what is the concern you are referring to.

If you have a concern, then it is because you think of a negative
situation in the future, no? So what is that situation? i.e. what is
the issue?

And, yes, quite a few people have asked about implementing a core
subsystem in Rust over the years. If it cannot be an optional
subsystem, then one will need to wait, or convince everyone else to
change the kernel policies, or convince major distributions to
backport the toolchain, or similar.

It is what it is -- after all, the point of the exercise was to take
advantage of the features from a new technology. But I don't see what
the concern is.

In any case, that discussion seems orthogonal to the allocators one.

Cheers,
Miguel

