Return-Path: <ksummit+bounces-1869-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B8EA41833
	for <lists@lfdr.de>; Mon, 24 Feb 2025 10:09:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35BE1189535E
	for <lists@lfdr.de>; Mon, 24 Feb 2025 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECD1244E8F;
	Mon, 24 Feb 2025 09:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFaE+Nd5"
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC9243947
	for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740388140; cv=none; b=l/YjnRnFpfkNXBAWUD/+h1oTX8qVYVuYrL8QfPAxpgQz3XDPoS7I9gjflDxWeO68rL1hdsSfJnECrXpTnqzopK6IXvc0+9pI9mKuJvbgFSyRboDjmPHeSeEslR20ra1Nm5C6seLE71Y3cDLQhOfHgjznMsk29JxmOqNVu8enJRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740388140; c=relaxed/simple;
	bh=daM8eCpYsb21gX9QsirhUsHYuQ1YdkY3jqPS9x3ir38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cLgpXfyRpRANC3j4lk6XZb7ilVMCLMcYgQtjmqyI8cBYvCxQ6iPhazTNzcVWYwDkMcTI42f9zcY32n7PhJypH6OJPnrKcYyELZw91qING5fw2/LEvjazggqNZOu8f3MgOzQSVjOIn/nVkoGoNQh4KKpMP9H1P5LjkyxXfW9HFt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFaE+Nd5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c0a5aa0f84so364867285a.1
        for <ksummit@lists.linux.dev>; Mon, 24 Feb 2025 01:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740388137; x=1740992937; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8Z8QEwUCxkupWd1+3HNImprL2CAvRRP+kS3TrK5QZE=;
        b=NFaE+Nd5ekfHCkuFk3YgNAsdJRPr0P9HZIk/amBDopF+2t9z/zq+Su9U1J/Qqs7RXa
         MvGughfpXJdajj/DL+McEIZcrVv74LpW8QS0aH3W5yzvbRVI9XiCG8N3LeMW4Zp6d6IB
         9qsCgBRBU+JT0uFYLHRRe5o5+tt9OK7rxiVpxGojfy/WkINumiPyeqH7BNpqaC/wRiMk
         RdWHUIjxDXOhajZYNgN4uACp7ihGEgDEWL4rJj3zeS1eAksenLQX7A9dhyHCMnexDSaJ
         tmp+nXatmtJqztPWNlEeQRX1dG73XTcjkOJ5r4POfi4tCP/dEHxtIrily1BwOHA8+7rU
         KqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740388137; x=1740992937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8Z8QEwUCxkupWd1+3HNImprL2CAvRRP+kS3TrK5QZE=;
        b=VZ0bKq0OKfOyYaJtIkQzBJRzQhHO06y/C22CPZowk2QVEqGWxT2IY0triDGvd4SFOr
         /ExbXRhnRz86UrrDbNbvx3kr7tqcIORgkTztbn7ywezNdu8HHWA0lgNCxhu0oTwEaSCq
         2M3UnA4YeptjepVh8lZCV5OOUaiBLwPh58E6vr7rImyzDunvVPHOPE9mj7YdnezKnRP9
         gefbOdOAEzgF+nCYrJj0+5DbzVdbDSscSqKoPUE4+YSdeB4/iqlZ2SBLFwjoW1OZY7as
         7M+7Yxo6H0ARJpHb3RTYudJKWkSJ855e/iusiwTUSfMhq3ymV55OCRYaeQHds8mCR1lt
         slcw==
X-Forwarded-Encrypted: i=1; AJvYcCUz0wN0RI5pjnvp4CX1QypxSKqEebaOF0dre9iE5hi0JVFKTQkk0hbv7eKMs1ROCqXUOZKD+7+4@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl11NejFkeC2vAwaUb+wr0wWEiWUpxAJG0aIzBcokXaAU3qe+4
	94nFw/zSFhB1tv2hdW87FIHhNDR1Kw4vAVb1d706FIxENtCcHdDx3D4Qaq816kMjZ9+PwPdlKlb
	AVIDvloEZTSdoh+UV4a+VxYrRfdw6+vrf
X-Gm-Gg: ASbGncsVCzkuIL8AeiaIWQFIfoTD3+v6c/NDEMZya1MPqeB8V6x9zqE09+WlMj6E5f6
	zFl5j4v5BKpaOfdO/SWor+FpW3c8IRbo1ZIwJRbTAXT3qRqzvIyjzjRBChnGswU+8wUgZldQlUd
	6pz/PdQ9Bz
X-Google-Smtp-Source: AGHT+IGjG8I5drO+X1eEUiibGtzlCaFmdmDDWxEcy/DATfn0GZv0YcS1x2zAkBvkENKOLf26xD8UR2442xGniu3XVH8=
X-Received: by 2002:a05:620a:4405:b0:7a8:554:c368 with SMTP id
 af79cd13be357-7c0c2164e93mr2368642885a.6.1740388137584; Mon, 24 Feb 2025
 01:08:57 -0800 (PST)
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
 <2025021954-flaccid-pucker-f7d9@gregkh> <4e316b01634642cf4fbb087ec8809d93c4b7822c.camel@tugraz.at>
 <2025022024-blooper-rippling-2667@gregkh> <1d43700546b82cf035e24d192e1f301c930432a3.camel@tugraz.at>
 <D7ZDF8NZGPS3.3QBMAVC1NTUDM@maslowski.xyz> <E0BD1BDB-0EBC-4E27-9324-7CA70ACE194B@gmail.com>
In-Reply-To: <E0BD1BDB-0EBC-4E27-9324-7CA70ACE194B@gmail.com>
From: Ventura Jack <venturajack85@gmail.com>
Date: Mon, 24 Feb 2025 02:08:45 -0700
X-Gm-Features: AWEUYZnfy9opWscz-4jFfz1MccFJtXuWWbjaTV1FP0XPTI4GXNbYujZ-2jgW9oU
Message-ID: <CAFJgqgSCW9XbVYr7yTa47Miax+LGM9jNNE5Yuw1xQE2BZ9gkTQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: comex <comexk@gmail.com>
Cc: =?UTF-8?Q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>, 
	Martin Uecker <uecker@tugraz.at>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, David Airlie <airlied@gmail.com>, 
	linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 4:32=E2=80=AFPM comex <comexk@gmail.com> wrote:
>
> > On Feb 22, 2025, at 3:42=E2=80=AFPM, Piotr Mas=C5=82owski <piotr@maslow=
ski.xyz> wrote:
> >
> > I'm sure you already know this, but the idea of safety in Rust isn't
> > just about making elementary language constructs safe. Rather, it is
> > primarily about designing types and code in such a way one can't "use
> > them wrong=E2=80=9D.
>
> And importantly, it=E2=80=99s very hard to replicate this approach in C, =
even in a hypothetical =E2=80=98C + borrow checker=E2=80=99, because C has =
no generic types.  Not all abstractions need generics, but many do.

True, a more expressive and complex language like Rust, C++, Swift,
Haskell, etc. will typically have better facilities for creating good
abstractions. That expressiveness has its trade-offs. I do think the
costs of expressive and complex languages can very much be worth it
for many different kinds of projects. A rule of thumb may be that a
language that is expressive and complex, may allow writing programs
that are simpler relative to if those programs were written in a
simpler and less expressive language. But one should research and be
aware that there are trade-offs for a language being expressive and
complex. In a simplistic view, a language designer will try to
maximize the benefits from expressiveness of a complex language, and
try to minimize the costs of that expressiveness and complexity.

Rust stands out due to its lifetimes and borrow checker, in addition
to it being newer and having momentum.

What are the trade-offs of a more complex language? One trade-off is
that implementing a compiler for the language can be a larger and more
difficult undertaking than if the language was simpler. As an example,
to date, there is only one major Rust compiler, rustc, while gccrs is
not yet ready. Another example is that it can be more difficult to
ensure high quality of a compiler for a complex language than for a
simpler language.

Best, VJ.

