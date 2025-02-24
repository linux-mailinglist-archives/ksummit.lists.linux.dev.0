Return-Path: <ksummit+bounces-1870-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D3A419EB
	for <lists@lfdr.de>; Mon, 24 Feb 2025 11:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D3FD97A805D
	for <lists@lfdr.de>; Mon, 24 Feb 2025 09:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A56802528EA;
	Mon, 24 Feb 2025 09:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqdZ8qt1"
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCDA250C07
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391070; cv=none; b=VSVNHNlX7Fxt39kqZi0zfMrjCxDlRW5VNSy8MoHjO/gW+uo6L4694bTxJT3/Ki8dhSI9iQbmwm/CyIvUQJfzou1PpcPx8VjPMUBXfr0OeSczQXoiwswnUKVPyia8m5od5C9u/ho+BjDgUBTzx//UcJBugH12nIyA+XuTwnXvN44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391070; c=relaxed/simple;
	bh=s8OaGW99ppf2hWfSu+1vSCOUtbexOxS5yMUTM4p0Bc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bhpBjfPqQowPl2w7y8pOm/govDFNjneHEFAg6olrPPQqz2y0IvnZrJpnIrDAgRQphitIWH+BnvvJ2wez4ZfXi2M3XeXlZHOmwVGvWjZ4bvIs55Cf8Vab/NSDyoaO2Z7kHFUXcvbV/Q4ubhjKGMTZub8snh8EjcsZC6ESXw3LJa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqdZ8qt1; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7c0a974d433so494938885a.1
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391067; x=1740995867; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE27tvEZr9+4KilAFSdeS60EG0pfp9dwkIWt3ppECpg=;
        b=QqdZ8qt1xv8Gl7vPgEXBTlK/mQ4OVoLmzeP5fcAWrjYSDMAaLNePasLBltoL6D19Te
         erDAuJY37xZ+m1Of9N/6tfHJKTZ0/t3bqRobn+2rA2Pyr2kCqCnrQ9UnLA1XhhlFjrmr
         KSBTJFoz/aQszbKWy7JaenycgoFUQwBXZWSxhZhqepj0Ve5zo+nYb+BOTM6pHTIqAasJ
         9plnbqt3mFAaZGx0fb9+qa0xQsI3VcVEaUgEg0ywkw0rB/cxO6E701m9xAJKajtkTkb4
         UCPMrUtfqhVcJbnsIS84WTcFLaVk0wtAuVQERntyIZvU9FM+/2pH2ExHL/adNWzopINd
         tf/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391067; x=1740995867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EE27tvEZr9+4KilAFSdeS60EG0pfp9dwkIWt3ppECpg=;
        b=Llc7N1q1PzcxtvXLVSCONbg0kgfdFp5WHvVAcmCs+NN8oQNKDEMtYHJXTeBgw88BGm
         fmZwmlV2vr4EWpp0jbbCWvSRoz/V4BND/x4WhSM2QhibHAuqVO+nTuXpA52a87NDoKuc
         YNGnpkCAEtHzcXEyNZbA0oLJW5UBRSC6BaNvOfqpFmMpN7Ys2LIEimszBO5ae3eddmsV
         sJniPNPEi5CvkpEyBEk+Cqf3zbHlJOph21wXdzq4srShwtgwheo3DUhUd4Q4dA2Mn1zT
         GoXyok/8TTpE44Oo7/7uKxCMMhsFAX4tJZKbnK9/Dn4LZF7oP3chEJSq79uN6KJFw0WY
         sWXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkOcXp8txRZ5Hl3PDxPqMm1yK/DW7nFwf8AoyOepQby4xGw610udDl3RHS37mGdiHoJa3YQl1/@lists.linux.dev
X-Gm-Message-State: AOJu0YxoY7wp6OlmFxQ3wheHk/7svfcBSOoqTiH7Za/Ny1dgmsGh7AuE
	WXbkmxu7WQu430z7p1Z070l9OEZTFvIHB9mUCMucLasvR0PbluoQn1KKRhoy0pB95Nf/cFqTmsP
	XxOtiBVNnJBvgr/XCpCQmBZosfHs=
X-Gm-Gg: ASbGnct0MzlkDTy97+ndugBr8860x3zT9O5mMZuX8c/BUzjaWNq3qZLUZA1fOoHeiRW
	SEyQRrKmPrVfjDVKuhhRJYGqI5s00FhSmH34EEE64AsDg+1gswTBcYtwiffI05ldIP/0HS+1X+C
	KVSnzXK2vV
X-Google-Smtp-Source: AGHT+IEiyTlMxnXD1UshSUQEKFq+P4LKtaQ419LnEHYH321oIBTcL/NjQ/kVZ4EfJbLVh4mLO+rdrNOxdDxtei5gAEg=
X-Received: by 2002:a05:620a:1a18:b0:7c0:a944:c22b with SMTP id
 af79cd13be357-7c0cf118597mr1720922085a.15.1740391067228; Mon, 24 Feb 2025
 01:57:47 -0800 (PST)
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
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com> <20250224002745.7d7460a7.gary@garyguo.net>
In-Reply-To: <20250224002745.7d7460a7.gary@garyguo.net>
From: Ventura Jack <venturajack85@gmail.com>
Date: Mon, 24 Feb 2025 02:57:35 -0700
X-Gm-Features: AWEUYZkXEmHOLDHI6rOFs3YyFgA2bH0xuZYKDQwMN5FBqg4lzIlviFarR_mQuDA
Message-ID: <CAFJgqgSNjF=LfrCNTH3GdYssXz9YG-AeCtpibejJ7Ywtx0m3HQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Gary Guo <gary@garyguo.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 5:27=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Sun, 23 Feb 2025 08:30:06 -0700
> Ventura Jack <venturajack85@gmail.com> wrote:
>
> > - In unsafe Rust, it is the programmer's responsibility
> >     to obey the aliasing rules, though the type system
> >     can offer limited help.
> > - The aliasing rules in Rust are possibly as hard or
> >     harder than for C "restrict", and it is not possible to
> >     opt out of aliasing in Rust, which is cited by some
> >     as one of the reasons for unsafe Rust being
> >     harder than C.
>
> The analogy is correct, you can more or less treat all Rust references
> a `restrict` pointers. However it is possible to opt out, and it is
> done at a per-type basis.
>
> Rust provides `UnsafeCell` to make a immutable reference mutable (i.e.
> "interior mutability"), and this makes `&UnsafeCell<T>` behaves like
> `T*` in C.
>
> There's another mechanism (currently under rework, though) that makes a
> mutable reference behave like `T*` in C.
>
> RfL provides a `Opaque` type that wraps these mechanisms so it
> absolutely cancel out any assumptions that the compiler can make about
> a pointer whatsoever. For extra peace of mind, this is used for all
> data structure that we share with C.
>
> This type granularity is very useful. It allows selective opt-out for
> harder to reason stuff, while it allows the compiler (and programmers!)
> to assume that, say, if you're dealing with an immutable sequence of
> bytes, then calling an arbitrary function will not magically change
> contents of it.
>
> Best,
> Gary

In regards to `UnsafeCell`, I believe that you are correct in regards
to mutability. However, if I understand you correctly, and if I
am not mistaken, I believe that you are wrong about `UnsafeCell`
making it possible to opt-out of the aliasing rules. And thus that
`UnsafeCell` does not behave like `T*` in C.

Documentation for `UnsafeCell`:
    https://doc.rust-lang.org/std/cell/struct.UnsafeCell.html

    "Note that only the immutability guarantee for shared
    references is affected by `UnsafeCell`. The uniqueness
    guarantee for mutable references is unaffected. There is no
    legal way to obtain aliasing `&mut`, not even with `UnsafeCell<T>`."

    "Note that whilst mutating the contents of an `&UnsafeCell<T>`
    (even while other `&UnsafeCell<T>` references alias the cell) is
    ok (provided you enforce the above invariants some other way),
    it is still undefined behavior to have multiple
    `&mut UnsafeCell<T>` aliases."

The documentation for `UnsafeCell` is long, and also mentions
that the precise aliasing rules for Rust are somewhat in flux.

    "The precise Rust aliasing rules are somewhat in flux, but the
    main points are not contentious:"

In regards to the `Opaque` type, it looks a bit like a C++
"smart pointer" or wrapper type, if I am not mistaken.

Documentation and related links for `Opaque`:
    https://rust.docs.kernel.org/kernel/types/struct.Opaque.html
    https://rust.docs.kernel.org/src/kernel/types.rs.html#307-310
    https://github.com/Rust-for-Linux/pinned-init

It uses `UnsafeCell`, Rust "pinning", and the Rust for Linux library
"pinned-init". "pinned-init" uses a number of experimental,
unstable and nightly features of Rust. Working with the library
implementation requires having a good understanding of unsafe
Rust and many advanced features of Rust.

`Opaque` looks interesting. Do you know if it will become a more
widely used abstraction outside the Linux kernel?

Best, VJ.

