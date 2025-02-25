Return-Path: <ksummit+bounces-1903-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC0A4506C
	for <lists@lfdr.de>; Tue, 25 Feb 2025 23:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCE183A9E5E
	for <lists@lfdr.de>; Tue, 25 Feb 2025 22:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7CB2248BB;
	Tue, 25 Feb 2025 22:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PTfSWhHM"
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09242224884
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 22:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523524; cv=none; b=AMDTgIrFopZdtrwi9Traw4pmhSs07fCHJZYjPJFzWd3d1W8h0AvTlKyd3ojTPhw0x5X/3zRcG/55alQWcJwqvMLAV5A0FOQpo3Q2p23vgojJLat4HdS4aHgupkLPrrdpV0Kag8rsdWCS07QJp8felMIEGGp8T6dF2c/CTWpJT3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523524; c=relaxed/simple;
	bh=2994Cx+0BEvrnRr3hg0JQaVKoaoIXzC1cKTbjQ8vkWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pup72/U6pdkY+UFK4v+ohYC35JVs6CrlCBCq1zbYxKHk/h0HoF9TqbvmwhVz27gqs/Isdg3dhOmwL6RqCbe4Ql5XvBsK+ZWgpFxi01V02ry7p+IskJSDCJW6y1HPew9/ThFtUuEWvA3V1XxvOmVRlJhRigpF3GeIPOgvIo03FHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PTfSWhHM; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fe5d75ff8cso474490a91.3
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 14:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523522; x=1741128322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BREjBIu3LhC9CjTs4V1jX9U/z2RLLn2jYU7SiNJkd7A=;
        b=PTfSWhHMeRtQvtMmdAi9R/PC1VhWIHPWV87v4m5GKYKnRk+DzPq2weoUnL7V9I4dlr
         azgGt06AcwYRTmeEhFFvt19pNdAOb8816qbQ9pHCjqehVxEGW8fXAfjb6My1u/YqMUmZ
         PBZL0H90LMtDHgHvwxpdLGqtf7keP+XQvwcufVTH0sQFw5t1zxX/r6XVyh59a8rCMfgO
         hyULuv3+OLKTSbV12JPTuqgl2s2hHFVIDY8JEjk035gityAPYWACy/t1D+3B4jNdDM4B
         VoNpUsl5L8wQpNqQbC4zTN88xTTDprRjwp21/QIynOhBAnSUJ5TU4WTJh+3vFM+usOMz
         4qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523522; x=1741128322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BREjBIu3LhC9CjTs4V1jX9U/z2RLLn2jYU7SiNJkd7A=;
        b=K2erP03InrwHUg/aWchAfXvNIaGGLtlYGYb0ljWuSdDhrfYOJ+u9mUvKeU8okGZ1FE
         5D3TW0EQJAVpngq7gfxXJkPF3KfGP4FueaHpidvTu0IN33F4HREelb558xuRGhdU12GH
         e4aEmdJah5yznH/iUkcwPIqREinj9xQdONeUzlrTVOiNURGzpkBpJQ/d8uh7OBFpxLd/
         EgAWKH1JXd4+MZotToVz5QL4JAuyxkoAMtBxHDMjdh51WZfGgbtq5FkLwZ1j6HFO40oP
         M0qiYYZa2GkUbV3z6nbK11M3K+RTHsv4HklASkas9P2YH60umtPlAECYKIgx09Z+pQR0
         DnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZgcSJKL+S+IDj5NcQjWbPEglV8hYhHlTOhUBLwnz74tSrj+/RKWXpUVvLddvEAPGR5tl8cFt@lists.linux.dev
X-Gm-Message-State: AOJu0YwhKRUxMrQqswXNOvmZRa84nL833nt5PRzulj2TLiRoSbYBkSXv
	+1bubGUCkt5MppT5bGQx9fuWXBLYs8qfcqlpbd4IBWlCPP++tjKpWeJrVjtRBlOr6FzilUPTvwX
	U+csKLXiTTevp8DeJsMglzMMharQ=
X-Gm-Gg: ASbGncta6WqanGkHA2GL2Zk9P/qDJh6Vsu59OtjYYknhoE4f3LDV+1LoNCfz9vXZMVK
	+FsvkG07L/5Rw8QBeqEN+KAym8AN1ENgCQyWp1BcJrQSOLcEAPBTtFlbY5q/B5p0VupD1HxrDrQ
	ySm1LWO5k=
X-Google-Smtp-Source: AGHT+IHW/s/T1gk//zFpUU2//2FctOurcPUs7k9tldIQX5WWLhusS9PC80LFS5bIUyvczF3LpCt7Z9oB8SZfEuTLt8k=
X-Received: by 2002:a17:90b:4c0a:b0:2ee:b665:12c2 with SMTP id
 98e67ed59e1d1-2fce769a322mr12045299a91.2.1740523522212; Tue, 25 Feb 2025
 14:45:22 -0800 (PST)
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
 <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6> <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
In-Reply-To: <CAHk-=whGY2uYcXog8kmuAAAPJy4R84Jy9rEfXfoHBe-evmuYDQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 23:45:09 +0100
X-Gm-Features: AQ5f1Jovuvs9MoeS3e0E3JJ3UTqjDjDZQtBXriL-HUMRHDG6UIjWV-N8PidE8Qg
Message-ID: <CANiq72kSdPvh81uOm=N-=37f7NT7udRV-PozfO2pcfbT6aaWyw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 9:25=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No, that's most definitely NOT the whole point of unsafe.

There are a few viewpoints here, which can be understood as correct in
different senses.

It is true that unsafe Rust is supposed to be used when you cannot
implement something in safe Rust (be it because the safe subset does
not support it or for performance reasons). In that sense, the point
of unsafe is indeed to expand on what you can implement.

It is also true that `unsafe` blocks in Rust are just a marker, and
that they don't change any particular rule -- they "only" enable a few
more operations (i.e the only "rule" they change is that you can call
those operations). Of course, with those extra operations one can then
implement things that normally one would not be able to.

So, for instance, the aliasing rules apply the same way within
`unsafe` blocks or outside them, and Rust currently passes LLVM the
information which does get used to optimize accordingly. In fact, Rust
generally passes so much aliasing information that it surfaced LLVM
bugs in the past that had to be fixed, since nobody else was
attempting that.

Now, the thing is that one can use pointer types that do not have
aliasing requirements, like raw pointers, especially when dealing with
`unsafe` things. And then one can wrap that into a nice API that
exposes safe (and unsafe) operations itself, e.g. an implementation of
`Vec` internally may use raw pointers, but expose a safe API.

As an example:

    fn f(p: &mut i32, q: &mut i32) -> i32 {
        *p =3D 42;
        *q =3D 24;
        *p
    }

optimizes exactly the same way as:

    fn f(p: &mut i32, q: &mut i32) -> i32 {
        unsafe {
            *p =3D 42;
            *q =3D 24;
            *p
        }
    }

Both of them are essentially `restrict`/`noalias`, and thus no load is
performed, with a constant 42 returned.

However, the following performs a load, because it uses raw pointers instea=
d:

    fn f(p: *mut i32, q: *mut i32) -> i32 {
        unsafe {
            *p =3D 42;
            *q =3D 24;
            *p
        }
    }

The version with raw pointers without `unsafe` does not compile,
because dereferencing raw pointers is one of those things that unsafe
Rust unblocks.

One can also define types for which `&mut T` will behave like a raw
point here, too. That is one of the things we do when we wrap C
structs that the C side has access to.

Cheers,
Miguel

