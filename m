Return-Path: <ksummit+bounces-1992-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05257A48729
	for <lists@lfdr.de>; Thu, 27 Feb 2025 19:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E96EE188AD1B
	for <lists@lfdr.de>; Thu, 27 Feb 2025 18:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C211EB5FE;
	Thu, 27 Feb 2025 18:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwwUorQj"
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5707B1B0439
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740679274; cv=none; b=AhKns/ZwOsUm8niFlb0pwC3FSYNsjcTJvG82gsYtzF1k7Z0m5LWkgF+W/2sHWyKDZ6c6+8A/yb6VUdHjtbgavR5TlYFVT7GqRom8vks5urbaXil/1Hu9vTQTRZo8WI5y/gOsSMArce0enwf0iXpbTxaaEKR4h5nmjJixriiTFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740679274; c=relaxed/simple;
	bh=GiSZjH82D/MUaCubZKcQoptOrPFmx5LV+oTUDQTeVxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6lSZwbE8nhE/IdsK9VPoZCrO85z+r9tDXYIFMx0vr0yveh+Fonr5Y2TsqxCOEZK8Ru3FtN/qr33/NIvprY68x1n8QZrsK06G9B4TWS5rLd0MX5VBTRZdvKpKNpPA31FBe37mdg2Y+TlbXNL9KLEsyMAInYDg08hIVCVaxWatWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwwUorQj; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30b8f0c514cso2099111fa.2
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 10:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740679270; x=1741284070; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0o/mfaqlPkxYSZ/nQyeOcTy2xeSV0yUhY5MQIdEddiU=;
        b=mwwUorQjPC0jLGKoxcFheVtdtYfUXULXnApOQHSn+dCib2ccZnlUYoyChTdiiJeQPb
         A80stWa0U9I5r3w9ASfJh0LA+B7MzG5ajUg0Y1jmmvYlHd6nuY9NK4Rz0KmwPWkAU/BX
         AsKtxzAmj6qNOssq7F9uFWhqdj+b42ocg106tfRwAIojQ5lGLOGr6TlfzRl1HF+xXZrW
         aC2aIfbjcQ7LvaTtBUWnGe1+f2ZpItHeWinEq0vYavITKKNl980KNvllksBSM9UWDo1e
         tZB7NELlPXLL7iwBcTLnHoJCtaYdh+iB1vzMeisqHzG6sj/fqQuQhBg0pKxduALe9mSY
         R4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740679270; x=1741284070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0o/mfaqlPkxYSZ/nQyeOcTy2xeSV0yUhY5MQIdEddiU=;
        b=YtA56UhgfYhS5mvpO4HOGpF06ANkAwgYPbmoTiJecjpf3B7bO67e5mu4ApPIZZNs1y
         5D7wc58zeR0PaYH6f2YwQ99GAlueSfx9u4gLNilapRljSZbtRLn3EZ9PR+xTIxmQuNIB
         uQ69qmLQ8vWvo/5FQh00y7RQoFiU0NWEcgvRUV+VhhVXtQ6S2ggIO1xH7WrBFmSahR0g
         1m/XLCkD8DmNfSF3HetBLmst/zn7NpE9Zbys794J9B1iORODPjscmnWmHyLqKfwv3BCZ
         k0EwRJroO0rNHERjV1ckDVUFG45sPGb6+yZyYreH7iFbPeSnV1jC1Nn9QMU/cvQWbomT
         iJPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhGgPNmSinFKMJtVLHdBHqz/2VKWbSiKUQUqMZW3fpSztsy+K98k9jartFkNW4IRFODVE84vnq@lists.linux.dev
X-Gm-Message-State: AOJu0YwVSZVVy5EUquvYqdAcIvRFrvIy2ugUSQvSaXY82GowLiXFdYaQ
	z8YP+JjVPM/5Zx8fCc2GY4IKnItqvF2xXHAC/16ePzHXFYB/osxvI9+v8nmsJNlkQdoH8MtAFJ/
	7upQoVngRTeumTi148svXmK6UJLo=
X-Gm-Gg: ASbGncsc4Lh5v59t6mGyEHcuQUtQ1ELgQXGA9novbt5QAaEtGev9q8vSCIJm+t9rM6v
	5kFKiQA+GBG09E5V4Bd0XanYgodZoJKLCJX1FJX7S/gu3pOb+nydjMsdRIG8JQSmPo/49S/yWcH
	CUUZi2yXXu
X-Google-Smtp-Source: AGHT+IGddreFNVOzoUZapNkQajljSYHbz2UsY8f3WD3AmwAySMFtTBjwjOH1OT5w7/u7dL9VWeCPC2MbQAMZOy+ncXY=
X-Received: by 2002:a2e:7813:0:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-30b792d683fmr45802831fa.28.1740679268723; Thu, 27 Feb 2025
 10:01:08 -0800 (PST)
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
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <09e282a9c02fb07ba4fc248f14c0173d9b19179a.camel@tugraz.at> <CAHk-=wjqmHD-3QQ_9o4hrkhH57pTs3c1zuU0EdXYW23Vo0KTmQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjqmHD-3QQ_9o4hrkhH57pTs3c1zuU0EdXYW23Vo0KTmQ@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 27 Feb 2025 11:00:55 -0700
X-Gm-Features: AQ5f1JoiIR8LzflO5KrxyB6x2yLat_eBAQ5tFqFf5YTstbEnwtms4585RZGDqbU
Message-ID: <CAFJgqgTkzb3MeQrkbkd7Kuw0_JGs7VFj2xJuBaKTpYgt40fTJw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 10:52=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> So "safe rust" should generally not be impacted, and you can make the
> very true argument that safe rust can be optimized more aggressively
> and migth be faster than unsafe rust.
>
> And I think that should be seen as a feature, and as a basic tenet of
> safe vs unsafe. A compiler *should* be able to do better when it
> understands the code fully.

For safe Rust and unsafe Rust, practice is in some cases the reverse.

Like how some safe Rust code uses runtime bounds checking,
and unsafe Rust code enables using unsafe-but-faster alternatives.

    https://doc.rust-lang.org/std/primitive.slice.html#method.get_unchecked
    https://users.rust-lang.org/t/if-a-project-is-built-in-release-mode-are=
-there-any-runtime-checks-enabled-by-default/51349

Safe Rust can sometimes have automated optimizations done
by the compiler. This sometimes is done, for instance to do
autovectorization as I understand it. Some Rust libraries
for decoding images have achieved comparable performance
to Wuffs that way. But, some Rust developers have complained
that in their projects, that sometimes, in one rustc compiler
version they get autovectorization and good performance,
but after they upgraded compiler version, the optimization
was no longer done by the compiler, and performance suffered
from it.

Best, VJ.

