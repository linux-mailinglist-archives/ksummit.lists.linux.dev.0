Return-Path: <ksummit+bounces-1719-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EA6A3C55C
	for <lists@lfdr.de>; Wed, 19 Feb 2025 17:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8370E3A8E1A
	for <lists@lfdr.de>; Wed, 19 Feb 2025 16:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F56211292;
	Wed, 19 Feb 2025 16:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKliCDdp"
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD2620E718
	for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 16:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983471; cv=none; b=F6UpBwEpufSSQI4ib1VqJIGi2CdMLrhO2kNoEHRKz/GwNTli1DhhxA9BnBoS4cjfIUEPsQKGqHEWhM3EU3cb5VoWw/yc411nCVMNfI+TxL4ir1fqaeS+veVC2MuGltO6viS/HV/7dlGM9h5F9qzpfH0HMLra8lcNJXyh8H8sgeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983471; c=relaxed/simple;
	bh=coLgbb6XnDBvEfFl1LEqqygGvhtbqNub/FqaL9C1aE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gf6XV1oV2Mt4m0qfmbzVeEQSTuk1Fi7GRStnIs4Y3CgI181ACwliVHqT2GlbEH00Qf2eyfF35v0l3GrFGp6FEJoWDiCzLZseJlp5/TWrdzplE1YhmKjXjE7RDBfsdgIx2g9byWPs1B/cDHoyI6q5hwiRdyJIYJKdUw95+gVdppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKliCDdp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2210f7cb393so10788765ad.2
        for <ksummit@lists.linux.dev>; Wed, 19 Feb 2025 08:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739983469; x=1740588269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HpSdI9TciDVD3f9EE6Gy3+0yUeXXFt0AqSsrZ5Y2Fdg=;
        b=dKliCDdpkhO3wSVej10FiUM3LusJjkYg3Pr+/XDCocBrHUjK1rMWyDxvTKNIS6HUdU
         n9IZJzRT5BJ4ui5DDL0PL0jtGLIDCH1Q9Ekc3YdsICKaqicBYwR2DLxRBuc5jzW3AtE/
         QtlIY3f/pgFlvq104eq5N0AJKbsy9i+vX0ZrD6NlVukEbSEjztKYSAmRWh0qyM5w1D1s
         MKUUAKK9nt7KvbAgkylK+AbpnFDbusdaMbdetvyLLCtid7gQKY7tpT8TWm/z5x+Mtz4Q
         1M/qb8/2YeoRPr14qQU6Nh8G12+KjEB/5gRS4LEvsXa3RFoJ9KZdXcLgXLSlFC7xojua
         4HhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739983469; x=1740588269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HpSdI9TciDVD3f9EE6Gy3+0yUeXXFt0AqSsrZ5Y2Fdg=;
        b=HXYaFrvH3JL83rYTCoHfOXTya9bckeUDLHLEo6LbEM58WvsOXbC+v4zmY6V6QESmQD
         KoDS7/W5MOU+SDTODOzEZSH6iq5eQKqTbz5idW2/p0aLkaHBqKAlFOT0047hZC6Z+589
         9iBV2yFCc0zdgH6UEv+ZcpWZ/VD+tC4gloJ/jl2P53D+57eKob0usKSO41z8w7vaLh0G
         kbqHEjc84m3x/+B2hriRBxC5H8YGN6UEAvKD8roSiSRjMnuJvhQ8LyjaSIhgPQWHJMkr
         DsxAYSAxohsv0jt9di7RQyrycg4K2QcIPLH+XRI75/JfKEKISVn3VL4xs7iUMbxQY/tS
         JFkw==
X-Forwarded-Encrypted: i=1; AJvYcCXq2RXVkOiDhzp218rGOOOrwDEUHGeJ8SWoM2hMjMo8cn/VGlQU6bZ6pk49U89B3A9bGZuLqojf@lists.linux.dev
X-Gm-Message-State: AOJu0YwSUoEBNK6TSCf4RzwDdCVwVLLZCj2onA4tIJcxLp1g4ezBewRL
	BHwYkRpUmkiq7pWl4UaPoGbnI9hHusrZanfKqhqUM02fZweHOmg6lxzzMvj5FKFa5qdbhFfR8+w
	9Pveltzji2H89T0icOXYEo6aspkU=
X-Gm-Gg: ASbGnctgvFauQ/UVjMoUIERqwH8SzBtVqAqPiDpzLEsSvrBdfNPYJZ1Dw0r5m/AWJAl
	+1Gp4ghvWahjYvdUuKOUjlTQ05EOLxGYRZnvt0GRfpv+D0YWGpjqTk0Tib86kW0HRGgKRZRsq
X-Google-Smtp-Source: AGHT+IGXLgEYvFdJCDw63pT8utsxHDE6tdJOZPEE2jtb7OZQYt+f9JyLUhhgOfAgeTWIaWDbUpCq8X+N1x+FdIUrOQ4=
X-Received: by 2002:a05:6a21:998d:b0:1ee:6da6:db39 with SMTP id
 adf61e73a8af0-1ee8caac940mr12393415637.2.1739983469359; Wed, 19 Feb 2025
 08:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z7SwcnUzjZYfuJ4-@infradead.org> <b0a8ee53b767b7684de91eeb6924ecdf5929d31e.camel@HansenPartnership.com>
 <CANiq72nnnOsGZDrPDm8iWxYn2FL=wJqx-P8aS63dFYez3_FEOg@mail.gmail.com> <a627845f73f2f7bedc7a820cfdf476be9993e30f.camel@HansenPartnership.com>
In-Reply-To: <a627845f73f2f7bedc7a820cfdf476be9993e30f.camel@HansenPartnership.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Feb 2025 17:44:16 +0100
X-Gm-Features: AWEUYZlZQz32tYaHsd-CbTAVpzCaM1AcA1wwh-dIKS5x41V3xqxA5IWgZKTqXP8
Message-ID: <CANiq72m5KB-X1zck1E43yffXOTeD4xRmZgDx_oUiNwR941ce0w@mail.gmail.com>
Subject: Re: Rust kernel policy
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 5:03=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> Just so we're on the same page, kernel API stability can't be the goal.
> We can debate how valuable the current API instability is, but it's a
> fact of life.  The point of the proposal is not to stabilise the C API
> but to allow the instability to propagate more easily to the rust side.

Sure, I didn't mean to imply that -- I am only trying to say that,
even if you add a lot of information to the C headers, you would still
have to update callers (both C and Rust ones).

Now, there are C APIs that even if they are not guaranteed to be
stable, they are fairly stable in practice, so the pain can be fairly
low in some cases.

But please see below on what "Rust callers" mean here -- it is not
every Rust module, but rather just the "abstractions".

> This very much depends on how the callers are coded, I think.  When I
> looked at Wedson's ideas on this, the C API contracts were encoded in
> the headers, so mostly only the headers not the body of the code had to
> change (so the headers needed updating when the C API contract
> changed). If the enhanced bindgen produces new headers then code like
> this will just update without breaking (I admit not all code will work
> like that, but it's still a useful property).

Hmm... I am not sure exactly what you mean here. Are you referring to
Wedson's FS slides from LSF/MM/BPF? i.e are you referring to Rust
signatures?

If yes, those signatures are manually written, they are not the
generated bindings. We typically refer to those as "abstractions", to
differentiate from the generated stuff.

The Rust callers (i.e. the users of those abstractions) definitely do
not need to change if the C APIs change (unless they change in a major
way that you need to redesign your Rust abstractions layer, of
course).

So, for instance, if your C API gains a parameter, then you should
update all your C callers as usual, plus the Rust abstraction that
calls C (which could be just a single call). But you don't need to
update all the Rust modules that call Rust abstractions.

In other words, we do not call C directly from Rust modules, in fact,
we forbid it (modulo exceptional/justified cases). There is a bit more
on that here, with a diagram:

    https://docs.kernel.org/rust/general-information.html#abstractions-vs-b=
indings

In summary, those abstractions give you several things: the ability to
provide safe APIs for Rust modules (instead of unsafe calls
everywhere), the ability to write idiomatic Rust in your callers
(instead of FFI) and the ability to reduce breaks like I think you are
suggesting.

Now, generating those safe abstractions automatically would be quite
an achievement, and it would require more than just a few simple
annotations in the header. Typically, it requires understanding the C
implementation, and even then, it is hard for a human to do, i.e. we
are talking about an open problem.

Perhaps you could approximate it with an AI that you give the C
implementation, plus the C headers, plus the C headers and
implementations that those call, and so on, up to some layer. Even
then, it is a problem that typically has many different valid
solutions, i.e. you can design your safe Rust API in different ways
and with different tradeoffs.

I hope that clarifies.

Cheers,
Miguel

