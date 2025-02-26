Return-Path: <ksummit+bounces-1927-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1881EA463DE
	for <lists@lfdr.de>; Wed, 26 Feb 2025 15:58:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6CDF23AF455
	for <lists@lfdr.de>; Wed, 26 Feb 2025 14:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869882222D0;
	Wed, 26 Feb 2025 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6ePi0DC"
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A7B2222C5
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 14:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581867; cv=none; b=V32UBGqrfks8s4ia1qAs6BpZFUDI9CMpT7WFyx9i8tWy03KV++EMfa1FrMNy6eL2XQRGoSezb1ww5AVHAxZPJ3cOEl8YgvsUVKeMnOnYcKjRBG2c45k6V7uiZ5zgl9enOZ56CfhKPjT0/aV/7+sJJsybfwxUVvYLgupht4OaExI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581867; c=relaxed/simple;
	bh=exPTYl/G8xGMJ5KWmnWY4lMJepkIK8e+z9ezmnXgxK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mM63Q89nuKMseepWt17boNCmrJXkw2ejqKzQO7qr1F5BgzUj6a495rUl/cmu9Wc2cV4aIJ5VQJ8J2HjYFiENsZ9BozzPUcQ2Uces8r6gL0r8mbvxxRGTzIWPpBoQBXn0b8jYHnOt90JP2qVZf3ZDOoTlFQM1I2drDD2cofShomw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6ePi0DC; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-548409cd2a8so5156413e87.3
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 06:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740581864; x=1741186664; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmBQUH+CeL/df1c+D6bwSNj4KBzbPZ0tvqWc/Hm8TeE=;
        b=T6ePi0DCbrRPUSef9KUfiuvpQA2OfNUAaWN0zBIXW+AY23K+QgmM0Iq7IeRLn4B1LD
         a88Jz1XyS1uBut1K1GY9Qt8FEDvCfq4Zcl0p3tySUsx9x+MslL6YccyrmQy3cf0SXnP0
         8XBaXRkO6LBiIGBT3Iww7xYGTS8yg/4HigHGnKSsvuEhak4jp8DSYsKo3zmrsGPKrYgf
         sV5OrdRHCpdLyTYQmRiCldw684ZauMX1cDOHb22iffXphnD3PFtpHhIw5jychGMrtp5I
         xU+JuuNelfsqhXsOjuV9m2ViIYuA2yQCNvyd+GjJZWmSzCyxHv5vDeNZFyYO1FTni2MB
         Vp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740581864; x=1741186664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmBQUH+CeL/df1c+D6bwSNj4KBzbPZ0tvqWc/Hm8TeE=;
        b=jZ4f1t6bz+xiSqi7jtygDXiROrEQc17qXVBsTLH/KCfB/XIAi/kpiqrorG41z4gVmd
         lXRVwpEM07lDKoR8dGyyiZ+oLDD7//ddWuiyd+w4sHlAof2/s4t4t2j+lxyeHFRCY8h9
         C6Q9itBe3lTdiw53pG5Sa8z/VncSHrfH6ZlXBnAbeRzQDjcRn72+AmkPaEmRfNINQRnm
         JYw4ZV7oJKzrtVsIn/Dc2qZ2Mq32+tmLWxgqFBCJYJhcCwIHHHO9wpcvh7toOi7XNusV
         zA/8oSesxHhxePI6igiSU97Hu1Yg8wOmyBiP1dMrRbxL+Rojzx5TpLdFFWbLOmCFwRVr
         ld0g==
X-Forwarded-Encrypted: i=1; AJvYcCURokESNu/oiHlvIFR1AQJ7b+DdzoII1Gtrxwpjuf0glv8xanFhf+aUnROMUu1t68Ol1ReJIo1k@lists.linux.dev
X-Gm-Message-State: AOJu0YzhS5OWhFvWQlkLGaJCbrlvTbHPT/092P6rZ+Owrd0ehob/EWSo
	AgYUKClB9aNd8RfMiWNG04iRedf+1otkrnJKOavfpYaK5x3bpLOHI6Fl0WhhifUT9wuOcinTV4O
	niykfseU94UuTNQ0vD3MtrXygQcBfdAAz
X-Gm-Gg: ASbGncvQR2lQBLDrGz6BjEqEAmt8Dc1C2s+jcMrD3NPgszlyA6URD+4dpkiRalf2f5I
	Y5nNjpe7yGhs4Ft98vri9lwsw4d53Zb2Px2ZJNIsRwyF3L+4UHJbp8a8metsINB1p60e9aPoTRY
	oYHdn1O9Hm
X-Google-Smtp-Source: AGHT+IHGpxJyYcpdkSCW/SXyfWqVlUKVzz1DxVDanEf1VcEX2yQEWccPlzUMrzF1K0HO2xZ9I2fHAsrmagv051PGdWM=
X-Received: by 2002:a05:6512:68e:b0:545:3dd:aa5f with SMTP id
 2adb3069b0e04-548510ecfadmr4470175e87.36.1740581863683; Wed, 26 Feb 2025
 06:57:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CANiq72mdzUJocjXhPRQEEdgRXsr+TEMt99V5-9R7TjKB7Dtfaw@mail.gmail.com>
 <lz7hsnvexoywjgdor33mcjrcztxpf7lzvw3khwzd5rifetwrcf@g527ypfkbhp2> <780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de>
In-Reply-To: <780ff858-4f8e-424f-b40c-b9634407dce3@ralfj.de>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 07:57:29 -0700
X-Gm-Features: AQ5f1Jo9IzYuf4E5AC_RcTEU4bX39JC8MluDSFJpsvCTKdWgDEaxM6M0ch_TWZM
Message-ID: <CAFJgqgRN0zwwaNttS_9qnncTDnSA-HU5EgAXFrNHoPQ7U8fUxw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Gary Guo <gary@garyguo.net>, 
	torvalds@linux-foundation.org, airlied@gmail.com, boqun.feng@gmail.com, 
	david.laight.linux@gmail.com, ej@inai.de, gregkh@linuxfoundation.org, 
	hch@infradead.org, hpa@zytor.com, ksummit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 4:34=E2=80=AFAM Ralf Jung <post@ralfj.de> wrote:
>
> Let me also reply to some statements made further up-thread by Ventura Ja=
ck (in
> <https://lore.kernel.org/rust-for-linux/CAFJgqgSqMO724SQxinNqVGCGc7=3DibU=
vVq-f7Qk1=3DS3A47Mr-ZQ@mail.gmail.com/>):
>
> > - Aliasing in Rust is not opt-in or opt-out,
> >     it is always on.
> >     https://doc.rust-lang.org/nomicon/aliasing.html
>
> This is true, but only for references. There are no aliasing requirements=
 on raw
> pointers. There *are* aliasing requirements if you mix references and raw
> pointers to the same location, so if you want to do arbitrary aliasing yo=
u have
> to make sure you use only raw pointers, no references. So unlike in C, yo=
u have
> a way to opt-out entirely within standard Rust.

Fair, though I did have this list item:

- Applies to certain pointer kinds in Rust, namely
    Rust "references".
    Rust pointer kinds:
    https://doc.rust-lang.org/reference/types/pointer.html

where I wrote that the aliasing rules apply to Rust "references".

>
> > - Rust has not defined its aliasing model.
>
> Correct. But then, neither has C. The C aliasing rules are described in E=
nglish
> prose that is prone to ambiguities and misintepretation. The strict alias=
ing
> analysis implemented in GCC is not compatible with how most people read t=
he
> standard (https://bugs.llvm.org/show_bug.cgi?id=3D21725). There is no too=
l to
> check whether code follows the C aliasing rules, and due to the aforement=
ioned
> ambiguities it would be hard to write such a tool and be sure it interpre=
ts the
> standard the same way compilers do.
>
> For Rust, we at least have two candidate models that are defined in full
> mathematical rigor, and a tool that is widely used in the community, ensu=
ring
> the models match realistic use of Rust.

But it is much more significant for Rust than for C, at least in
regards to C's "restrict", since "restrict" is rarely used in C, while
aliasing optimizations are pervasive in Rust. For C's "strict aliasing",
I think you have a good point, but "strict aliasing" is still easier to
reason about in my opinion than C's "restrict". Especially if you
never have any type casts of any kind nor union type punning.

And there have been claims in blog posts and elsewhere in the
Rust community that unsafe Rust is harder than C and C++.

>
> > - The aliasing rules in Rust are possibly as hard or
> >     harder than for C "restrict", and it is not possible to
> >     opt out of aliasing in Rust, which is cited by some
> >     as one of the reasons for unsafe Rust being
> >     harder than C.
>
> That is not quite correct; it is possible to opt-out by using raw pointer=
s.

Again, I did have this list item:

- Applies to certain pointer kinds in Rust, namely
    Rust "references".
    Rust pointer kinds:
    https://doc.rust-lang.org/reference/types/pointer.html

where I wrote that the aliasing rules apply to Rust "references".

> >     the aliasing rules, may try to rely on MIRI. MIRI is
> >     similar to a sanitizer for C, with similar advantages and
> >     disadvantages. MIRI uses both the stacked borrow
> >     and the tree borrow experimental research models.
> >     MIRI, like sanitizers, does not catch everything, though
> >     MIRI has been used to find undefined behavior/memory
> >     safety bugs in for instance the Rust standard library.
>
> Unlike sanitizers, Miri can actually catch everything. However, since the=
 exact
> details of what is and is not UB in Rust are still being worked out, we c=
annot
> yet make in good conscience a promise saying "Miri catches all UB". Howev=
er, as
> the Miri README states:
> "To the best of our knowledge, all Undefined Behavior that has the potent=
ial to
> affect a program's correctness is being detected by Miri (modulo bugs), b=
ut you
> should consult the Reference for the official definition of Undefined Beh=
avior.
> Miri will be updated with the Rust compiler to protect against UB as it i=
s
> understood by the current compiler, but it makes no promises about future
> versions of rustc."
> See the Miri README (https://github.com/rust-lang/miri/?tab=3Dreadme-ov-f=
ile#miri)
> for further details and caveats regarding non-determinism.
>
> So, the situation for Rust here is a lot better than it is in C. Unfortun=
ately,
> running kernel code in Miri is not currently possible; figuring out how t=
o
> improve that could be an interesting collaboration.

I do not believe that you are correct when you write:

    "Unlike sanitizers, Miri can actually catch everything."

Critically and very importantly, unless I am mistaken about MIRI, and
similar to sanitizers, MIRI only checks with runtime tests. That means
that MIRI will not catch any undefined behavior that a test does
not encounter. If a project's test coverage is poor, MIRI will not
check a lot of the code when run with those tests. Please do
correct me if I am mistaken about this. I am guessing that you
meant this as well, but I do not get the impression that it is
clear from your post.

Further, MIRI, similar to sanitizers, runs much more slowly than
regular tests. I have heard numbers of MIRI running 50x slower
than the tests when not run with MIRI. This blog post claims
400x running time in one case.

    https://zackoverflow.dev/writing/unsafe-rust-vs-zig/
        "The interpreter isn=E2=80=99t exactly fast, from what I=E2=80=99ve=
 observed
        it=E2=80=99s more than 400x slower. Regular Rust can run the tests
        I wrote in less than a second, but Miri takes several minutes."

This does not count against MIRI, since it is similar to some
other sanitizers, as I understand it. But it does mean that MIRI
has some similar advantages and disadvantages to sanitizers.

Best, VJ.

