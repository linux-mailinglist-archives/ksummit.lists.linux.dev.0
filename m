Return-Path: <ksummit+bounces-1878-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3461EA42827
	for <lists@lfdr.de>; Mon, 24 Feb 2025 17:43:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2034117011B
	for <lists@lfdr.de>; Mon, 24 Feb 2025 16:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43FAA263C66;
	Mon, 24 Feb 2025 16:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="EN2J0sOF"
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133072036EB
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 16:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740415371; cv=none; b=SeXv9sOyjx08YcyKPKqf5+D24TQE91hGxq0mch5ND00KgcpmUploLK2LV6sw56TDnyloj3lm4uVjw1rRW4JO5rw9ajaqewBCvc/hGq20PHmiHcynQR2fxVKSP3Vkoevt+Vaed6hjNwoK6wzXSWW1V/vTBAssbkE21p9rTW5PebE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740415371; c=relaxed/simple;
	bh=pPtB5iBTpjPdvvBag0ikJrB3ubm7dMsqxX600w4wRLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seQ1XKOGS8YlX6T6hbz8OWBC3xO9qSpPNfsTe4G6gNHoQ399TPSrQ9uXeeedCeCQFE3kYAL3YStFwGDdc3DfEu8TbGJpw2osDp17c8hr4sRN0VwmER6zhC7ffLD8S5tz9Ds5xhEap4LGY4KvAC+jdqdaplhU11qJU1u6t6jf+ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=EN2J0sOF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4399d14334aso40704215e9.0
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 08:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1740415368; x=1741020168; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Lf+NqEZsMFJBEN4P7MtP2hG4hE4jH1JzYMV0SWzaCc=;
        b=EN2J0sOFMAfVeqhsUSRda5NVYheMXUX3ziEetk4zSRpXnCUZbp03fP5pbf5fgOpW0R
         VEQKEM8cXC9sLRHWb/X1NOkFarSo2QYxPPfD6U/u/QzRe6fdUfUvpCgSPtv5uGJ/KlOM
         NASTtkMQ0w+pF4TSVJPSJe7I/NXNN9iR1sQ9Ysksd2MiewDSfjh7SI8zwZuku/nQ98Lu
         7Et8YGHr/m4+eLAMSwdkN9LxDh5CFQRLlsp6sUy1j+PE4I22KDWxwPDmW0jl+9M66Rjy
         /Et3x+kuFe/Hw0pFC9RCy+nzihrwCxCGKPY59V3G6ZRj8KuJ/OE5dpylC6VRbO4CEqmO
         fKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740415368; x=1741020168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Lf+NqEZsMFJBEN4P7MtP2hG4hE4jH1JzYMV0SWzaCc=;
        b=ifu8qO6At2DxYsLlAK0tbDTpCigrniPPbmH/maP9NWsFMfx3naL5Z9wFgZxQ5RLuw4
         G5p9pax3niMHp1FAV0UVcZSa1Hb16EuOqWaqhmJU+JPEaetiTgSJq7XKXKReED+6xqJd
         40u0rpfbChc1CboQ3cJbR1VfqfYVHlY64EIQvgux4Z3aXG+aH4pY1yJtKEB/4dRqRkL3
         aiHEjctyENu8TxZsj6awtcnYzML3Qiqm11/LFDWkQ4G6BpDYzX64P5aUuv3MPvztWIfs
         jM6uzujTcTQrYoeiUwCGHFhSvBKHS0lwGpxVa6WcjbmnLNbM5/ryr51BQBu7ZkM5p5MA
         nqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu51SDopKgOA0HYsp08uyfQQqu8jCpGvwiaEwhyz1QliJ/NvS3WU8pH5R/qgt1/yeM9W21hySi@lists.linux.dev
X-Gm-Message-State: AOJu0Yx42BEhiGQV6xBFku+D+PV80ujIu/HmMgDNJAhiEoJEkrUGmwoT
	K60Ie8HAAjskYn8l216Z5mIZ42xQqBHzCyJrdSCcIbfVsRqMOvbjnbOtlPjYI8yKiSfjQ1WeySN
	o211sS6eN5XMZ5bU7VJsc205nbmQ=
X-Gm-Gg: ASbGnctm+mZIcrgxuGnbcDpwLwSiLO78A2EbfCZNDOhKSGN/M4JMMxwVHFaMo2mKBMn
	vDkX75ntM5j3PjPVLE1WJi8IX8AjUY4dkmIfErRJAc0jgkUflAX1AiLYF2nCBTavTPcpxcihdtz
	VtjB0k3JE=
X-Google-Smtp-Source: AGHT+IH3gB4+t4ey8K9foQhFPpwmzLnBNia3/nkgoWIlj9aPcrWrDOKgmoNT1IpZOeCmBWbMuz+dZb9s8u6tQkQtXEU=
X-Received: by 2002:a5d:64e8:0:b0:38d:deb4:4ee8 with SMTP id
 ffacd0b85a97d-38f6f0587b2mr11976583f8f.28.1740415368087; Mon, 24 Feb 2025
 08:42:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <20250224125805.GA5729@mit.edu> <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
 <CANiq72mfQk_ViHJ9Y_rU0etS8XpORvZUNMc5m2iHL=pQDiVFSg@mail.gmail.com>
In-Reply-To: <CANiq72mfQk_ViHJ9Y_rU0etS8XpORvZUNMc5m2iHL=pQDiVFSg@mail.gmail.com>
From: Philip Herron <herron.philip@googlemail.com>
Date: Mon, 24 Feb 2025 16:42:36 +0000
X-Gm-Features: AWEUYZkmtXLg4bnwYTgYkY70WPSl5ESlM86vRJLwZsePt1goNhhMQ9aQBGEtYX8
Message-ID: <CAEvRbeo3QujuvRxjonhzqjQbO5e1_ut0LOSQsukH1T5vx=jzuw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Theodore Ts'o" <tytso@mit.edu>, Ventura Jack <venturajack85@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>, Antoni Boucher <bouanto@zoho.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 24 Feb 2025 at 14:54, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Feb 24, 2025 at 3:47=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Mon, Feb 24, 2025 at 1:58=E2=80=AFPM Theodore Ts'o <tytso@mit.edu> w=
rote:
> > >
> > > Hmm, I wonder if this is the reason of the persistent hostility that =
I
> > > keep hearing about in the Rust community against alternate
> > > implementations of the Rust compiler, such as the one being developed
> > > using the GCC backend.  *Since* the aliasing model hasn't been
> >
> > I guess you are referring to gccrs, i.e. the new GCC frontend
> > developed within GCC (the other one, which is a backend,
> > rustc_codegen_gcc, is part of the Rust project, so no hostility there
> > I assume).
> >
> > In any case, yes, there are some people out there that may not agree
> > with the benefits/costs of implementing a new frontend in, say, GCC.
> > But that does not imply everyone is hostile. In fact, as far as I
> > understand, both Rust and gccrs are working together, e.g. see this
> > recent blog post:
> >
> >     https://blog.rust-lang.org/2024/11/07/gccrs-an-alternative-compiler=
-for-rust.html
>
> Cc'ing Antoni, Arthur and Philip, in case they want to add, clarify
> and/or correct me.
>
> Cheers,
> Miguel

Resending in plain text mode for the ML.

My 50 cents here is that gccrs is trying to follow rustc as a guide, and
there are a lot of assumptions in libcore about the compiler, such as lang
items, that we need to follow in order to compile Rust code. I don't have
objections to opt-out flags of some kind, so long as it's opt-out and peopl=
e
know it will break things. But it's really not something I care about right
now. We wouldn't accept patches to do that at the moment because it would
just make it harder for us to get this right. It wouldn=E2=80=99t help us o=
r Rust for
Linux=E2=80=94it would just add confusion.

As for hostility, yeah, it's been a pet peeve of mine because this is a
passion project for me. Ultimately, it doesn't matter=E2=80=94I want to get=
 gccrs
out, and we are very lucky to be supported to work on this (Open Source
Security and Embecosm). Between code-gen-gcc, Rust for Linux, and gccrs, we
are all friends. We've all had a great time together=E2=80=94long may it co=
ntinue!

Thanks

--Phil

