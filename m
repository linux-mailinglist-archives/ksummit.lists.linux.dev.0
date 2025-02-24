Return-Path: <ksummit+bounces-1885-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F9AA43080
	for <lists@lfdr.de>; Tue, 25 Feb 2025 00:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A6F189E295
	for <lists@lfdr.de>; Mon, 24 Feb 2025 23:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F123207DFF;
	Mon, 24 Feb 2025 23:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSGRaQeK"
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FEB4430
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740438267; cv=none; b=NmeTbKodRjWL394GHNO4NmwyU8wJBY2GU1V1jSS0Q6skRu3FHe2uP4t1Dksy1rISCcMzsEeygPlwskt4H1oBnG8lHJApirhKZBS4DaJ1pWJ0fAonvqS7EPtWsoEvFpKs88NUXZCtBVLIPEyodS2wv4G2ln91TdRVHHCFcoj18Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740438267; c=relaxed/simple;
	bh=9dolYcrAbvw6zVWOc0wIyblpS+7dFxmtgKlmfHND2C0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL6jnRO9rBHtNRGW3+sNfyfFi1VEmexkE0hfiQd92pyRZJpOn0ROS9EgWN5ub1vcT8l22bfF4XrU7AQ64UlC6n5tdHoqbukMdO3AEmDl5C2lQKt93SOFe56wYBnfHwOhHFXA7aI3SybBSp0lVrUy2QeR39cbDGj7p/swM0+nt1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSGRaQeK; arc=none smtp.client-ip=209.85.167.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f65.google.com with SMTP id 2adb3069b0e04-5461dab4bfdso5997787e87.3
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740438264; x=1741043064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bX2vJHkSIfnPYXDLQCf3MUVX+uxwLZX1jGt0RGQn/JM=;
        b=ZSGRaQeKNS2LNGBjOP0bIhw16ybhwiEFIqlzC5grFHQECmL16xSM5VLFr4SPOy4/at
         taT0IhjnqDLz+DVfM40rPtzYNttGT1luQX4DlDOKUv7DTd0UprnHNnOVktNQnzfQevjd
         LRHKRspRn+ULlFfQU+uYvve9s1E03gKQUkX/sBFGCTJCa18AJzQ2KQqoWL7pg5+5bUD4
         kH3iqNpsDdVSK3LNMnby57WbR+m8e6BmXz02FaY6qyj/ztDorLXZGr5inOGv1JAJX/bn
         R7jBRLvK2bhY7psfRxwjLcJ161K//vzZATDdzam/SK9UJgE43l0fWgOTd1KDPxr8ee1k
         zxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740438264; x=1741043064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bX2vJHkSIfnPYXDLQCf3MUVX+uxwLZX1jGt0RGQn/JM=;
        b=oxZdT/M8GkKXZ8127Wk8SEj7jJAX1AmfIcmq9sLxD3EWDNsom9S5jZS94Ge6OZ6h+Y
         qzUbdiyRJ7qVy3flZysjP7tC7KfBzh1inYdzhypCtEc2BqqX+o1ffY0ubMKTehVnw8M+
         DBd8quhX5TToBHB45mfqZCcAM1rLWJRmFEfnvFlWOS27V/Wcpae1v5p28e4/orgHx3w0
         uCPKd08vcmA4UEL0kokzchNtTh2esY3DnsYnBtLDFW70os7zPFlOm4zcJXh1tzA7HEVd
         39+oYwNRW8FBQXdsf7sSdocwR/SkFKeOgBBBDaFUS0yZ7ZQrJyyZz1wHce4SyoUB7G0G
         PTGw==
X-Forwarded-Encrypted: i=1; AJvYcCVzf0MZf6fs+qXAP3bDLqrR4kQaseprncXVxMUTCAzosQfq+4gD9mDSc03nCrwZIqD1E44IqOoq@lists.linux.dev
X-Gm-Message-State: AOJu0Ywxn2zMC8FeaIeDpx+8QJo553012LluIltakM8YszWSI6d3KALO
	gzdD47cri2JmfkpvZiG/nFK2T+feHzh1G5l0jj6oY04GohRaHd8RvaspmM1YkpsMN2UPhLjdN1f
	+lW6Isr9v2Ebv7DmaBAgg8+NCkxI=
X-Gm-Gg: ASbGncumhu8SD5KQjgltaK/SrZRlKMCV9aVs1gJ1hmTBJCI4aMrtcriPuvwhULRc/ib
	+u/HQKOTRJpt6yjQ7866pm9AI6qH8rYHVsvHpTA4bJnug5l28J0z0dQFSWYRgueuBPWC3ecxRCj
	w8LihHxjgf
X-Google-Smtp-Source: AGHT+IFFJhRE3Al38mb61oLdXyI6FGFfcEO4jXtiTTGVk6/pwT9T82qqzausAEPp4MaJUT8MU6L1pcwLsqha9GhCWTM=
X-Received: by 2002:a05:6512:108b:b0:545:bf4:4bc7 with SMTP id
 2adb3069b0e04-54838ee9139mr5750419e87.19.1740438263970; Mon, 24 Feb 2025
 15:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <20250224002745.7d7460a7.gary@garyguo.net> <CAFJgqgSNjF=LfrCNTH3GdYssXz9YG-AeCtpibejJ7Ywtx0m3HQ@mail.gmail.com>
 <4cb1d98b-f94b-410a-be90-4394c48bdbf2@proton.me> <CAFJgqgQ3P81-iskGu9R+T=c=wyB2K0JqUhx+Gj+6mkYeY8-ORg@mail.gmail.com>
 <a4b79751-f1c8-4476-98a5-c59fb2e545ad@proton.me> <CAFJgqgRdiQ29bWvwsu11yokZb4OFF7pYYUU=ES6CYv9847KgVg@mail.gmail.com>
 <c05cb400-969d-44a1-bd40-9b799ed894d7@proton.me>
In-Reply-To: <c05cb400-969d-44a1-bd40-9b799ed894d7@proton.me>
From: Ventura Jack <venturajack85@gmail.com>
Date: Mon, 24 Feb 2025 16:04:11 -0700
X-Gm-Features: AWEUYZm3FQUc7v5ynrtRFpLc3fAluhwUO3IC2tdoYT596U8GBpUsWxMZSKRfhHM
Message-ID: <CAFJgqgTs3h5YagY1RU2AZf3wKWKfXiPTE2mx7CuWyzN=ee-k3g@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Benno Lossin <benno.lossin@proton.me>
Cc: Gary Guo <gary@garyguo.net>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2025 at 3:03=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 24.02.25 17:57, Ventura Jack wrote:
> > One example I tested against MIRI:
> >
> >     use std::cell::UnsafeCell;
> >
> >     fn main() {
> >
> >         let val: UnsafeCell<i32> =3D UnsafeCell::new(42);
> >         let x: & UnsafeCell<i32> =3D &val;
> >         let y: & UnsafeCell<i32> =3D &val;
> >
> >         unsafe {
> >
> >             // UB.
> >             //let pz: & i32 =3D & *val.get();
> >
> >             // UB.
> >             //let pz: &mut i32 =3D &mut *val.get();
> >
> >             // Okay.
> >             //let pz: *const i32 =3D &raw const *val.get();
> >
> >             // Okay.
> >             let pz: *mut i32 =3D &raw mut *val.get();
> >
> >             let px: *mut i32 =3D x.get();
> >             let py: *mut i32 =3D y.get();
> >
> >             *px =3D 0;
> >             *py +=3D 42;
> >             *px +=3D 24;
> >
> >             println!("x, y, z: {}, {}, {}", *px, *py, *pz);
> >         }
> >     }
> >
> > It makes sense that the Rust "raw pointers" `*const i32` and `*mut
> > i32` are fine here, and that taking Rust "references" `& i32` and
> > `&mut i32` causes UB, since Rust "references" have aliasing rules that
> > must be followed.
>
> So it depends on what exactly you do, since if you just uncomment one of
> the "UB" lines, the variable never gets used and thus no actual UB
> happens. But if you were to do this:

I did actually test it against MIRI with only one line commented in at
a time, and the UB lines did give UB according to MIRI, I did not
explain that. It feels a lot like juggling with very sharp knives, but
I already knew that, because the Rust community generally does a great
job of warning people against unsafe. MIRI is very good, but it cannot
catch everything, so it cannot be relied upon in general. And MIRI
shares some of the advantages and disadvantages of sanitizers for C.

Best, VJ.

