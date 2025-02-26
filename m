Return-Path: <ksummit+bounces-1939-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70AA467B2
	for <lists@lfdr.de>; Wed, 26 Feb 2025 18:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3ABB188720F
	for <lists@lfdr.de>; Wed, 26 Feb 2025 17:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEE33224B0D;
	Wed, 26 Feb 2025 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PURuY/CD"
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005DA224AFE
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740589928; cv=none; b=Is7FmRpqgvD3sMjbR4ok7kAtzvJCyhfMs141iPhPJ8sY5qnfH/WZpjvm2rpRKTyyNj2ehwp/Rq6CzNPBZqXJC+ztXevlA7znLwTEgSiWUWNslMOlK5i4HrYRyEewNSBmU2qsgc1HLxmO1UMR3Lj/UUBlA4108JS6ppLRa1E1sUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740589928; c=relaxed/simple;
	bh=CKmL45MF3D/cWpj4NBs+BRN2U4392XMuvZPpdtIhJCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BpqlzplO99ePbc3NJWlRoJ/249PbSnSyLHQ9xI5pY4yM5wAfO4rXBV3JxhaYfwEEDW7at4dNU6wIgfY0RTh81WdrETacI+9drQ63gU/9bG1oYHiy03tDoighDIJzzc4POnhfIG8Dvc1mJQQoeX863wkBikaXKb1MLkFlIlOifc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PURuY/CD; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fc29ac55b5so20322a91.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 09:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740589926; x=1741194726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0++ssa3KklqvkS2+TUnBgIYo9/l/jr1/yCcC6gaJdo=;
        b=PURuY/CDSZFemW2Y5nb+jh0/PcpQfRzQ+eb1q2lZ5kdUMkDyNDmjdziEpwsrtA7mIy
         GTs+JdYmxVOQ5D/RjMkcKFRn0q9shqxRn66x0O5ZAx+7BbDKQSscYq0Ssn7k5H+m0aWR
         +5a5JU6odZb4SCyLUuGDWtTh6OialqViW9c6cCAvVcAl62nuzn5vwuwLpEdsq7o4ioUP
         ssYo5Z6OyY1Seg0awc49ya1/cqyYsNfjbgzy7EaUXZEVpWI8qP0bfbFV5lhZqEx9eaD+
         h4odqxYEF+Zot8xPLOsppZ9Uh0VLpmtPdjiovGEKuDBX9Mut/49aJ2FMa+P4HIgSMEhS
         ClrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740589926; x=1741194726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l0++ssa3KklqvkS2+TUnBgIYo9/l/jr1/yCcC6gaJdo=;
        b=nFB1WysuFZb6tjF0GDg0PViQ1tNwMZp4aUu8efz1fN53VLoWsvAmBVN6JOOiBCUGfG
         6PtpDB+VdKpQe7tnJvLI/pqyraJ1SpmstDDsV3oBEKJUSFhwgq+9xuOBl70Yu8ISNGpM
         daxLtrck3QnIKfmp8OXJk7qBYzxwJMgIh+6fItKC0os7DKaIBw/TLNjZq1054cEhiNU/
         nNf0yoP5cpy4UcAfDYLt+5aZPg2xY9UdzQiSiitEgaXLHovj1bD8HJolifn6olsKvrOK
         kDFn1jsmxqSF9lLyaaDCf/Gm89RKjXic/3KcnHJJC0ZscVeufdYvETBV7ermmuN1VfNX
         Z2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXNiSd8R2T9abVeugEwfcrlq+yP5iYacDXviY3dl7z3PckJuXc1V9zUWgAU51qrh3egn8Mh5ETj@lists.linux.dev
X-Gm-Message-State: AOJu0YwLV8Ij/r4MgST2jphtKkWF/VjMUj0iDSysPBa+w924TciJ5fcg
	4YcPOYdEPz1w1laIzLrpKExP81LEyGsOMEVimWf1HF0d+qMjONYDV/Mm9bZv+CMSmSoq8wHzIx/
	hKUv/MOWpR2x3ZHIbMvTLz+Ml6To=
X-Gm-Gg: ASbGncsHsAWWhgZfUqumMyEkRd2x/13fdyvTQL+QpEdJB5A40mZL7WJcAm6rzdSrRBM
	OT3WpjMa3GiCcn/rQcJqeiaCnhUwfHBBnVdu3lRMqakPboA91uTH+OctqksoHkOooxBkf/l15Ri
	wDWSAPybk=
X-Google-Smtp-Source: AGHT+IEviEOnl0xfL1S6XtApmG3cyllnaIXmrMVdQ23v2GjWKaie4K7gOcLYfIO7VYOXTJQe89W5rpmlXx8fxPCy2w0=
X-Received: by 2002:a17:90b:4d0d:b0:2ee:6563:20b5 with SMTP id
 98e67ed59e1d1-2fce75d75a7mr14266904a91.0.1740589926114; Wed, 26 Feb 2025
 09:12:06 -0800 (PST)
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
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <5E3FEDC4-DBE3-45C7-A331-DAADD3E7EB42@zytor.com> <2rrp3fmznibxyg3ocvsfasfnpwfp2skhf4x7ihrnvm72lemykf@lwp2jkdbwqgm>
 <CAFJgqgS-SMMEE2FktuCUimdGkPWMV3HB2Eg38SiUDQK1U8=rNg@mail.gmail.com>
 <CANiq72mOp0q1xgAHod1Y_mX86OESzdDsgSghtQCwe6iksNt-sA@mail.gmail.com> <f2bf76553c666178505cb9197659303a39faf7aa.camel@HansenPartnership.com>
In-Reply-To: <f2bf76553c666178505cb9197659303a39faf7aa.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Feb 2025 18:11:53 +0100
X-Gm-Features: AQ5f1JomtzOpefkwmwH6LSFqWj2xlKQ1O2v116mBDbHDQFWRjp5xrC2xazyfcR0
Message-ID: <CANiq72=_krDaFaF4t2oCEQQGqO1Z7RrjxD7ZRSL79A4FCLwi=A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Ventura Jack <venturajack85@gmail.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	"H. Peter Anvin" <hpa@zytor.com>, Alice Ryhl <aliceryhl@google.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 3:26=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2025-02-26 at 14:53 +0100, Miguel Ojeda wrote:
> > On Wed, Feb 26, 2025 at 2:03=E2=80=AFPM Ventura Jack
> > <venturajack85@gmail.com> wrote:
> [...]
> > > Exception/unwind safety may be another subject that increases
> > > the difficulty of writing unsafe Rust.
> >
> > Note that Rust panics in the kernel do not unwind.
>
> I presume someone is working on this, right?  While rust isn't
> pervasive enough yet for this to cause a problem, dumping a backtrace
> is one of the key things we need to diagnose how something went wrong,
> particularly for user bug reports where they can't seem to bisect.

Ventura Jack was talking about "exception safety", referring to the
complexity of having to take into account additional execution exit
paths that run destructors in the middle of doing something else and
the possibility of those exceptions getting caught. This does affect
Rust when built with the unwinding "panic mode", similar to C++.

In the kernel, we build Rust in its aborting "panic mode", which
simplifies reasoning about it, because destructors do not run and you
cannot catch exceptions (you could still cause mischief, though,
because it does not necessarily kill the kernel entirely, since it
maps to `BUG()` currently).

In other words, Ventura Jack and my message were not referring to
walking the frames for backtraces.

I hope that clarifies.

Cheers,
Miguel

