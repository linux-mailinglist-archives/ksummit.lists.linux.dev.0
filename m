Return-Path: <ksummit+bounces-1937-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C400A46748
	for <lists@lfdr.de>; Wed, 26 Feb 2025 18:02:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 367B7427EA9
	for <lists@lfdr.de>; Wed, 26 Feb 2025 16:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638E222258E;
	Wed, 26 Feb 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibzXMzFw"
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269872904
	for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 16:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588661; cv=none; b=J2Fj/bgGLV1li72kzFf9kpPnE4yrX6bP4qrEgzk1yShdxDAHHl9382k4e+o97y0z1i1or8/Y99RlZlpAYsBWKUSQRF/ltf1tGRiHh6luDJB0uBONBAwWuzYQoUKQYPOq4FVCuHI5CZ2seBDYYIxtvyIVhGPv5yeYB3AXqpI9R9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588661; c=relaxed/simple;
	bh=9Ewx7WXKr3ZFgVxiJURaRhChRqAeE3YaKf7yVMb5OYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXt/S8feZzcFag7OIeXSjPeHASViRf30yIq8VUKkzaRG7AHOoGkmbxHOOLfX3Q/57emn+GKHjqp4LhEnpc7hVR+AlNVEOWIjNt4ViVM5oZQBiMSFL+QDpHT9dhXd2TZHZfRpw0XgQWiRvIp9M1Aam4yWnH7HNuSaQqbc+GgiaLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibzXMzFw; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3061513d353so262131fa.2
        for <ksummit@lists.linux.dev>; Wed, 26 Feb 2025 08:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588658; x=1741193458; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ewx7WXKr3ZFgVxiJURaRhChRqAeE3YaKf7yVMb5OYU=;
        b=ibzXMzFw96FVfvSaJnwPXk5EwbcB4iI1zWgG+Da5x4UWsN7XGroemWV3xH8nZYELO/
         T0NiPbvCN49NmV2QYSQcuJPnJxc/5tMV2T2WzWb8PGVJLryF9Su+S8NSHAD6c+fKTMfo
         ZiHaBXDO9940dwVZkWQAJwQTNeggjHvXGp9kfU5oRDGv8usZ7xkcgNIbmrDBentWqtWh
         aVnQIbLbdjAzM2EzUsaRYYZ6hbRJ7ekrSOaZjFGRWdIPjRXmQU4SAnW8c/s/mGeZODgJ
         NxHGANicVeLvlDqNxLVsfll2Ho7i907GkPFEXTWOwpXzh3vMf0hmzMnCpmrLFaaoEF2e
         v9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588658; x=1741193458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ewx7WXKr3ZFgVxiJURaRhChRqAeE3YaKf7yVMb5OYU=;
        b=gUOZvQfGpZ8dpCuVqYhC4z4OJA+U+vHtGPDBZA6hGH2DoXiIeQaPwZ007FibYvNIjr
         2pDlcXhpuWg6JvwuE6R7u0gmSlT5ATLefweFH24NvYZvPF+TmYK0pqGiSVdTHZZjbIgI
         3QGsffWfurdJgVAJdHWXPksuJU/bUxtSYwZiEiDl4lk/u61VocbZBxPv3lbtl+wpHB5b
         xQLLpnj0y1Lutu3QZ5BQyq51ip/PC8cTkMnEjnrFvz63/4k4KJkGzq2GBEaKCjXPmETE
         agJbt8l+65MyXWDJqUKjJUkeqbNnE3hfTIEYO5ATz9CdwTSOZYAqPV8z0wDVwSQQpwzO
         YXLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV7kSJraMUcwZ/47uAD71yCGUGkmIwsiRr7qLWLoS8BdSBbfUDQXXZYVyWJRKXeV/zxWRHccGH@lists.linux.dev
X-Gm-Message-State: AOJu0YyBpsx0zNT79P6Y83RZxneze9KJmhVAg0Or5gB6T/WDDzhguXGJ
	0YAtGFdf2QiIswq34OhqSkIYd2r3OkTE8kQAjA/L96We8e+WJqbjkV2AlutXAdBe2q1xnI34L76
	Pq2PIBQR1IKKCzmp/GdZqIWvjITg=
X-Gm-Gg: ASbGnctonDTx7OIvfXi4yXX4AwNpeXiLcQwPrs2yQRuTd57OavCD/xc0vocxH+O72cu
	p+IpGuJ2EIz7DWif4KeSMNCBrguvgRzjWv6/Gjqt4chHFz94GFfpLYKoNw/EJLLCdlwGK+u0S4Z
	0SkaVx0WuC
X-Google-Smtp-Source: AGHT+IHpjaLTTSEsT8X2HDfdu7MLXcr5L224JGWqN6qSBhTgBt3BsEhPwDnXYyYkiwawIsKudkiHxMgqJkka7xV/ejw=
X-Received: by 2002:a2e:879a:0:b0:300:3e1c:b8b1 with SMTP id
 38308e7fff4ca-30a5b1a5b68mr89156761fa.18.1740588658090; Wed, 26 Feb 2025
 08:50:58 -0800 (PST)
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
 <CAFJgqgREAj-eP-d244WpqO-9H48ajZh83AxE31GqoONZ=DJe-g@mail.gmail.com>
 <CAH5fLghEMtT663SNogAGad-qk7umefGeBKbm+QjKKzoskjOubw@mail.gmail.com>
 <CAFJgqgRxfTVxrWja=ZW=mTj1ShPE5s-atAqxzMOq5poajMh=4A@mail.gmail.com>
 <91dbba64-ade3-4e46-854e-87cd9ecaa689@ralfj.de> <CAFJgqgTTgy=yae68AE29oJQc7Bi+NvkgsrBtOkVUvRt1O0GzSQ@mail.gmail.com>
 <6983015e-4d6a-44d4-9f2e-203688263018@ralfj.de>
In-Reply-To: <6983015e-4d6a-44d4-9f2e-203688263018@ralfj.de>
From: Ventura Jack <venturajack85@gmail.com>
Date: Wed, 26 Feb 2025 09:50:44 -0700
X-Gm-Features: AQ5f1JraygPOP6fh5kVAbB2CC2W7ezrYwkNmQAilLEmp8_kLQ9evFTL80j45gaw
Message-ID: <CAFJgqgTJ+GBvdkZf4bPHPoUgJj5ZzENZaLzVV2bnDOEG+3OMtw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ralf Jung <post@ralfj.de>
Cc: Alice Ryhl <aliceryhl@google.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 26, 2025 at 9:10=E2=80=AFAM Ralf Jung <post@ralfj.de> wrote:
>
> Hi,
>
> >> [Omitted] (However, verification tools are
> >> in the works as well, and thanks to Miri we have a very good idea of w=
hat
> >> exactly it is that these tools have to check for.) [Omitted]
> >
> > Verification as in static verification? That is some interesting and
> > exciting stuff if so.
>
> Yes. There's various projects, from bounded model checkers (Kani) that ca=
n
> "only" statically guarantee "all executions that run loops at most N time=
s are
> fine" to full-fledged static verification tools (Gillian-Rust, VeriFast, =
Verus,
> Prusti, RefinedRust -- just to mention the ones that support unsafe code)=
. None
> of the latter tools is production-ready yet, and some will always stay re=
search
> prototypes, but there's a lot of work going on, and having a precise mode=
l of
> the entire Abstract Machine that is blessed by the compiler devs (i.e., M=
iri) is
> a key part for this to work. It'll be even better when this Abstract Mach=
ine
> exists not just implicitly in Miri but explicitly in a Rust Specification=
, and
> is subject to stability guarantees -- and we'll get there, but it'll take=
 some
> more time. :)
>
> Kind regards,
> Ralf
>

Thank you for the answer. Almost all of those projects look active,
though Prusti's GitHub repository has not had commit activity for many
months. Do you know if any of the projects are using stacked borrows
or tree borrows yet? Gillian-Rust does not seem to use stacked borrows
or tree borrows. Verus mentions stacked borrows in "related work" in
one paper. On the other hand, RefinedRust reuses code from Miri.

It does sound exciting. It reminds me in some ways of Scala. Though
also like advanced research where some practical goals for the
language (Rust) have not yet been reached.

Best, VJ.

