Return-Path: <ksummit+bounces-674-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F40FA551D66
	for <lists@lfdr.de>; Mon, 20 Jun 2022 15:54:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F59B2809AB
	for <lists@lfdr.de>; Mon, 20 Jun 2022 13:54:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AEA2562;
	Mon, 20 Jun 2022 13:54:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14B081B
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 13:54:00 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-2ef5380669cso100998787b3.9
        for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wa9UYm6q62zcTAVluLSDZcOaagO69FLGhkszHaFhmOc=;
        b=CoTahcCGUhQq76vJZC0mfJeGQceHCSZOjnUhzNfAAX/HAlZb7buOkkx2AVYPdKrvKN
         zEiPI7hIhN40MRtig1nJWwwsVj/sv2x4QyrOubeLWf2LQgydzyWJl9i5fC2ArAWYp1F9
         E4ZEycncP+Y74j+636ZE5BSni3w7tVFpB2DapJjXE9jJw9xCAi8gOoN1nHd8TjwziCjl
         hnUJy2RrEvU7QBhB3pgezTIfjdqd/VxbOXygfVipy5+FvYxAKsdeV+isR4agcgqCdNBQ
         FiVjQmviiWoTfq9KZ9hVxPSgMbmTXPX6jEqqMPfUsJGhQuicCx9uYe1uwk9LKMdhsPkg
         wMVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wa9UYm6q62zcTAVluLSDZcOaagO69FLGhkszHaFhmOc=;
        b=1k23NVfdp5BU4kYLnA6r6ThKi7BFYzL29B8G3pr3kQcBzwbwNjs6DbjlcEDjYb/Qz9
         TmVqP1kxbegsZ99XyKYowuReClLBNWkzS55Z+MpauguqDAJWlESHfF3/yUg/Z/ufGkDY
         y+Zk1inXtjCZkbEfg6Q7QImGmiip2D/tNBQNyF4hp28LqNQErfbbNIAJg09pGwLuZh1p
         3J5WuTttxmryfw/dpPuvgVsz7a4D4wsEuuZQrD9w+hH3xPGsCLEfwroSxBvCnom/ta8t
         YRlJi8XajuE7m6jzd1mu2SnIaGVkcYSK8n8DGuJe0YuMGGsD6VjKp2hEmZBVFbznpoFv
         pKwA==
X-Gm-Message-State: AJIora9YzlPH+ubI7O9Abbwo09NAgzr+j19rA+UTHwY/r4znv2EYBpDs
	erz9cIcHdfQ0FlipzLaKF9C8LRHq9+gplE6Td14Ycw==
X-Google-Smtp-Source: AGRyM1tJE8txqko/UrptJ8YLkcJFhBcp8zr9+m4bKcsCRbevnD6ngAdsMK5cU+ZZaPAlcUOSlC/G2FAi8jzXs5SMOfE=
X-Received: by 2002:a81:d05:0:b0:317:76a1:9507 with SMTP id
 5-20020a810d05000000b0031776a19507mr24892267ywn.151.1655733239918; Mon, 20
 Jun 2022 06:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com> <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com> <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <Yq8pXroV+23xr5w5@pendragon.ideasonboard.com> <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
In-Reply-To: <CAMuHMdW02U7qdvGNqijyg_5NbJ3aKyCB8j26FjeAMR-aMY_bDQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Jun 2022 15:53:48 +0200
Message-ID: <CACRpkdZiYweLs7b4pGCSO_gPghpDGA-jC+ctKrtUmi19oXiyFA@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [TECH TOPIC] Rust
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Christoph Hellwig <hch@infradead.org>, ksummit@lists.linux.dev, 
	ksummit <ksummit-discuss@lists.linuxfoundation.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 19, 2022 at 9:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Sun, Jun 19, 2022 at 3:49 PM Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:

> > Time to invent a C-like version of rust ? :-) Jokes aside, as far as I
> > understand the syntax is different from C because it was inspired by
> > other languages, not out of a desire to be anti-C. I could be wrong
> > though, and it doesn't really matter anyway, I doubt there's anything we
> > could do there.
>
> When reading "things which could have been C like", I had the exact
> same thought ;-)
>
> In the past, many new paradigms were implemented in a variety of new
> languages, usually inspired by other languages (e.g. some looked like
> C, others like Pascal).

Some background as I understand it:

The first "real" operating system (using virtual memory etc)
for the Atlas Machine supervisor in 1962 was AFAICT implemented in
Atlas autocode which was a dialect of ALGOL, which was the
lingua franca at the time. In the meantime, ALGOL inspired
CPL -> BCPL -> B -> C.

Pascal was influenced directly from ALGOL as can be seen in its
keeping of BEGIN and END and also used in some operating systems.

The language family is referred to as "imperative languages", mostly
by those who do not like this language family.

Since this time, almost all operating systems were written in
languages derived from ALGOL one way or the other, like Linux.

There are exceptions, many of them failed visions, such as the Japanese
fifth generation computer that wrote the operating system in KL-1
(kernel language one) a dialect of Prolog. The partially successful
would be LISP as used in the Lisp machines.

Rust on the other hand had its first compiler written in OCaml, clearly
the author liked that language and it shows (e.g. the let keyword clearly
comes from OCaml).

OCaml has a different lineage: ISWIM -> ML -> Caml -> OCaml
based on the article in 1966 by Peter Landin on Lambda calculus in
programming languages. OCaml is loosely in the same language family as
Haskell or Miranda. This family is called functional languages.

My intuitive appraisal is that the ALGOL family has traditionally
been appreciated by engineers and the Lambda calculus-functional family
has been appreciated by mathematicians. (From here comes many jokes
about X = X + 1 being insane maths etc, people.)

Rust actually tries to join these two families taking some syntax
from both. For example adding the keyword mut is a clear compromise.
This article section 2 overview of Rust is very nice:
https://dl.acm.org/doi/fullHtml/10.1145/3443420
(The rest of the article is for the mathematically inclined, i.e. not me.)

Maybe this should be a blog @people.kernel.org rather than a mailing
list post.

Yours,
Linus Walleij

