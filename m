Return-Path: <ksummit+bounces-1865-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6E5A410E8
	for <lists@lfdr.de>; Sun, 23 Feb 2025 19:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA4133AC2C7
	for <lists@lfdr.de>; Sun, 23 Feb 2025 18:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C161178CC8;
	Sun, 23 Feb 2025 18:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WAcgxMqM"
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F48D84037
	for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740335531; cv=none; b=CwpYgQ63VwnZaohJ6Mtq+bPHLOyiuqwJGwh0Xa1Keh0Sq7AP3QZnQKoo6mSYFh6+Sq+VfCOs24VCFuiqayzS9J45qSS9+mnSLlugrnyu/FDuGQkYSGDfsKCDgCb6pno6c7SFtPCgoBRdTEhwxPRX6peWsD2XSuN0D5kYXGob5GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740335531; c=relaxed/simple;
	bh=F16gjWpfzILm5UlOwuP2B/0g3980gm949Ip5/wshaZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DhvjX9cE6JUX85tBZLkGRjjkNkX8nvBtWU2CzLyLcXlLEg0F/F0H5TlXcqww1KyeT4BcNAB2oPntt/RBX5pkWaVoPxouqZmcBkpp8xL7EqVQTlPX3BLA0HJTTNg4QOmP94fPms86eB4rKqSgTSabBMaQxIU9MmwqUt3T8XdzO7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WAcgxMqM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so6655205a12.1
        for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 10:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740335527; x=1740940327; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TcuxBHhEa12WEoosMAkaHe0om9pJLB2v6SQU4kBUAzc=;
        b=WAcgxMqMVVweNPRUCs1LYHdnjq/OCQkaF18NfsnN2fGmu0pXADxUZRDWLAYUi5D00+
         dx1mC+sSDfN6MEBpevKsGMzeNE52iZfsYOlBU1prhyG/JeW7aoV8nGmu5oqz4L5nshVM
         uM8l4RJcSiFuumqgQXjZl7A9J2h03mkH97lkg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740335527; x=1740940327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcuxBHhEa12WEoosMAkaHe0om9pJLB2v6SQU4kBUAzc=;
        b=rFCeI4+RmU9/RuAw5xdVTtoYQcoAoLaJJH3yL5S1W5D26DZ8J5aGjjgR6WFjQ1zp3p
         EDCBWAcZtERKz9dOywQbachfFvDJtFtH1DSkiBorAao8iQkcPWh2xEkF0KhROBgXTmJ9
         sIBL/bAPqEuBfUin3rsMhpBt2V0oqlO29gBsy0aK9i0SK+T0yyBD2CoulIUrp69VV4Le
         /EWOQggzhoDkohOyJFNx9sDY7ivpdhnoA3lt7og0uKGX5vPeVi9ZaC2zE/gjl01ak//5
         ku0O6Wg3gvN4nHaMIcQYWa1mlp/QYCx6jYXip38EX4FVIWgicTNn30ZS2xqNzawKY6cp
         L7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4wo2I6wVjA07YFaMjR1pizD5G5Crs/XPoxuaHlQlA23jSZ0yBdHj7e3hbPH1oTF4cAqLf1O/P@lists.linux.dev
X-Gm-Message-State: AOJu0YxhzEvS1CtNLVkL+FnQpZR8gVadIU0jXRsbGV0lFd/OAxXaimi4
	c3Qk6ogtx34Gviu0RPuln1txuVCxhtgY9lk/GL911FpOukkA0Uj4yEOwV7qqjuNp8PVmm1bNpyH
	R42U=
X-Gm-Gg: ASbGncuyi6OQrzrmyUpQ+IGEh8z2Nex+HM8g9O0qZwcyhem6rhCLo/jd/T0iHAXRh20
	HkAnFPPMDvwhrwESRKYKQwn2jER0qBEJ7kRPt9A5+D9dJaOB/sxIik4hivh2FAijhj3UyV92dud
	E2unVNoE9Aojj2J6XicjVl2T94M0eScXY2wyqyakE3sVBFpEPpkku4383UkbNMwXgGVVnkMLOjF
	eWcSolaSxJkG9Sr0SV87vj5Jw566lEZjLDyEdWLWCVznkhcsWUVlA6JbqfGRUZVuupCMU2EMYXk
	Y70i8kLD2M+t880Zgq+JH94KKOtFXxDcvU43am5YJL8YlLevX2+rInb5s6P0Vbur3yXil4Kzqj6
	P
X-Google-Smtp-Source: AGHT+IFCHLMa3P2juchtsrtMJrF5kdQckhv2TJntMKf9LpdmJznqOK5VV6XB/7nxixQLKvcOCRfTjQ==
X-Received: by 2002:a17:907:94cf:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-abc09e2f100mr1178844866b.56.1740335527536;
        Sun, 23 Feb 2025 10:32:07 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb82771809sm1610712266b.171.2025.02.23.10.32.06
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2025 10:32:06 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so6176660a12.2
        for <ksummit@lists.linux.dev>; Sun, 23 Feb 2025 10:32:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWMtihzEORALGtKq/TnSMSfrJFe7T/tL3d1b87JkceTXH96tOvdJSrKZWQBldl1Q30m2d2sH8ao@lists.linux.dev
X-Received: by 2002:a17:906:6a10:b0:ab7:76d7:dcb with SMTP id
 a640c23a62f3a-abc09a97b01mr1026613166b.28.1740335526003; Sun, 23 Feb 2025
 10:32:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72m-R0tOakf=j7BZ78jDHdy=9-fvZbAT8j91Je2Bxy0sFg@mail.gmail.com>
 <Z7SwcnUzjZYfuJ4-@infradead.org> <CANiq72myjaA3Yyw_yyJ+uvUrZQcSLY_jNp65iKH8Y5xGY5tXPQ@mail.gmail.com>
 <Z7bO1jT2onZFZwgH@infradead.org> <CAHk-=wgLbz1Bm8QhmJ4dJGSmTuV5w_R0Gwvg5kHrYr4Ko9dUHQ@mail.gmail.com>
 <Z7hulnJ4fwslRILy@pollux> <20250223180330.GC15078@pendragon.ideasonboard.com>
In-Reply-To: <20250223180330.GC15078@pendragon.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 23 Feb 2025 10:31:49 -0800
X-Gmail-Original-Message-ID: <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com>
X-Gm-Features: AWEUYZmAe5aQKMqbMOvhjrLvqPDF0CXPi8iaHSYLNnVAdHMEHMUU3HW0e3qcqRo
Message-ID: <CAHk-=wie_Winz7CtRCM62S2b1pWKN2Jt2wdGHgFBv=aBU8qwqg@mail.gmail.com>
Subject: Re: Rust kernel policy
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Christoph Hellwig <hch@infradead.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 23 Feb 2025 at 10:03, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
>   > I can't answer for Linus, sorry.  But a generic "hey, this broke our
>   > working toolchain builds" is something that is much much much
>   > different than "an api changed so I now have to turn off this driver
>   > in my build" issue.
>
>   I haven't found a clear statement from Linus on this topic.
>
> Those three statements can't all be true together, we can at best have
> two. I would like to understand which one we will drop first, and I
> believe many other developers and maintainers are wondering the same.

This is literally why linux-next exists. It's where breakage is
supposed to be found.

And guys, you have to realize that there is no such thing as "works
every time". Just this merge window, we had a case where I didn't pull
some stuff because it broke 'bindgen', and the reason was simply that
not a lot of people seem to be running the rust builds on linux-next.
But realistically, my normal build testing has had rust enabled for
the last year or so, and that was literally the first time something
like this happened.

So be realistic: can rust cause toolchain problems? Sure.

But we have that issue - and we've had it *much*more* - with the
regular C side too. We have those kinds of issues pretty much every
single release, and it's usually "this doesn't build on some esoteric
architecture that people don't test any more".

For example, this merge window I did have that unusual "this doesn't
work for my rust build" situation, but that one was caught and fixed
before the merge window even closed. Guess what *wasn't* caught, and
then wasn't fixed until -rc3? A bog-standard build error on the
esoteric platform called "i386".

Yes, linux-next is supposed to catch interactions between different
development trees. And yes, various build bots test different
configurations. But nothing is ever perfect, and you really shouldn't
expect it to be.

At the same time, people harping on some rust issues seem to do so not
because rust is any worse, but because they have internalized our
*normal* issues so much that they don't even think about them. EVERY
SINGLE RELEASE Guenter Rockl sends out his test-results for -rc1, and
EVERY SINGLE RELEASE we have new failed tests and most of the time we
have several build errors too.

Guys and gals - this is *normal*. You should expect it. Breakage
happens. All the time. And that has nothing to do with Rust. It has to
do with the fact that we are doing software development.

Ask yourself: how many problems has rust caused you in the last year?
I'm claiming that the main problem has been people who have been
forthing at the mouth, not the actual rust support.

So next time you want to write an email to complain about rust
support: take a look in the mirror.

Is the problem actually the rust code causing you issue, or is the
problem between the keyboard and the chair, and you just want to vent?

                 Linus

