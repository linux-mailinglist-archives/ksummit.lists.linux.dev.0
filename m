Return-Path: <ksummit+bounces-1769-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA854A3E157
	for <lists@lfdr.de>; Thu, 20 Feb 2025 17:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1F107A9DFC
	for <lists@lfdr.de>; Thu, 20 Feb 2025 16:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254D321325D;
	Thu, 20 Feb 2025 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="M9xfZsZR"
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454BE212B14
	for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 16:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740070040; cv=none; b=sjrr/iVoZzas6lwgLM7ErPozwGzIcgS1rleW0MgJ5MQOtVUOJSxQpChQbkc4IV2w3P7wDFe+cM5kx7U+RNCxZDMYDeLG8WbVeh/51FNDAnt7yADNzwO8jL8tUxwxuniBN0FJm7zHJNFtIgzS2E1TVCWlBKkJVV2qgDimmJ1E7k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740070040; c=relaxed/simple;
	bh=dQbcpcb/Fr1fg1CoD0pZkGdNzzEl80AydjsiI1ZsQkE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJeRND2ZZo2GnRxkkXm7kRaFQMGtAli21/OjlS8mplk2WE6UyhGKcUT5ZQcSG/0BnKUrzV69uPhV0iKL35DpuoO2KevDK/cVrIho8lV7dN9nsyL5qlNnClRqurIhL/eze2B6EjbjphZXMSj4/SN7DoKV82o2cREgSmdTTF76itA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=M9xfZsZR; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so457241a12.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 08:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740070036; x=1740674836; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YZPfZYNg8NOtUAiK1S11L7/kf32fZfQ/BKwR+IkGA/Y=;
        b=M9xfZsZRhyxMmJECNZ9YAFDIkcWQdly9A15hDAN6UZB8czrs/11QRkIcaz5n/0ZGzY
         z5EMhdwRu5rfzFEHmUHqp8eI6TWJvNYEYhdi1dd6au4O6qFDEI8VS+Ri3IjdHEkKCKTk
         ZWciSQLHwuHzXs8RkPe/gvhjwZKw5v1ilVTug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740070036; x=1740674836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YZPfZYNg8NOtUAiK1S11L7/kf32fZfQ/BKwR+IkGA/Y=;
        b=mpYcCr7hVQJLeB38LXQXM6q7r2EwJVPrkFsPOm6k4t5vc/SOZNYntKGdQ9OfL9bZpb
         KIqp0orLxbZUmIrO8DFcXt2VQjY49K57lKV+sP0ZnJ46yXtcE+Z0JU0VZ2I7leZ6ZyPN
         SL5kUfAY7ek02H0zlQyohxHFUgowTB4QOobPtqNR1B/v8GAbnSxJswds2YTW2DyKHB/M
         fR2UDCJP6GF79zIO5YlifhAYzYd2D1e8ZW0+xP9HY+9KoeNpsYM91OpaHErJpJ9o1RHf
         hhUIIkKj+JeXBNmJX1KBwxBqO+Gt7kUQtj1ibL1T/klY/10eoiDXBYGa48tGc/yNS9EK
         33nA==
X-Forwarded-Encrypted: i=1; AJvYcCUdZI/n69e+CyiII3tNwZS406SGUqFTigwNL/3k1+byjGUmmM1R7/gXVwRrjgCK7dvVKdCwjCs6@lists.linux.dev
X-Gm-Message-State: AOJu0YzQxyymAcRsUKvZB19lrWmACjnab9W2LWmgYBhMqPP2C/Uy68z+
	+KuOo2arg//gV43Gzq4FRAp+rdvQBNxku3G83xVmxxn1eEm+n3EO0ZMvCIwcU5OsQGfJcC8S3YT
	MlGo=
X-Gm-Gg: ASbGncsR9MDm2SsbVVpqFyMHXiwMpwI/4sIgAR+ml5CwqceNQrWWOj+HPFh9MHgJKEp
	pXIRP77r0t7gQw3fyxNtmVZDvXpwejY5AnAs56KGm9bDIQBYCCdVJHnmxr5xluipHkjPnVjk49p
	wjRaYDK76Y/mUCc1FO9ihVLd+2dTEEChlmtSHES0P9p5KfVqZurt5KC2LhJ1KDBu4MiJqId8HAS
	QpLTUmCsiHwJH2k9mt/bfYEfZDr5NptTgcZiG8LhOu4nqDecm0JpuF19S2D7JtDbAhN+pbYOJiP
	Dp/SHaNXje8xx9f2NXu1r3dQLu7jFwrXtJA0aCBosYDMfiV2EiSibqf/Fe5dYy4xxQ==
X-Google-Smtp-Source: AGHT+IFKx8Dphcso2uPdpSzE0MSEblx2cvNMuFRraG6nNuQFNUuU54a520v0J3TgWailuosBEMMw4Q==
X-Received: by 2002:a17:907:7f90:b0:abb:e958:2eb0 with SMTP id a640c23a62f3a-abc09c10e1amr392266b.39.1740070036158;
        Thu, 20 Feb 2025 08:47:16 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbb297ccd6sm603300466b.160.2025.02.20.08.47.14
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 08:47:14 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-abbac134a19so196838666b.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 08:47:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUx5YbSrw7mfvOUXXLyRN0/MzeqE2Qr6dI5ukhd2O8J52DMpsHE3NH21wEMSkqrXtPHenzo4qoC@lists.linux.dev
X-Received: by 2002:a17:907:7743:b0:ab9:137d:f6e7 with SMTP id
 a640c23a62f3a-abc099ca6bfmr2068366b.7.1740070033907; Thu, 20 Feb 2025
 08:47:13 -0800 (PST)
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
 <2025021954-flaccid-pucker-f7d9@gregkh> <2nn05osp-9538-11n6-5650-p87s31pnnqn0@vanv.qr>
 <2025022052-ferment-vice-a30b@gregkh> <9B01858A-7EBD-4570-AC51-3F66B2B1E868@zytor.com>
 <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
In-Reply-To: <n05p910s-r5o3-0n36-5s44-qr769prp69r5@vanv.qr>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Feb 2025 08:46:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgb1g9VVHRaAnJjrfRFWAOVT2ouNOMqt0js8h3D6zvHDw@mail.gmail.com>
X-Gm-Features: AWEUYZnMkN-x0Rtej4417GBTUm2ZZTOyavgfNoxIwCkZFobkcHssn8sD-O-61LI
Message-ID: <CAHk-=wgb1g9VVHRaAnJjrfRFWAOVT2ouNOMqt0js8h3D6zvHDw@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Jan Engelhardt <ej@inai.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Greg KH <gregkh@linuxfoundation.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Feb 2025 at 07:17, Jan Engelhardt <ej@inai.de> wrote:
>
>
> On Thursday 2025-02-20 14:23, H. Peter Anvin wrote:
> >
> >People writing C seem to have a real aversion for using structures
> >as values (arguments, return values or assignments) even though that
> >has been valid since at least C90 and can genuinely produce better
> >code in some cases.
>
> The aversion stems from compilers producing "worse" ASM to this
> date, as in this case for example:

We actually use structures for arguments and return values in the
kernel, and it really does generate better code - but only for
specific situations.

In particular, it really only works well for structures that fit in
two registers. That's the magic cut-off point, partly due calling
convention rules, but also due to compiler implementation issues (ie
gcc has lots of special code for two registers, I am pretty sure clang
does too).

So in the kernel, we use this whole "pass structures around by value"
(either as arguments or return values) mainly in very specific areas.
The main - and historical: we've been doing it for decades - case is
the page table entries. But there are other cases where it happens.

The other problem with aggregate data particularly for return values
is that it gets quite syntactically ugly in C. You can't do ad-hoc
things like

   { a, b } = function_with_two_return_values();

like you can in some other languages (eg python), so it only tends to
work cleanly only with things that really are "one" thing, and it gets
pretty ugly if you want to return something like an error value in
addition to some other thing.

Again, page table entries are a perfect example of where passing
aggregate values around works really well, and we have done it for a
long long time because of that.

            Linus

