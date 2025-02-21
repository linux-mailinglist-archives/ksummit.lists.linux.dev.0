Return-Path: <ksummit+bounces-1779-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF48A3E938
	for <lists@lfdr.de>; Fri, 21 Feb 2025 01:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC630421F33
	for <lists@lfdr.de>; Fri, 21 Feb 2025 00:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D2DB67E;
	Fri, 21 Feb 2025 00:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QadirOvb"
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F497B673
	for <ksummit@lists.linux.dev>; Fri, 21 Feb 2025 00:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740098422; cv=none; b=XH44KvZ9LhhuC7/uZrtGhqDXrXY5k4YceprlFEH58MjLUA2FcJ0ouwq2lnlxiO7ka3EWpoIFpjSsZNeCx3srcyEuYFMtHnkVV4cCNDhMZ5JDj0h8Cg8mpo7mg3u3u6HYK2GIoW3MCb5iah4IgkB9i32pwgwelhAofeV+sy+VYuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740098422; c=relaxed/simple;
	bh=4TZmT0OVj6lmyqRooEpFA8ZqX8x6sU7ElubS1e40FT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mhapdg8Y58IUc70RNzCp/UXceGW3tPm4crgHT3qIH7zKu3RnXHYURyHrig3qKMKBmjNZtWV1Gb7p5dLp1QsATzvEcVLzQ8fnU1m5NM9pGN2a9c6sPVispQDRtrL7sWOrhZUwgvrymMeLAKTsP6ftn0JiCx2Vrx6Lp9hq3n+cZ7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QadirOvb; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-abadccdfe5aso267180066b.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 16:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740098418; x=1740703218; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IIRyFU8js5MTrYu3kLLDCqOpLqxeTQMOioCoscja6X0=;
        b=QadirOvb2ef4OFwr8jmeGQBnSwrB9vi97eel4jPPygH6MEeGEZOXBeYEDVsbde9QUJ
         MGPFFxqpjNO12duZas/E4/hKP60HSTE3v9eDO2AJCtR7OAoPb58Qbk1f+8h8xNbghUUA
         yS9eZzG/O3gLtruTQQMyeFbBCjRqayJv67m7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740098418; x=1740703218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIRyFU8js5MTrYu3kLLDCqOpLqxeTQMOioCoscja6X0=;
        b=vVvutKYnjQhO5EN/JuThkNDDeUXflcpjJBd8pB7xfptQUJklyiSomfhIdPR2IWhzmM
         2YsLxjQ6SMEtIO9XJjtyP+0EeJmhIIZeH2aFyQfy7wCrCollspM1aIZS8URGZqn7xGsk
         LAAbnRpuPBTyjALaNTgkBAuLxEsev5vkNsIjgyUcJ/XyZHUbJAh5aUcc7a5OlPFlJf7g
         molcAO9KrsF5fu38OgvhkGLRXpIJFwNdUviecjEAeoD/sQ3hXTXK+oM3RRQdYnxJmRLL
         fBjNv5c20PIGZisJDidK1kaFRs7AqAz5UkqBLvOel4WtPT2N3uyrDoqQ14MTdYF9+Se7
         76uQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVybimgiO/woanGKLBxF3saqkkrVM1IWzAR5+2YyJtZWCSHa47FNmtSLz6RwdHoeTXMU1uRAaf@lists.linux.dev
X-Gm-Message-State: AOJu0YxmgwgivpeJ1vbNbKDiHwmr+8/d8ol83EXYS53olczRXUzcdzU+
	ejibjsgppiUQY3n9eNMZ7GHjD5i78TDWNoi3gQcOaE6drfl+g9rj24mKpR+KBPd5ojK/4E9X3Q8
	1Wes=
X-Gm-Gg: ASbGncsibokXyIinNYQl0uLAgKIy3CyWNsIH0Qp+IoCzhjgbixvqUKuMTHKnKJfIp8m
	yapPV+4zIJAufF7cGqV0r9ISd5lmhn4TjFgD0tiMcBMdNysudUzoJKENPFsdDL6fMPJVRvZRCt0
	Nc1gANKqvjXvAFzhHcC+Svmf/Vs7EvYOVqylmbOYtv/1RXFZTiR01kT6fRptpb1FEP3kRRaNNCx
	XtZaTk0Jpp7fEi2ZzVcK1mpqtwzGXl6tXMxdUWILArg0LdPBboc11jpos2n3Cvkd5eJ5CXhGrqW
	H3mQ4zH0L/1VnwnXOwecxQHjq14wfv7SlLlEcEHYxL53Nrhy+loD8kNpmtu44uVKvA==
X-Google-Smtp-Source: AGHT+IHcr7DB7YzJrrs+En72jY752XklMw2tn5yUyDQFqty+H0XIsqohOBGOdaGzlZdmwZrXoMpM7g==
X-Received: by 2002:a17:907:7216:b0:ab7:ef49:23a7 with SMTP id a640c23a62f3a-abc0de5bd55mr68079066b.51.1740098417456;
        Thu, 20 Feb 2025 16:40:17 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5323202dsm1542697066b.6.2025.02.20.16.40.15
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 16:40:16 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abadccdfe5aso267176466b.0
        for <ksummit@lists.linux.dev>; Thu, 20 Feb 2025 16:40:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWR1smt0K8zUGp/fr2JokskPw0c2LJ82os/TCCyXpq5XyM2ed+1bXqs7NpW8U6bklJUGTEcU1ER@lists.linux.dev
X-Received: by 2002:a17:906:f5a9:b0:abb:a88d:ddaf with SMTP id
 a640c23a62f3a-abc0df5d5a1mr76770566b.55.1740098415082; Thu, 20 Feb 2025
 16:40:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org>
In-Reply-To: <Z7bO1jT2onZFZwgH@infradead.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Feb 2025 16:39:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgLbz1Bm8QhmJ4dJGSmTuV5w_R0Gwvg5kHrYr4Ko9dUHQ@mail.gmail.com>
X-Gm-Features: AWEUYZl110dqtgnPbf_5O23eqr6Efb1z5WIykrA3dNVGStovQIgnPSeO4hmGu6I
Message-ID: <CAHk-=wgLbz1Bm8QhmJ4dJGSmTuV5w_R0Gwvg5kHrYr4Ko9dUHQ@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Christoph Hellwig <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 22:42, Christoph Hellwig <hch@infradead.org> wrote:
>
> The document claims no subsystem is forced to take Rust.  That's proven
> to be wrong by Linus.  And while you might not have known that when
> writing the document, you absolutely did when posting it to the list.

I was hopeful, and I've tried to just see if this long thread results
in anything constructive, but this seems to be going backwards (or at
least not forwards).

The fact is, the pull request you objected to DID NOT TOUCH THE DMA
LAYER AT ALL.

It was literally just another user of it, in a completely separate
subdirectory, that didn't change the code you maintain in _any_ way,
shape, or form.

I find it distressing that you are complaining about new users of your
code, and then you keep bringing up these kinds of complete garbage
arguments.

Honestly, what you have been doing is basically saying "as a DMA
maintainer I control what the DMA code is used for".

And that is not how *any* of this works.

What's next? Saying that particular drivers can't do DMA, because you
don't like that device, and as a DMA maintainer you control who can
use the DMA code?

That's _literally_ exactly what you are trying to do with the Rust code.

You are saying that you disagree with Rust - which is fine, nobody has
ever required you to write or read Rust code.

But then you take that stance to mean that the Rust code cannot even
use or interface to code you maintain.

So let me be very clear: if you as a maintainer feel that you control
who or what can use your code, YOU ARE WRONG.

I respect you technically, and I like working with you.

And no, I am not looking for yes-men, and I like it when you call me
out on my bullshit. I say some stupid things at times, there needs to
be people who just stand up to me and tell me I'm full of shit.

But now I'm calling you out on *YOURS*.

So this email is not about some "Rust policy". This email is about a
much bigger issue: as a maintainer you are in charge of your code,
sure - but you are not in charge of who uses the end result and how.

You don't have to like Rust. You don't have to care about it. That's
been made clear pretty much from the very beginning, that nobody is
forced to suddenly have to learn a new language, and that people who
want to work purely on the C side can very much continue to do so.

So to get back to the very core of your statement:

   "The document claims no subsystem is forced to take Rust"

that is very much true.

You are not forced to take any Rust code, or care about any Rust code
in the DMA code. You can ignore it.

But "ignore the Rust side" automatically also means that you don't
have any *say* on the Rust side.

You can't have it both ways. You can't say "I want to have nothing to
do with Rust", and then in the very next sentence say "And that means
that the Rust code that I will ignore cannot use the C interfaces I
maintain".

Maintainers who *want* to be involved in the Rust side can be involved
in it, and by being involved with it, they will have some say in what
the Rust bindings look like. They basically become the maintainers of
the Rust interfaces too.

But maintainers who are taking the "I don't want to deal with Rust"
option also then basically will obviously not have to bother with the
Rust bindings - but as a result they also won't have any say on what
goes on on the Rust side.

So when you change the C interfaces, the Rust people will have to deal
with the fallout, and will have to fix the Rust bindings. That's kind
of the promise here: there's that "wall of protection" around C
developers that don't want to deal with Rust issues in the promise
that they don't *have* to deal with Rust.

But that "wall of protection" basically goes both ways. If you don't
want to deal with the Rust code, you get no *say* on the Rust code.

Put another way: the "nobody is forced to deal with Rust" does not
imply "everybody is allowed to veto any Rust code".

See?

And no, I don't actually think it needs to be all that
black-and-white. I've stated the above in very black-and-white terms
("becoming a maintainer of the Rust bindings too" vs "don't want to
deal with Rust at all"), but in many cases I suspect it will be a much
less harsh of a line, where a subsystem maintainer may be *aware* of
the Rust bindings, and willing to work with the Rust side, but perhaps
not hugely actively involved.

So it really doesn't have to be an "all or nothing" situation.

                  Linus

