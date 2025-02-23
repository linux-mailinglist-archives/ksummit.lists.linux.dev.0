Return-Path: <ksummit+bounces-1866-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3CA41242
	for <lists@lfdr.de>; Mon, 24 Feb 2025 00:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A0C27A3B8A
	for <lists@lfdr.de>; Sun, 23 Feb 2025 23:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB6720FA94;
	Sun, 23 Feb 2025 23:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSRG3fSZ"
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D0686330
	for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740353526; cv=none; b=D6i7zQPX/qvkeOlqpmGLpsKG8Z7w7J/zj9oeOwIhOkAnCjTvsTGTmJahUCVJJAm5KX1P5g4kva2h/3hIanoRedHqM+SNUhSNFAZ6Z4+0X/xNwbPg3TW2MEjp8k2jdmADFEjqnvui38JbpU9ZrIhigdE5e4OeVUVzx/CCmLf5qrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740353526; c=relaxed/simple;
	bh=9SzP/lO9Oz47p1WDXAFv3n6XXzHZVzHB28BymtT8unw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=T4T/QEf842NsWo3j/YPHhciASBbjTZWAFPLg49hatT369EcXUlGOwtrJoF89tBiApMxnChvO3YlUKiRKZs+ONrEKwQ1o6k63RjTv2i6KlFEfeECo4zR3maJGzbJAhqGREiWwEaNaKMK/25fnPzc0GHi/lfDa6LTVmLbqMOpuEow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSRG3fSZ; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fcf3a69c3cso2979049a91.1
        for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 15:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740353523; x=1740958323; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cY/FjH8ifVrO4AXW9HJfHpvRmVFP8k+aKW+4qs+JeF4=;
        b=iSRG3fSZ+gOUP46Ky8Qp/kPDzJSCf566HVnseRLW2QfdJo6UKMqoPleOZZ4pPfZNPS
         wmEkdxjhUDRV/k7ij/9NCyGyn6/gbQ5zUA/w54vx9SKqaokmnr24YXvtf1dGDa321R/S
         +YTAknMYOl4LL2c17o+wQK/90+jqvx0ocEAa3k4aI94d/Q5ef5DvuA81sEnvCK6bh9kk
         POWICsPDu1uLB3b707ePAO3dXcQ+LBS+hx0x4yQ4fERjJ0d63XdWguPgMcLB3Tz/61iS
         JAK6SQENe+lGf+8mqdBGPWDrpATaE1Hqgk7zQ8kX77GxEWtUCJvhIXffsegYsslHDfb/
         bi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740353523; x=1740958323;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cY/FjH8ifVrO4AXW9HJfHpvRmVFP8k+aKW+4qs+JeF4=;
        b=F3G+eLg594jctogrmg5ipTqFXwEURlnOZH2DNvxyz8+y/RL+XZiJjIY3WP0eTzjavn
         RQzOgXnl76krAqD5I6ZvzyT/FGy6NXT4acHWaBH/D0VHCYkNzpKtpdfpAv8jKIT29e6I
         slYXTb3LJp4/UeZfrYNCmZGvS4oaVy7v0+50ASzm6oxz88BbeRnE9woxmnlHBuQcixyF
         Zza5NaXpiWtdns57x4lj9slQna1icCfr0N2FhxDx+EcTKm+lWUzXfQSuBcoiRsLcyRb7
         rpMNi0Wn83UtStgocNgOeAqUcjjtUGPTDs4qYXn0i2y7hGdoYE3NMhVF5wvjd9fx2oDw
         3ZXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvdR//ohVZaD05pE9BoQx5AaQJemnw1hRxzb2wwOaYZqzEwf+upSl5Tufxxt+V0qvJ7XjgfiS7@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1sFDKe85XOkTd2zVxCJjrk6cD3eOPcLTDhgegrw4HFMfjNlqU
	rFOgP3OMeBIgzYTvMfWImU6Y4Eb1Ze5ySQpuoS06fQnGCwoqZB76
X-Gm-Gg: ASbGncsXQztRWir3m1EZEO2PnF60mk4Ax56B/6P6moCZQQPuVOex1sBOjKTlSkuxUw4
	YosxOmYEO1wdlaPbNYdOUT1/t/l0tgEEiKe6Dgzan37TzvJEXOes/uxq3yIkhOcKniiVkNVAAHr
	3jt8y1xVdH4fd/4UO44RbZFYHD1RP8T8PiAafKBXJS1Ps9TPS8GDmnY3//Xxc3Ztre1vqTTPsBN
	Uv0ogQJgQKOpd/3YBNBVBPbDjyLMsLBEazaoIEbOojg5vePsRva75XYakCY6runayzX/6DzezWU
	BrVVfP9UfBXWk9MEoqJkUpP7iDyeWI/Krqz0CO6PUC2lzfJg
X-Google-Smtp-Source: AGHT+IEZaCc7mLw+80g8Jz/kMgvS1gsDVAhNQEI/CkIHmF8ulm2CfeFAyRuF0ozUizRn4JTp1yw7lQ==
X-Received: by 2002:a17:90b:17cd:b0:2ee:8aa7:94a0 with SMTP id 98e67ed59e1d1-2fce7b04fc2mr16642616a91.32.1740353523482;
        Sun, 23 Feb 2025 15:32:03 -0800 (PST)
Received: from smtpclient.apple ([2601:645:4300:5ca0:1452:c642:288f:cb14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb02df30sm5182530a91.3.2025.02.23.15.32.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Feb 2025 15:32:02 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: Rust kernel policy
From: comex <comexk@gmail.com>
In-Reply-To: <D7ZDF8NZGPS3.3QBMAVC1NTUDM@maslowski.xyz>
Date: Sun, 23 Feb 2025 15:31:51 -0800
Cc: Martin Uecker <uecker@tugraz.at>,
 Greg KH <gregkh@linuxfoundation.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org,
 ksummit@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <E0BD1BDB-0EBC-4E27-9324-7CA70ACE194B@gmail.com>
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org>
 <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
 <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh>
 <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh>
 <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <D7ZDF8NZGPS3.3QBMAVC1NTUDM@maslowski.xyz>
To: =?utf-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

> On Feb 22, 2025, at 3:42=E2=80=AFPM, Piotr Mas=C5=82owski =
<piotr@maslowski.xyz> wrote:
>=20
> I'm sure you already know this, but the idea of safety in Rust isn't
> just about making elementary language constructs safe. Rather, it is
> primarily about designing types and code in such a way one can't "use
> them wrong=E2=80=9D.

And importantly, it=E2=80=99s very hard to replicate this approach in C, =
even in a hypothetical =E2=80=98C + borrow checker=E2=80=99, because C =
has no generic types.  Not all abstractions need generics, but many do.

Rust has Option<T>.  C has null, and you manually track which pointers =
can be null.

Rust has Result<T, E>.  Kernel C has ERR_PTR, and you manually track =
which pointers can be errors.

Rust has Arc<T> and Box<T> and &T and &mut T to represent different =
kinds of ownership.  C has two pointer types, T * and const T *, and you =
manually track ownership.

Rust has Vec<T> and &[T] to represent arrays with dynamic length.  C has =
pointers, and you manually keep the pointer and length together.

Rust has Mutex<T> (a mutex along with a mutex-protected value of type =
T), and MutexGuard<T> (an object representing the fact that a mutex is =
currently locked).  C has plain mutexes, and you manually track which =
mutexes protect what data, along with which mutexes are currently =
locked.

Each of these abstractions is simple enough that it *could* be bolted =
onto C as its own special case.  Clang has tried for many.  In place of =
Option<T>, Clang added _Nullable and _Nonnull annotations to pointer =
types.  In place of Arc<T>/Box<T>, Clang added ownership attributes [1]. =
 In place of &[T], Clang added __counted_by / bounds-safety mode [2].  =
In place of Mutex<T>, Clang added a whole host of mutex-tracking =
attributes [3].

But needing a separate (and nonstandard) compiler feature for every =
abstraction you want to make really cuts down on flexibility.  Compare =
Rust for Linux, which not only uses all of that basic vocabulary (with =
the ability to make Linux-specific customizations as needed), but also =
defines dozens of custom generic types [4] as safe wrappers around =
specific Linux APIs, forming abstractions that are too codebase-specific =
to bake into a compiler at all.

This creates an expressiveness gap between C and Rust that cannot be =
bridged by safety attributes.  Less expressiveness means more need for =
runtime enforcement, which means more overhead.  That is one of the =
fundamental problems that will face any attempt to implement =E2=80=98safe=
 C=E2=80=99.

(A good comparison is Clang=E2=80=99s upcoming bounds-safety feature.  =
It=E2=80=99s the most impressive iteration of =E2=80=99safe C=E2=80=99  =
I=E2=80=99ve seen so far.  But unlike Rust, it only protects against =
indexing out of bounds, not against use-after-frees or bad casts.  A C =
extension protecting against those would have to be a lot more invasive. =
 In particular, focusing on spatial safety dodges many of the cases =
where generics are most important in Rust.  But even then, bounds-safety =
mode requires lots of annotations in order to bring overhead down to =
acceptable levels.)

[1] =
https://clang.llvm.org/docs/AttributeReference.html#ownership-holds-owners=
hip-returns-ownership-takes-clang-static-analyzer
[2] https://clang.llvm.org/docs/BoundsSafety.html
[3] https://clang.llvm.org/docs/ThreadSafetyAnalysis.html
[4] =
https://github.com/search?q=3Drepo%3Atorvalds%2Flinux+%2F%28%3F-i%29struct=
+%5B%5E+%5C%28%5D*%3C.*%5BA-Z%5D.*%3E%2F+language%3ARust&type=3Dcode =
(requires GitHub login, sorry)=

