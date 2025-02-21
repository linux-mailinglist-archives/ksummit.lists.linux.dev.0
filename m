Return-Path: <ksummit+bounces-1780-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F8CA3E94D
	for <lists@lfdr.de>; Fri, 21 Feb 2025 01:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0561730B2
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3ADF1CAA4;
	Fri, 21 Feb 2025 00:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icJzk58E"
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66B6AD27
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 00:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098776; cv=none; b=Q7K0Yy2I9aaNNTVPZuFIBUdLdZQRywdvmiGiYDHUjs13w8nlDVklGEz8OTt5GgLvylFV9qxpbAB8LzBH2ojq2dKLhOwfSfIUw6VCUyRuy9uHJ4LN9UVsyWZN8p+roIHm1fAzCo2UQ7d2GLHUSDEwXEcKC1v/2LXj6nTcD2tVUjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098776; c=relaxed/simple;
	bh=aO8Xvx4su+rrOkLBVhdTRpg0nABeS7pNS7fV9lTQ+xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=norGHo+NE5VOsrSMrbDY6Lt4/+4s23q76oR5UcvcvN5iPWF+GDjnGLSrhlrTkS8hhKK3VPPuhfd0utK5wPdK8DWNyubJsobr412HBte22Fcj/U3yrum2dTPkw8R8vcvFeerZUl/SV9M/Y9uE04E7GfIi5p1d5LxM1QtaLzKTHLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icJzk58E; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220ea8ed64eso3923585ad.1
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 16:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740098774; x=1740703574; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxG/RNLQp22AVUKc+QumMOAnx3QaLoDvmSz51dLFex0=;
        b=icJzk58E8hHOzrswTxJ0wGweCGRtaOdgq1VK5OLVcW1/EFXfjmo/OFJ1VbD6NFda2V
         kNuvH4iyhTduhZJdhcQrBPEjXQfxUwRJBRq5tu19ED5QAqq2AmpnC/VkQ6k7ddwp9pFA
         v4hxybB4OQuVlbcGgA6wX3tOiJLgHZtYZxRtT8lVOR0UMjTFA7bpZDdis/SDiTWMrnCH
         06GfNVhIXspMTdqfBg7Vj208/pdY44212dX8DXrSUMaqP8amHNun6luqqhAXDAVhhWTI
         uRj7V/N3g+JnyuZEDTtKHRQBf7japoZeba+ThbXwft/xo9mW3wZR/Lprr9MuAZpecI5m
         fKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740098774; x=1740703574;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxG/RNLQp22AVUKc+QumMOAnx3QaLoDvmSz51dLFex0=;
        b=HeBgmzhzxGcUO1lMEl12DAnlCj3wyKVM27td7WbCvhIqW3eMEmjR2Wxc7JmnTrDxNn
         gsgEKu1nrQlIZfLDjR2sO6oBeJ3M87DvmcRlfT0WTgbnTm8Y81j1K8/2Q6bhnOTuUIbP
         OSUn7ZrmzPvEfECIIGuiSYJnI4M9oC4MatyvXrIdLvtMILF/kkbR0W7DtatPuGZCiRtC
         pxhbUKKcgs2IqXiMUXndEFCmIplsXrqbYE61ejjm/+a98IX0coUVJ2Pzl/bha0Jkq/cp
         2hskP99oADC6kHh50rmbIEF1eZ+vWqeAcVA+2IeKsx14dvliHrU+N9oE5AwP6J5K0IyF
         p+lg==
X-Forwarded-Encrypted: i=1; AJvYcCUqkqaXYCWXkKrMJcIP/iFbeZG3oEO+FBA8riWW61kl+Bmv93B3SqUdSUT/6ISpaVriL+OUy30V@lists.linux.dev
X-Gm-Message-State: AOJu0YyiGZSKX3Pv07QPGmK0VOlYJ7HL/0XWsEmlyxJS+Q/usbdzu1me
	6tfrCNxqV0VnwgueNVmAAuk/oaHwHwE7GX9ss6C8Sxhyh8cDtm+nYeaN01bI3EmpctCZtoScYGZ
	JNjsHxIKs9kQMA7/UxEP0T5HPS7I=
X-Gm-Gg: ASbGncvAEcjGuitR3dU2ABErvifxJjH6jOwnyHrtN9SONYpVriEBDFuupcWnq42c5w/
	aqwc1TlMpTiQ/1S4OE/gR1psMVaqsMyEXxB3SB0l2YrkxhIUUHBJQN7rn2BAesSfia8Ef+Uf+
X-Google-Smtp-Source: AGHT+IGxosJw3SIjvkmueAMZ2sxLNNWROWh+qNp1JsJKSr8xuqLbeZoOcMwOlB3TiXnPGMD4jUzRll2ClxpX6Ejstgk=
X-Received: by 2002:a17:903:2351:b0:221:7b4a:4774 with SMTP id
 d9443c01a7336-2219ff61f54mr7228845ad.8.1740098773903; Thu, 20 Feb 2025
 16:46:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <2025022042-jot-favored-e755@gregkh> <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
In-Reply-To: <b9a5de64fe1ded2ad3111763f35af9901bd81cc4.camel@tugraz.at>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Feb 2025 01:46:00 +0100
X-Gm-Features: AWEUYZl45jzwIAE7pLlufABx1iKVOUGFki2L5DbKNmMd1LqvTb-ZtnMqsJ7KLak
Message-ID: <CANiq72mQ7YafHd6cZWZv27c9ajkF8Kz=F2kYxeQuA2FoGhsmMA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Martin Uecker <uecker@tugraz.at>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 9:57=E2=80=AFAM Martin Uecker <uecker@tugraz.at> wr=
ote:
>
> There is currently no kernel developer actively involved, but this would
> be very helpful.
>
> (Paul McKenney is involved in C++ regarding atomics and Miguel is
> also following what we do.)

I do not attend the meetings anymore (mainly due to changes in ISO
rules and lack of time), but I try to read the discussions and reply
from time to time.


On Thu, Feb 20, 2025 at 3:09=E2=80=AFPM Martin Uecker <uecker@tugraz.at> wr=
ote:
>
> (BTW: Rust is also not perfectly immune to such errors:
> https://rustsec.org/advisories/RUSTSEC-2023-0080.html)

That is called a soundness issue in Rust.

Virtually every non-trivial C function would have an advisory like the
one you just linked if you apply the same policy.


On Thu, Feb 20, 2025 at 4:40=E2=80=AFPM Martin Uecker <uecker@tugraz.at> wr=
ote:
>
> Essentially, the idea is that we can start with the existing subset
> of C that is already memory safe but very limited, and incrementally
> grow this subset.   From a user perspectice, you would do the

As I said in the C committee, we need Rust-style memory safety -- not
just the ability to "disallow UB in a region".

That is, we need the ability to write safe abstractions that wrap unsafe co=
de.

You claimed recently that Rust is not memory safe if one uses
abstractions like that. But designing those is _precisely_ what we
need to do in the kernel and other C projects out there, and that
ability is _why_ Rust is successful.

Your proposal is useful in the same way something like Wuffs is, i.e.
where it can be applied, it is great, but it is not going to help in
many cases.

For instance, in places where we would need an `unsafe` block in Rust,
we would not be able to use the "disallow UB in a region" proposal,
even if the subset is extended, even up to the point of matching the
safe Rust subset.

This is not to say we should not do it -- Rust has
`forbid(unsafe_code)`, which is similar in spirit and nice, but it is
not what has made Rust successful.

That is why something like the "Safe C++" proposal is what C++ should
be doing, and not just "Profiles" to forbid X or Y.

If someone out there wants to help getting things into C that can be
used in the Linux kernel and other projects, please ping me.

Cheers,
Miguel

