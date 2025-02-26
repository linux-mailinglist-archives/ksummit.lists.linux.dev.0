Return-Path: <ksummit+bounces-1971-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795E7A46F45
	for <lists@lfdr.de>; Thu, 27 Feb 2025 00:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7466416D721
	for <lists@lfdr.de>; Wed, 26 Feb 2025 23:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC54F2702B5;
	Wed, 26 Feb 2025 23:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ASvYSL60"
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6632702A7
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 23:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740611836; cv=none; b=HtQgP5KFd/4SYmJQQZGsDOEpmXas862yRv4ZiQfXYDMEucaHsNaIOjkHzmtsPEQO98Wj4MdVNMrujMAps2nFC7nzHnPoytucZnz5IJvryOau85hjFCDglTReUVH3VsvW3wfB0Z4n91Vtjz3SRUhU+q6Fthbf00OF22L6e1fxRSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740611836; c=relaxed/simple;
	bh=XarU5AoRc1EC+DeSSkq4KJpi/IJAWCVURI1rN1QDT3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZQZK9O2+VqnB3NthFMTbjjhJMHmXgacGJ1D6mQVqpckgJGShNUnm2VhyN6idMlinMR1JAwoqFvgHgIHwwTEU8ZoOp/qPi7Og2aE2V5pMFOXBHTY0y0enPDwEOI41vTzu3QEzX2Y36GgLGTy6PDPn9xdXWgRemOjD8bKdckXsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ASvYSL60; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso45294766b.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740611832; x=1741216632; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IuzhV/0JqnZbj1q0brkRQlbfU2Wt+k1TRbEteuusQss=;
        b=ASvYSL60mpxirr3fxaMq2o5f0iE3lY5EeROSRhgsf1UU9wg0vzqvf/vo8rLtWk4dqv
         22b6jUe6GRD/j1r6dwL6GKjdttF21UEKnZGza4wlLGaVyGfBNL/vA9GJXc76e8mGP/3A
         wc9gdCPhlgMygd5cHtdW0g5Exv6ZmNxlxBGP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611832; x=1741216632;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuzhV/0JqnZbj1q0brkRQlbfU2Wt+k1TRbEteuusQss=;
        b=PXHz8yc3a1H5yebyeQt+djPh8jpGGJRvRtE1or9r3eitjP79IGJZjYfTrDrW/ZrPn+
         z/EQ0B1jMBzVWwz1KYmGXbPoBFwcNkMu2o1cVe9B6bpc7JvTh10V92F81DatcFY9ICgd
         c1aPFyPMcg49V9Ic+VEKHz+cTV8SQ8X+FZDFs+PRQ2rogiw82tK4oQoVxa1Ir7YDs7Jr
         2P15E1wNb+8SE6ZpKInrgcvofMOe0Sgq9gCdvDh9bmmiExaEiUHdiNjfWpZ14IxJSZat
         BXKMhh20iFZmS0ELvPrvX2arVrqfdPez9J99KKlK1x/ZUhoFUZ0kH/tjoVxF2ZxD+ydA
         SJHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1RBvht6YXNhSh9Sf4orCYoxMHT2/YOE917pUXuBaTYLFWZBB4U+4/JnYV1kzi6giomN3lvioU@lists.linux.dev
X-Gm-Message-State: AOJu0YwxWQCuhGZ1Nx5Nze4Jr245sCRnHJe/XAkVS40VO5rIkWHBLsxK
	QX/u/hUsSnws1+8YZhvmGMHKnML8+AmivKGpszDzHAKnUticDNlQ9PAiWu9cvuMlNBU/QGi5R7y
	B3k0xlg==
X-Gm-Gg: ASbGncu965ERYwOrSCjehkm/8Ri8k+nwpRx0MmFMqXa0Ar0ZXZOij+Qc26q0FKR8Nm+
	VqF47SsWoWmy+JH81sKD6Ct4damE71hID9u8C3BOdUdVZNw9nhUTwJg3HjutHzWeuROzHUzB6Hm
	8pJTkhuukcs0g+hydgPG5LYXibkPOsmN+PvKxh0Jsu2WKNtTcwW5C8FBHtP6UtEU0VQFd5N71KM
	mfDTS7UFu2OxNcN+18NPkKQ8y/yZ7JeN6nL2oSXyuzaModCZIaDX07WlU/1SuTkq5uvKGRewFT4
	hOTXYPSUXXsb78CPO/ovFBHrg4C0VBtYg4E25299pNvqySFPetihQJhvMWsAPNoU7y+F+wLh93/
	p
X-Google-Smtp-Source: AGHT+IFqBU3l2GXBIwl51lq7o0FXfpwnOybcoLI616DvrTweKxhpAP400/cWumrG9bdu5jSqaAftzw==
X-Received: by 2002:a17:907:3f8f:b0:abe:ee4f:f635 with SMTP id a640c23a62f3a-abeee50aae2mr645291566b.39.1740611832370;
        Wed, 26 Feb 2025 15:17:12 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c755cc5sm18777866b.140.2025.02.26.15.17.11
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:17:11 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbda4349e9so41663666b.0
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 15:17:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsQynIKZnojmxaOHwaL90J5DEVzTW44cPEeDb3ZdKDWcZwx4cGUQTw0huz8jmbnZCwrtsDrQso@lists.linux.dev
X-Received: by 2002:a17:907:7758:b0:abb:519e:d395 with SMTP id
 a640c23a62f3a-abc0d9da124mr1995246666b.20.1740611831430; Wed, 26 Feb 2025
 15:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com> <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
In-Reply-To: <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Feb 2025 15:16:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
X-Gm-Features: AQ5f1JoyIv-1_glEa7tZi4ZthcHRhGP_dyEjdVPws-Ir7Wz4fXVxNYINjV-KbP0
Message-ID: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Martin Uecker <uecker@tugraz.at>, Ralf Jung <post@ralfj.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Feb 2025 at 14:27, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> This is another one that's entirely eliminated due to W^X references.

Are you saying rust cannot have global flags?

That seems unlikely. And broken if so.

> IOW: if you're writing code where rematerializing reads is even a
> _concern_ in Rust, then you had to drop to unsafe {} to do it - and your
> code is broken, and yes it will have UB.

If you need to drop to unsafe mode just to read a global flag that may
be set concurrently, you're doing something wrong as a language
designer.

And if your language then rematerializes reads, the language is shit.

Really.

             Linus

