Return-Path: <ksummit+bounces-1879-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D25A428E1
	for <lists@lfdr.de>; Mon, 24 Feb 2025 18:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B9018891BF
	for <lists@lfdr.de>; Mon, 24 Feb 2025 17:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F290426563C;
	Mon, 24 Feb 2025 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGXTCJoZ"
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com [209.85.167.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF81265CB9
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 16:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740416278; cv=none; b=kLDjJG3LCRg555xkz/1aX7XV+0pUv5GWPqA9+VwcQkJ33MThko4qrFl8GK0M3c22kw+lFh4GNhD+zGdNB9dtBeA2O4j7GWmWSBSi343ryl1rnKvHjmBsveCF6buH3UlBt/uoEpCUaxuE4oq+wHkw+nwh1lBctGj8tpusGLvQd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740416278; c=relaxed/simple;
	bh=9AkYuCDxcIMGop0F0nXFLogpfd+Onp8GeWGOnM+by0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e0qXmuX4rT0p9HPJIaYrc0yDHJqubGLpafFN3nwRN4oA3No7Y9YqqYaL3VdeJBipYR9J1YLgF8YdhS2q5U4YVV8PL4XTQeSqy1Su9oqVW+O0+XjzadfVbB07dnbCL33bDMZ/4Bpz+Z1KRYzTgwunBaLMEXWITqN/MO+eealN/IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGXTCJoZ; arc=none smtp.client-ip=209.85.167.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f68.google.com with SMTP id 2adb3069b0e04-546267ed92fso5411428e87.2
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 08:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740416275; x=1741021075; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yFjW1zH+gD+0Z6S7sAaI1nnRNP2Mxs8668OLM/EkQk=;
        b=nGXTCJoZx50XCjtuv69t6GKWzUqnWZOUaDPR30s3ogPD/prSz387GY+yJLVaDdkAlb
         qsWRvfQTUWQPO/94vBOuGd2fzL+g8iAwauAaQvX+7stfsNslFBMvMwLXNfSEIFCkH4oo
         XzFA9e5StXhvb2SMYcpfVtzappeFW7KSRJjgQrdboQC5uh4lDNCactZdDpAaXnaQdz4N
         qFsNpnGUxkmGL/wO6EmickjtV5dfcsvprhw1/PV60EIjYqnHEAI0prO7Sxe2QYvuHDhO
         4aFhtYtlEPYhmiQGx44XKOa9FB2iuLeKIgnsM5v4xDN226hgyShwlWooJ8r2KaT3Subu
         jRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416275; x=1741021075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+yFjW1zH+gD+0Z6S7sAaI1nnRNP2Mxs8668OLM/EkQk=;
        b=dr97laiLn4AoV+zL2EzUnOd/EdLgbYeXiO1I4+nq/d0hEzr0UorX1jvdUPiX0FHDre
         ps9Qwos+sO3ITvqS5+4hnfcZEvIGex79ok33OZzD834xhMT0Sy+K1btfmNNYwfoX7NDn
         z5lEhjMKAIqVyAN80oY67ekSJZFLGhtoxGaak3x2kRSxi40zYu5XXbssyyzFkcnNh+B4
         70igVUxDpZkR1JFnCU9JSEgknCsWtrtS4MdFsYuL1j+19COmvvprQuoDe2H3N10yTDrP
         8f8fzbKrs3+lgXTF63vOybW9psCdTeO1P2UsNQHFCi2ljo9e+1be2uw/LmFnsnaHbZD0
         d6jw==
X-Forwarded-Encrypted: i=1; AJvYcCWysKhUBb8KHtbS0c1gqzXQJDqukYN54DB5J1Gzotv+sr8M0gHEMuPJ5l1oNfyZkNOw79mfckZr@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6um3/M3x8GSUNXmtg1LxzEnE3BUbJZzWW6EPOfBJmZ/BkVJzD
	XRH9X4TOg0WhfW+WUAnHQ+qTEkczJf5lsK6V9dcc2UJ8b2Y3PxGkfI1BZ9nRHTDzXRDdD0pAV47
	fPTN+7G8YuuyEjSAssrYIgdpBE4BGYi0X+BY=
X-Gm-Gg: ASbGncuoJI99V2iLPMV+S0BnMMdgtdXhLeCQRUWEhhOtcqtGTQHHBqSDgAAfJnO2Gkn
	VlZLmxeqLqsiwQd0/3cG/zOfCq/v9IMpDqSHwEfXrazGm4o2Pg/XCNsdqW1M//vkwIL9tEb5NN6
	1ta54KnnGs
X-Google-Smtp-Source: AGHT+IHP2RFtRRFgPClAmeR5ehEd+2cm9UqNvHlbg+2L/TpXnPY8RInvpcCNChJWYqXNBEYE3uOLKncWh/I2IMVw2Mw=
X-Received: by 2002:a05:6512:3da2:b0:545:fad:a757 with SMTP id
 2adb3069b0e04-54838ef8a13mr4353079e87.29.1740416274400; Mon, 24 Feb 2025
 08:57:54 -0800 (PST)
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
 <20250224002745.7d7460a7.gary@garyguo.net> <CAFJgqgSNjF=LfrCNTH3GdYssXz9YG-AeCtpibejJ7Ywtx0m3HQ@mail.gmail.com>
 <4cb1d98b-f94b-410a-be90-4394c48bdbf2@proton.me> <CAFJgqgQ3P81-iskGu9R+T=c=wyB2K0JqUhx+Gj+6mkYeY8-ORg@mail.gmail.com>
 <a4b79751-f1c8-4476-98a5-c59fb2e545ad@proton.me>
In-Reply-To: <a4b79751-f1c8-4476-98a5-c59fb2e545ad@proton.me>
From: Ventura Jack <venturajack85@gmail.com>
Date: Mon, 24 Feb 2025 09:57:41 -0700
X-Gm-Features: AWEUYZlW-Dr9Wj_nVWLIHYCRytgyFrZfCz9iJ9M6YRwrculG79d-CGIFN3fd43o
Message-ID: <CAFJgqgRdiQ29bWvwsu11yokZb4OFF7pYYUU=ES6CYv9847KgVg@mail.gmail.com>
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

On Mon, Feb 24, 2025 at 5:47=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 24.02.25 13:21, Ventura Jack wrote:
> >
> > From what I can see in the documentation, `&UnsafeCell<T>` also does no=
t
> > behave like `T*` in C. In C, especially if "strict aliasing" is turned
> > off in the
> > compiler, `T*` does not have aliasing requirements. You can have multip=
le
> > C `T*` pointers pointing to the same object, and mutate the same object=
.
>
> This is true for `&UnsafeCell<T>`. You can have multiple of those and
> mutate the same value via only shared references. Note that
> `UnsafeCell<T>` is `!Sync`, so it cannot be shared across threads, so
> all of those shared references have to be on the same thread. (there is
> the `SyncUnsafeCell<T>` type that is `Sync`, so it does allow for
> across-thread mutations, but that is much more of a footgun, since you
> still have to synchronize the writes/reads)
>
> > The documentation for `UnsafeCell` conversely spends a lot of space
> > discussing invariants and aliasing requirements.
>
> Yes, since normally in Rust, you can either have exactly one mutable
> reference, or several shared references (which cannot be used to mutate
> a value). `UnsafeCell<T>` is essentially a low-level primitive that can
> only be used with `unsafe` to build for example a mutex.
>
> > I do not understand why you claim:
> >
> >     "`&UnsafeCell<T>` behaves like `T*` in C,"
> >
> > That statement is false as far as I can figure out, though I have taken=
 it
> > out of context here.
>
> Not sure how you arrived at that conclusion, the following code is legal
> and sound Rust:
>
>     let val =3D UnsafeCell::new(42);
>     let x =3D &val;
>     let y =3D &val;
>     unsafe {
>         *x.get() =3D 0;
>         *y.get() =3D 42;
>         *x.get() =3D 24;
>     }
>
> You can't do this with `&mut i32`.

I think I see what you mean. The specific Rust "const reference"
`&UnsafeCell<T>` sort of behaves like C `T*`. But you have to get a
Rust "mutable raw pointer" `*mut T` when working with it using
`UnsafeCell::get()`. And you have to be careful with lifetimes if you
do any casts or share it or certain other things. And to dereference a
Rust "mutable raw pointer", you must use unsafe Rust. And you have to
understand aliasing.

One example I tested against MIRI:

    use std::cell::UnsafeCell;

    fn main() {

        let val: UnsafeCell<i32> =3D UnsafeCell::new(42);
        let x: & UnsafeCell<i32> =3D &val;
        let y: & UnsafeCell<i32> =3D &val;

        unsafe {

            // UB.
            //let pz: & i32 =3D & *val.get();

            // UB.
            //let pz: &mut i32 =3D &mut *val.get();

            // Okay.
            //let pz: *const i32 =3D &raw const *val.get();

            // Okay.
            let pz: *mut i32 =3D &raw mut *val.get();

            let px: *mut i32 =3D x.get();
            let py: *mut i32 =3D y.get();

            *px =3D 0;
            *py +=3D 42;
            *px +=3D 24;

            println!("x, y, z: {}, {}, {}", *px, *py, *pz);
        }
    }

It makes sense that the Rust "raw pointers" `*const i32` and `*mut
i32` are fine here, and that taking Rust "references" `& i32` and
`&mut i32` causes UB, since Rust "references" have aliasing rules that
must be followed.

Best, VJ.

