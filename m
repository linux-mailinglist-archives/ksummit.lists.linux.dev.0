Return-Path: <ksummit+bounces-1683-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6109A3ABD4
	for <lists@lfdr.de>; Tue, 18 Feb 2025 23:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842AC3AB7A9
	for <lists@lfdr.de>; Tue, 18 Feb 2025 22:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A821DB546;
	Tue, 18 Feb 2025 22:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIQO0EhB"
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1CE1D934B
	for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739918325; cv=none; b=EqqJRIs5r6V/Ydn42KKB5fDOBu2wiKbLHPM7oal93nv2qE0V542DlUaybLS8ccbBEHl10GFufFsTMfONe1vIloZgEjh/y3Z2C8meIVAQPdsEaVkFEsgnjJLcGQFSLNAhn/UO3tUWufysZCUnLbXpSFEF5tGGLJjfCMaoKon1vfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739918325; c=relaxed/simple;
	bh=X/w9dv6WCIb8khQItSdUJ4hRIaz8zS+I0fws+Q13vdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aj08Q/sauzfYSVNTeflwxO6jbWXnJtvCRD0PG0L7Z1Hha95Kdgw+46k1Qndk0/coUISnufEjt3ey1cI6dTg6DS/xheGW3YoxzYFYWfXWe0yVXWYx2dzoq1YSGqYreOIOqNsEAqpBfIibPW2rEQ7vW0qHH7oTwPzlFNzyxIn4gNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIQO0EhB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-abb9709b5b5so520088766b.2
        for <ksummit@lists.linux.dev>; Tue, 18 Feb 2025 14:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739918322; x=1740523122; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/w9dv6WCIb8khQItSdUJ4hRIaz8zS+I0fws+Q13vdg=;
        b=eIQO0EhBFQ0xsZPd0QyHoN/F0FUOebn2Gowyb86XNSUX7uYc4ddziyouvc5uAjpBX6
         atB9a46HWdjuEgqfvp2b4XRasGmciqEldBEqObfRcD3r9y3s/w6xOYACIp1EHZuAyNrY
         4oQYY47qkl2ZiM9EI0K64g/uI65nhW3CkJa/ahjN3Z5lZ4b1BeTRLeD4rjdSbmAGc7Qp
         OXMVrgFa8SaBlhz+ujnHEuVdzcaE65EQdKDpUF/8OrcmVWMkccRz3pek85/SRFkM5AZc
         gXHB7vuWcBsnSEnAmKkfOQVVyRahiYL5Tefxcr/kI4SLFzY91g0wdS/57LP6yQw9mX3F
         t6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739918322; x=1740523122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/w9dv6WCIb8khQItSdUJ4hRIaz8zS+I0fws+Q13vdg=;
        b=NgLdmp5xFTdhmPze0PtassEh6nXdQEEe/6KLdvghjrPH50WN3FQDzXxRksR8Qn7ZPI
         l7f78XxODK941T4vp8S8umRuychcZSbiHZViZpwhEZ8tkwj7XFMzNY+YGLLgWg6BWknK
         F/Xos+EGY8GyferbDhdd89GwMtSt4PRlAb2MtaTJc/oZ/HUi0QquoRo9DT49ANlEmBDO
         gp77iu5uGsdTY6gCSUR4tLD1SI96wL2+ywbWsuQp8V+D8iMEWNwj1afg0widTCCZVQjU
         7ptEpyDy6Y/7uudYKz9fHwD4UgNzlVUt+4QO9gfZGCc5OxGGT3kCkyjw0WPBOhJhvhTa
         9gSg==
X-Forwarded-Encrypted: i=1; AJvYcCWCSoB7LZnUjYpjANXHt3Zo27x1KsyYu5JaXxTnESlRps17ZDLRz7jzxUKVbUOrTo4bQjOnI/BI@lists.linux.dev
X-Gm-Message-State: AOJu0YzLQX9t+jo6Cll7xweHLPA0aRXT8SpVfXlUYYWNybSEidhepQKp
	eZPg/oJJ9UrWaHyN7YHa+oOKTvyEEpdMtovqIRAKeLYG/Mr9S6iI7fesy7Z7iTYoXKjyQmil6oH
	gt69mzAKcEx3iFvERyY1Y4/J509mHhA==
X-Gm-Gg: ASbGncuhdCsNaSJISAz8WHMnIshMw1VLrvOOcc7a58zgLSdA1LHAo6UiAEY/cHhLCnk
	6CI7qaW8fYqVNF1sBBBfJmznD/XweXUDsb9GrBMu2joDa7/rxc/x0fmppn91mAKTUF/O+EYM=
X-Google-Smtp-Source: AGHT+IE0KrBd630x4dCMI73nbxYD+2oUb+XNu+r9g+15xy1qsYaOv1o/LXN3NckjPiVNRFUr2VFrDcLSe32/twzUEso=
X-Received: by 2002:a17:907:60d6:b0:ab7:ef48:1668 with SMTP id
 a640c23a62f3a-abb711c382fmr1511816266b.57.1739918321797; Tue, 18 Feb 2025
 14:38:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
In-Reply-To: <326CC09B-8565-4443-ACC5-045092260677@zytor.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 19 Feb 2025 08:38:29 +1000
X-Gm-Features: AWEUYZnxnanMLXuDMA2c6TgTwYwzjKTQk_SYXC889XG81ahvm8TLQqszxHmmj9o
Message-ID: <CAPM=9tyWvKcUnP2XJh5G=4nSCjum69phxNpOG8adPunQ+3TNdA@mail.gmail.com>
Subject: Re: Rust kernel policy
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Greg KH <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I have a few issues with Rust in the kernel:
>
> 1. It seems to be held to a *completely* different and much lower standar=
d than the C code as far as stability. For C code we typically require that=
 it can compile with a 10-year-old version of gcc, but from what I have see=
n there have been cases where Rust level code required not the latest bleed=
ing edge compiler, not even a release version.
>

This is a maturity thing, as the rust code matures and distros start
shipping things written in rust, this requirement will tighten in, as
long as there is little rust code in the kernel that anyone cares
about why would they want to lock down to a few years old compiler,
when nobody is asking for that except people who aren't writing rust
code at all. It will happen, there is already a baseline rust
compiler, again until there is enough code in the kernel that bumping
the compiler for new features is an impediment it should be fine, but
at the point where everyone is trying to stop rust from maturing, this
talking point is kinda not well thought through.

> 2. Does Rust even support all the targets for Linux?

Does it need to *yet*? This might be a blocker as rust moves into the
core kernel, but we aren't there yet, it's all just bindings to the
core kernel, yes eventually that hurdle has to be jumped, but it isn't
yet, I also suspect if we rewrite a major core piece of kernel, it
will coexist with the C implementation for a short while, and maybe
that will help us make decisions around the value of all the targets
we support vs the effort. Again this is a maturity problem down the
line, it isn't a problem right now. It's also a good chance gcc-rs
project will mature enough to make the point moot in the meantime.

>
> 3. I still feel that we should consider whether it would make sense to co=
mpile the *entire* kernel with a C++ compiler. I know there is a huge amoun=
t of hatred against C++, and I agree with a lot of it =E2=80=93 *but* I fee=
l that the last few C++ releases (C++14 at a minimum to be specific, with C=
++17 a strong want) actually resolved what I personally consider to have be=
en the worst problems.
>
> As far as I understand, Rust-style memory safety is being worked on for C=
++; I don't know if that will require changes to the core language or if it=
 is implementable in library code.

No it isn't, C++ has not had any rust-style memory safety topics
manage to get anywhere, C++ is just not moving here, Sean Baxter
(circle compiler developer) has proposed safety extensions and has
been turned away. Yes templates would be useful, but maintaining a
block on all the pieces of C++ that aren't useful is hard, I'm not
even sure expert C++ programmers will spot all of that, again Linus
has show no inclination towards C++ so I think you can call it a dead
end.

Dave.

