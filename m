Return-Path: <ksummit+bounces-1024-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC8781139
	for <lists@lfdr.de>; Fri, 18 Aug 2023 19:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 528722822C7
	for <lists@lfdr.de>; Fri, 18 Aug 2023 17:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461D96137;
	Fri, 18 Aug 2023 17:07:47 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488F1648
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 17:07:44 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-99c93638322so235104866b.1
        for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 10:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692378463; x=1692983263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=drevCkwEvdNKXkxbc7k/fWI2CUJjTpr/Dn+gFjHmA6A=;
        b=LmZIvlQIiH2iPBuXBXFO0TNUnYhEKnTFNMOb1/O9wCpz56zkF4+WOuw4LUBb84+nv7
         Hb0nCQ7rAW/enuP4Iv3WeRYf8V9zG6loX4GQMgbNUvV+jjdt+Suvnd6F8kkJQ7Dp9Aow
         T73oWMJF72p6Vre4Joms9One9zrdG/4TyTQdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692378463; x=1692983263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drevCkwEvdNKXkxbc7k/fWI2CUJjTpr/Dn+gFjHmA6A=;
        b=HvSLne8H55yaLdUUNe4vhqLYW2ftswap4rp7a5kawjhC31pDY24Sing4gwBQXQnjRx
         646ZJuKpn9LYnyAKCXjhX6n/GJ+GY+kJRH2s+DSFiNZz+lt4YvGXPzN4ZiuWX6cnLlyD
         /e/W4fmkvv8vrg6Qxbr8uzDGRU3+ExeSTeZA6uCieXu6dobbrjUhP1i2bpofBA8vzgPw
         64RxqmCFC5AHrlmIGmT19FfiC70F82LjRsdqzknIwuL7sLdu7v2oifHfWUXxLp24mn8l
         71TGByYFPpm4h2Wjbh+ROhcv1JUrUk0/MNj88M5Rf2D0zAjgZ24/icCLC1rXfq1y9HHp
         SqlA==
X-Gm-Message-State: AOJu0Yx6ZADcb2HbAL1qyY3PT2L4E4vvjZP/dPRZzs6//dsnk/RouqJl
	7lBbyITA//c+XSI/IFcSFWtEJgA0zTmLKiq6/wEsMtv8
X-Google-Smtp-Source: AGHT+IFor52pd3kdwJx/J0bJjRIF1kIlyYdbaWyCr+6fUKinSvKUmGBtqbB8oOZ95IeqkCp7t3cpNQ==
X-Received: by 2002:a17:907:1613:b0:991:d414:d889 with SMTP id hb19-20020a170907161300b00991d414d889mr7866837ejc.15.1692378463038;
        Fri, 18 Aug 2023 10:07:43 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a19-20020a17090680d300b00991faf3810esm1406552ejx.146.2023.08.18.10.07.41
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 10:07:42 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99df11828c6so472482766b.1
        for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 10:07:41 -0700 (PDT)
X-Received: by 2002:a17:906:76d0:b0:99c:602b:6a6d with SMTP id
 q16-20020a17090676d000b0099c602b6a6dmr3481250ejn.11.1692378461617; Fri, 18
 Aug 2023 10:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org> <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
 <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com> <20230818080949.7b17b0d5@kernel.org>
In-Reply-To: <20230818080949.7b17b0d5@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 18 Aug 2023 19:07:24 +0200
X-Gmail-Original-Message-ID: <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
Message-ID: <CAHk-=wibRQBp3VyJrUzk4=E_ozHokOM2LsYD9P_0XSN0edD_kw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Alexei Starovoitov <alexei.starovoitov@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Aug 2023 at 17:10, Jakub Kicinski <kuba@kernel.org> wrote:
>
> I was wondering last time if we can do a run of short sessions
> where a few volunteers talk about their subsystems? Let's say
> 10min talking about
>  - current process subsystem uses
>  - "realities" / day to day challenges / problems
>  - how the subsystem is evolving the process

I feel like we did exactly that a few years in a row, but it was
probably back before covid times, and probably when it was still
called the "kernel summit" rather than "maintainer summit".

At that point it was mainly just the GPU and ARM people who were doing it.

[ Goes back and looks at my old ksummit mails ]

Heh. It seems we did it enough that during the 2018 discussion, we had
Daniel Vetter say "We don't need another overview over group
maintainership". I think most of this was 2016/17 or so, and then by
2018 we had that "not again.." situation.

But I suspect that all predates the networking people starting to do
the group maintainership (I think you started doing pull requests in
2020?), so I guess you never saw any of that.

I do think the whole "how to spread the pain of being a maintainer" is
very much the point of the maintainer summit, though, so I do think we
should revisit.

              Linus

