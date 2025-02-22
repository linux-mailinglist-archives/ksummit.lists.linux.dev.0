Return-Path: <ksummit+bounces-1832-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3F4A4094C
	for <lists@lfdr.de>; Sat, 22 Feb 2025 16:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90F307AD8CC
	for <lists@lfdr.de>; Sat, 22 Feb 2025 15:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81631C84CC;
	Sat, 22 Feb 2025 15:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VruC+j+X"
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30681C84B8
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236624; cv=none; b=TEElvJ33N9zSqCVLDB9KqNM+A/3Q82TPjNp01XJ5zOxosuFR5yXkxQu0tBgl8TGc0ojm+YS+ek/HlnLM8RuXkr04+q5zd/nkrBXkbmw3spq7G82Oqq/6LwJfBNQQNWepIEl9fb7GhLxG2HyDlsOCg5iWiHPNl/NJftXk5Fx6R2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236624; c=relaxed/simple;
	bh=jUXRRryCAkCVWDk2XF45KApdOzwiOOcrGOcuA6Zi1+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlHuxdCCrDJdGYVXILpc+o0yDH/oFFqtExkxzP+9aRLxKXqcsQbzPGpISZ+scgthP+IdVgJy0bofD+bARfTW4akrOhz6jKi2pb2OyDEsV7xLjb2Jt1kYXQV0XfrQTsdOg2xuw1ok9MGDOeI6U8CGaVw4hS4YIkglbsECOPUq+C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VruC+j+X; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-7c0bb7328fbso322683085a.2
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 07:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740236621; x=1740841421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jUXRRryCAkCVWDk2XF45KApdOzwiOOcrGOcuA6Zi1+s=;
        b=VruC+j+XG4sJS/Ix3Gy28Wd6lccfPj1sMifO5CGJiY8EwS4vT6NTqk85uO0kUXGmbR
         JCpZumRGo2RyUyY1hOkYi757ynfMreqqVLkEe4YRVOyVajmpcPjy/RiVdmKfMKMWLafi
         PYFj0aUceHEMcTKWuEVhuhboICzsbRZ6HbxuT0f9WHFW+I9aIy2nbfgLFMCbDvIQ1hzH
         XFg7ebxcq59JnuRgFwuPFibJr5zxhiU8g+c5CrC/1bY/9+ASheKljCNwOvWHoP4MYiUa
         YWDtN1w7pgQ4sNukMP1PNRwP3F4dlf4B7x7N/bYie1hbKF6bC340y3UcxC5WrP+d3i8d
         WRUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740236621; x=1740841421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jUXRRryCAkCVWDk2XF45KApdOzwiOOcrGOcuA6Zi1+s=;
        b=N7lK9El0UoLS72e4bSF1hWUXzGXWF1R7UrbL5Aun12XFvonStjAcYnHaYiYxtERPLf
         LI9JWmKWVW/MixT5roy25mkMjryG6EG6xbAOmHM6QDBBdPQic8uCan3A/FgPdxiUdND9
         cclotRoUjANW4f2KDtQksDC9FhMT7YjrynXVHYveE2bJ6lfdPF9GBrb28ZhAv17WrqcG
         D1tU3NNEXG/QnsRSQh9m3fEgYS1u6WFBZ/mKnm0ClpmhP+BvGD3ikm6G+Mk5bCIgaqET
         cLrC6fGhj3hl9rlDlI2jiCgPogGm4ne+MhggONfuT9cg8KbR67ApVQY3QhjxKm2NvnOT
         v96Q==
X-Forwarded-Encrypted: i=1; AJvYcCU84BnTO0aZBKnbRpEumqV0OX92dr15E56U/sQiiSSpiR3ryA2v2hA64h9/rz3mEt5Q1xLbFSMZ@lists.linux.dev
X-Gm-Message-State: AOJu0YywxnFLLfi4uTD3iG51VLIDfnHmELzKsj7p4Tp+Y+fi2Nd4Rdnc
	Zd/rNuqXOCLOnyuu1sHcO0sZRRuy4ROoYqg889+sgrSmqxuqpGh52TJ/JmQmcF6GuQ5AtOOP8b1
	4C6MRGSubSA80ZRK3IXnUb8nj1qY=
X-Gm-Gg: ASbGnctrOCOZtIuSNNC5do/uEiS9GOWYbEI2d18iIlOAnnDIFGMRIzhpogT/GETwgQm
	r6mj8006jqqOSVuuv5dRyMpziLJWsf1tbbrdqKq4RiBbL2Ce1K+kp5nfkiuxrpB7D9JNP84CWSr
	iVvkaI/MPP
X-Google-Smtp-Source: AGHT+IF5/dRnick9sCywZfv2H3f5TyOgoxmRTWx6ApvJ88OgJSey1x5l6lnKGxOLgf3ZaMijgmeZk2SvQGN7eEKkszo=
X-Received: by 2002:a05:620a:1a0e:b0:7c0:c47e:e124 with SMTP id
 af79cd13be357-7c0ceefa1femr953262185a.16.1740236621541; Sat, 22 Feb 2025
 07:03:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
In-Reply-To: <20250222141521.1fe24871@eugeo>
From: Ventura Jack <venturajack85@gmail.com>
Date: Sat, 22 Feb 2025 08:03:29 -0700
X-Gm-Features: AWEUYZnyEHVM6QnSBJQpHdoTp1Y_e_SHNI-v7ysUE-mK4wj1z0Kk34j8sa-yT_g
Message-ID: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Gary Guo <gary@garyguo.net>
Cc: torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 7:15=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Sat, 22 Feb 2025 03:06:44 -0700
> Ventura Jack <venturajack85@gmail.com> wrote:
>
> > >Gcc used to initialize it all, but as of gcc-15 it apparently says
> > >"Oh, the standard allows this crazy behavior, so we'll do it by
> > default".
> > >
> > >Yeah. People love to talk about "safe C", but compiler people have
> > >actively tried to make C unsafer for decades. The C standards
> > >committee has been complicit. I've ranted about the crazy C alias
> > >rules before.
> >
> > Unsafe Rust actually has way stricter rules for aliasing than C. For
> > you and others who don't like C's aliasing, it may be best to avoid
> > unsafe Rust.
> >
>
> I think the frequently criticized C aliasing rules are *type-based
> aliasing*. Rust does not have type based aliasing restrictions.
>
> It does have mutability based aliasing rules, but that's easier to
> reason about, and we have mechanisms to disable them if needed at much
> finer granularity.
>
> Best,
> Gary

Are you sure that unsafe Rust has easier to reason about aliasing
rules? Last I checked, there are two different models related to
aliasing, tree borrows and stacked borrows, both at an experimental
research stage. And the rules for aliasing in unsafe Rust are not yet
fully defined. https://chadaustin.me/2024/10/intrusive-linked-list-in-rust/
has some commentary on the aliasing rules.

From the blog post:
>The aliasing rules in Rust are not fully defined.

Other blog posts and videos have likewise described unsafe Rust as
being harder than C to reason about and get correct, explicitly
mentioning the aliasing rules of unsafe Rust as being one reason
unsafe Rust is harder than C.

One trade-off then being that unsafe Rust is not all of Rust, unlike C
that currently has no such UB safe-unsafe split. And so you only need
to understand the unsafe Rust aliasing rules when working with unsafe
Rust. And can ignore them when working with safe Rust.

Best, VJ.

