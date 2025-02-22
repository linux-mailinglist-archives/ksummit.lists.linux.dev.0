Return-Path: <ksummit+bounces-1837-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B7CA40A8B
	for <lists@lfdr.de>; Sat, 22 Feb 2025 18:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E79D178652
	for <lists@lfdr.de>; Sat, 22 Feb 2025 17:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6DD12080F5;
	Sat, 22 Feb 2025 17:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzMqzD/o"
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9827B12E7F
	for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 17:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740244255; cv=none; b=VY0t91CQvNa3OeW4+PO/LjGL2ZOaepi5yYwMO7nOTrZAOT/KF5H1l3LYUC2BVaJ0d8IQ0g/nBw6VI6yBTdCE65qxqfmDseRJfBICA06n97/dI7b9WK0WUU9ZzCQkPXWN7w+FQKwtVDE/DYYQqVFHpgL3VNQyl2KP24uukHfcIEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740244255; c=relaxed/simple;
	bh=9UJIlQzWEWeZaZoQkoqjfKbkSaRGgqRajh7M2GfvB8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTlHA/MpDTPxRhMqXXNNRsDbSENwUXqOkz1QW9p0IoZwPa0aPcNNWvx6gcUgbaqS/jw8fvx1uffaohOEnBO4IdpcIS/AiEJ5GoNJpMLlf8HVmkjjNw8xwZSZysBwBOs0tejZI0NVcFzvBTZn23tDVW3heDaLKmIXGWLIiiKdfTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzMqzD/o; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7c0155af484so475933985a.0
        for <ksummit@lists.linux.dev>; Sat, 22 Feb 2025 09:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740244252; x=1740849052; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzwOqgEVL//qbVhcL4AuzpMdPs/1QN2mFO8F6wcbkGM=;
        b=XzMqzD/o1wY516Kg/o3q88lTc3iKHMkqiSKpiiRTTgirh4uaSht8L2dptDxWf2cQt7
         RynEWDN4jI/RaJFiGj8wqSPsQtrWKwYoCQRsALoE1jQVLqYVSs27R/lR/0xn4SREqpxF
         ME0YXLluVaHrFv230wJ5LNprFwNb6yaaUTdkzmvou8UMq24B+2vicTZnIsAcu7L1hP57
         ulwucPr2MvOcW3/g0b1LTyZXXzlLzMMjG/jCOLyzIBWiEc/wziumGKqBS4QRPT3d6GKq
         faS7zSUfv8h/f4nZniLZoJKSAQmDmaGUmn/sAYznK23JjPMqnvHlFOh8BopYTj74Gskt
         JeiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740244252; x=1740849052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzwOqgEVL//qbVhcL4AuzpMdPs/1QN2mFO8F6wcbkGM=;
        b=bayraqyRtQjU7YHgop0Q7oJ/gEdP6sz9lz+CKg+6IqK+Tkvu5HkYKgy9WWiIyHzu6T
         f4Y1pTOLgANT/8ShROQH9UtkUlqwRjFhflBgrxSkBzUKPlGpl/gN3uWElOB0lP4Y0OUp
         aFSPrOBtRXcqtAsoSbcCk1xtqVPSN/xFIdvh2qstsVLMdy9LhLsze+lc3Gg8zvGxBoXE
         yJ7qC8tK6eMYEQ2qOxGS+gdRL/8VMzX0OOod5w+fJYjMisYS/GDLLlwSJqPgnT+UAnRe
         x10OwHtE9rQVud1JPdrF1Ce3iTvUmTWLz11cpKepYpnqELTcPjY26YV/oBe5BMcyl2hu
         cSBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQgksoCH1kg22DFx/iWwUWKMyWsGHQnwK+sxbnm+OtejpRCC8VXC9jhU+lz28Km3u6EW/0Dza/@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+7mItQuJulAnsNMj6i2sZA4A+Z1CnVE7jYHQq/nVbQ0vHTUDe
	bHTfcjR+krUO3skvLKte+H7amticZVe9dTRCnYhotXL9OBcNp+u+p0Va5D9fljCbAh/dRUqqk//
	yB2Az9OQUeFpoAo6IDsaOrVWF8/0=
X-Gm-Gg: ASbGncvCasJN/d0Qprxn44RL9wAjL9sfmx02GpSo3LDzABJOQnJYAAiM+wEEijJzcej
	mItXmNZUfP8mUESbjO31QzMRR9hFzfrctNUPWkjsE8Zp1fPR+NJjH1UZz2a1yNz2ZB5eY+ourUF
	lukSyITFMj
X-Google-Smtp-Source: AGHT+IG3Z5Iz4lpwef1CynCtc91rGerNJS68MTuIsVCOxM3rPsqmJXDIPFGp9hRRbx3/Szvrf48YKtRvmcOTzlzOEIk=
X-Received: by 2002:a05:620a:4552:b0:7c0:c0b7:32fa with SMTP id
 af79cd13be357-7c0cef55ff4mr1409883285a.36.1740244252232; Sat, 22 Feb 2025
 09:10:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com> <CANiq72m+r1BZVdVHn2k8XeU37ZeY6VT2S9KswMuFA=ZO3e4uvQ@mail.gmail.com>
 <a7c5973a-497c-4f31-a7be-b3123bddb6dd@zytor.com> <Z7VKW3eul-kGaIT2@Mac.home>
 <2025021954-flaccid-pucker-f7d9@gregkh> <sbcgis4vibueieejklfvv5zgz5omirryjyiynd5kloilxfygqb@zcqrjc6snxey>
In-Reply-To: <sbcgis4vibueieejklfvv5zgz5omirryjyiynd5kloilxfygqb@zcqrjc6snxey>
From: Ventura Jack <venturajack85@gmail.com>
Date: Sat, 22 Feb 2025 10:10:40 -0700
X-Gm-Features: AWEUYZmvxQDRI0yJ0AQlCoKpdyUsYldeK1UrrTHOzTE9PafVjARATh7Pv-gzoMs
Message-ID: <CAFJgqgTFoqH8kDquHjhKXCvsXrF-uoHo=bq52Fgv+MKePy4zhA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 9:04=E2=80=AFAM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Feb 19, 2025 at 06:39:10AM +0100, Greg KH wrote:
> > Rust isn't a "silver bullet" that will solve all of our problems, but i=
t
> > sure will help in a huge number of places, so for new stuff going
> > forward, why wouldn't we want that?
>
> The big thing we run into when trying to bring this to a practical
> systems language, and the fundamental reason the borrow checker looks
> the way it does, is Rice's theorem. Rice's theorem is a direct corollary
> of the halting problem - "any nontrivial property of a program is either
> a direct consequence of the syntax or undecidable".
>

How do runtime checks play into Rice's Theorem?
As far as I know, Rust has or can have a number of
runtime checks, for instance in some of the places
where a panic can happen.

The type system holes in the Rust type system, and
the bugs in rustc's solver, grates me a bit. A lot of
hard work is done in Rust language land on
fixing the type system holes and on a new
solver for rustc without the issues of the
current solver, while maintaining as much
backwards compatibility as possible. Difficult
work as I gather. The alternative GCC Rust
compiler, gccrs, is (as I gather) planned to
also use the new solver once it is ready. There
were some versions of rustc, also in 2020,
where compile times for some production Rust
projects went from fine to exponential, and
where it took some compiler work to mitigate
the issues, due to the issues being related to
holes in the type system.

The type systems and compilers of Haskell
and Scala look more robust to me. But, they
are reliant on GCs, making them irrelevant.
They also do not have affine types and borrow
checking as far as I know, unlike Rust, though
they may have experiments with it. Scala does
have dependent types.

The more complex a type system checker and
solver, the more difficult it can be to avoid
holes in the type system and bugs in the
solver. Hindley-Milner is great, also because it
is relatively simple, and has proofs for it and
its algorithms for type checking. Mainstream
programming languages inspired by
ML/Hindley-Milner do generally extend its type
system, often to provide more flexibility.

For anyone curious about the compile times and
type system issues, there are these examples:
https://github.com/lcnr/solver-woes/issues/1
https://github.com/rust-lang/rust/issues/75992

Best,  VJ.

