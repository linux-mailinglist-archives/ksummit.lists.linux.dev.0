Return-Path: <ksummit+bounces-2036-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7957DA55664
	for <lists@lfdr.de>; Thu,  6 Mar 2025 20:16:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD07C1898109
	for <lists@lfdr.de>; Thu,  6 Mar 2025 19:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205BA26FA7D;
	Thu,  6 Mar 2025 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="St5lUXnn"
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015EE26A1DF
	for <ksummit@lists.linux.dev>; Thu,  6 Mar 2025 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741288580; cv=none; b=ecPIjJ75+0EBv5cCqoYKkhsZ9oDVaqo7JS0u92YGg0hgA5UDMt9Afcqg4mrpgwZz6Tw4Hb71tUitK1RqA0F6b+7TAshAywucTR8OpSuUlu9uiO2Vg+Lj5oC/sfCHmGF3kUiDj9IKoynPzMEWzmF0hhfkyE4suKkJ90R7B/rGgH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741288580; c=relaxed/simple;
	bh=q2hPBFkNdaK4S3iQuw7LOrhtKH0/q3Oertms5sis28U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZX/8V6nbVTDE28tEqQXwwhETsCG8LD5V9SkLvfNS5JCOtSlq8QubJ7ssOVHpQQSLIfXnbQZ4tIl1drdMEloADf6EN4V9nnHmh2frKrEzZ/dITrRNuY52Ts+R6BkfE9g0vsQ8w6a7AWCSbVFT5rsrUMgvDBdnDJGkfzljIFO6lMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=St5lUXnn; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5496078888eso1239705e87.0
        for <ksummit@lists.linux.dev>; Thu, 06 Mar 2025 11:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741288574; x=1741893374; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zWv5vfgOjb/x6VCa5m+Ij1S1ZZkHOGvhDIcER6Dvj4=;
        b=St5lUXnnus5mz4/5kNutE2IsptW8BdZyGB+1T6Vg/+zRhAbPO5/u4YZl9FwUlsavD0
         h2FZ7G1QY5DbBKeoFZ2quOB2WyG5Ii9aWqJDDq1WoTcd5Cmils/rxuq87vQlk+MRbJuq
         QsU5tQA6po0TfvGnS1hELVBvQxnbhK0lQ2Oj+9jOt/+O/0sNlo+kzaRAmNwUA9yg72H1
         ZGz9SvGxaKnCOwcs4ieAz2hstWUuacZgE7twITKCHeN+RQl46s3Lp+9HZtf5U02WpgqV
         TVV9u1KA0P0vxHjfZlFvJZTNjxWCgAog93RfTZyOAy/wb8TzpnK8LizP9XzkUOca9m6g
         4NTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741288574; x=1741893374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zWv5vfgOjb/x6VCa5m+Ij1S1ZZkHOGvhDIcER6Dvj4=;
        b=Z9mm9wVd6Odlyqc++qnCQlUHEFwnkIORFgdCL+s5DWC3gHDhEnq1qnVefHmuMOZAAb
         lDaVM850nwhPokrApfin829/s7kxK5xWVlEZ3L3+8yz0glBo7IFriZczyJc8dGkn1cmJ
         pw5Z2t5ygvMHFmI/2ypDO6r41FVVPI7XR0VKXAGZwhp4y61kA7jra+VJ3c8mkU4GgnLK
         ePImbi0e3SrNaFO4oYAdqsB3CWCR9wPeZ2TWaAnvi0IS+NE+7PpKafMrPhKhB8QaWzBA
         38Fw/YHqBmecGZu0QYDzjl+MrDXPOcBh3RzIxFLep+oMNggfJH6k02HTwcB5PG/uWlWi
         8/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWF/d3wCZEN0hPBL9UqFrwmmjhxxL6I3xxFunnCgZ4WGaF8wFYRnFsnBDQ/WY+qmElHw7XKkrPN@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa3YRVaccZmIyZ02GCastptJTnIrwLKMOJCYudX6Ak86vbpnaj
	R40kD3g75BeShx3rlNo2+xi4nZ16LV3HbkiLys/3iBbaJUwZk8yyNswAcK5lFdGaHjk5xLKKsB3
	tR3ou2SRdzG6PJSL6nsm6mrsrdHc=
X-Gm-Gg: ASbGncvtLfOh4Nx3/5xcbpSHrjoXmEaj3dgw4zTkMsIuLZgAfiw7AQjXU4/FV7wCqZL
	ays6qSYonRVhWN0l3Ky0RGtZvY8XcCtt/9Y81zoS22lzihacaSL7ZVhzRGVG7zR1iBLTW1uWgzc
	VmrD8XJ0Rva6pAetTehXMJHt4etw==
X-Google-Smtp-Source: AGHT+IH0/6rfvsSTjj6Oho1kqCGlqCatvY17T4k/5nKHZE91YXjib3mpD3ttoqN2cRr2pmaWptEyM20iYuRcS8FKznI=
X-Received: by 2002:a05:6512:1245:b0:545:5d:a5cd with SMTP id
 2adb3069b0e04-54990e2c073mr127331e87.6.1741288573786; Thu, 06 Mar 2025
 11:16:13 -0800 (PST)
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
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5> <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
In-Reply-To: <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Thu, 6 Mar 2025 12:16:00 -0700
X-Gm-Features: AQ5f1JottkKmRWm9d9-3BOGDaY6aX18jU7z4bz0wmQr9-3z_OciBPEKZEX-A_TU
Message-ID: <CAFJgqgRxvUqvgC30Y_n2jOppUH47r=heSYpJb7FiMyw4miW4=w@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Martin Uecker <uecker@tugraz.at>, 
	Ralf Jung <post@ralfj.de>, "Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Gary Guo <gary@garyguo.net>, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, miguel.ojeda.sandonis@gmail.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:17=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 26 Feb 2025 at 14:27, Kent Overstreet <kent.overstreet@linux.dev>=
 wrote:
> >
> > This is another one that's entirely eliminated due to W^X references.
>
> Are you saying rust cannot have global flags?
>
> That seems unlikely. And broken if so.
>
> > IOW: if you're writing code where rematerializing reads is even a
> > _concern_ in Rust, then you had to drop to unsafe {} to do it - and you=
r
> > code is broken, and yes it will have UB.
>
> If you need to drop to unsafe mode just to read a global flag that may
> be set concurrently, you're doing something wrong as a language
> designer.
>
> And if your language then rematerializes reads, the language is shit.
>
> Really.
>
>              Linus

Rust does allow global mutable flags, but some kinds of
them are very heavily discouraged, even in unsafe Rust.

    https://doc.rust-lang.org/edition-guide/rust-2024/static-mut-references=
.html

Best, VJ.

