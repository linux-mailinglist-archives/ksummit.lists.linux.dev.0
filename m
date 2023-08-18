Return-Path: <ksummit+bounces-1018-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3357780D1B
	for <lists@lfdr.de>; Fri, 18 Aug 2023 15:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA04B1C215FA
	for <lists@lfdr.de>; Fri, 18 Aug 2023 13:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EF618C0D;
	Fri, 18 Aug 2023 13:55:26 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C817AC1
	for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 13:55:24 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-58dce1f42d6so28512227b3.0
        for <ksummit@lists.linux.dev>; Fri, 18 Aug 2023 06:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692366923; x=1692971723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcVynaghOLRwf6wamOBYsp7RCU5zMFSYjXG6h0xZn7U=;
        b=auZQYMw4RvzvYTkaw0iA5WgDJ5/F/xlUaxhPKZtYW74r9A4lwElsVutEWgXdMOo3RX
         EqO+ipySzu6wmBQOSw4CVUZtHKhFwRFA3B/wwDcWve2unNapKKTnyFZHlYjZSDdcXczN
         b9DqpSlBdL62GZZDdqEbTc7BlrwdN4pzT5SMpUjs06yeTsMOc1+zxlJVoHKjbBUsu1JH
         JNi5sJXS8bPFLeV0KG+y5WzU3pNU08kimvzz1vo18npC5iD7IEcWtlBTFq52mg7p7CgX
         Z0u0FYEXrSJ0GPwfeTxFLvNpeEDwfG1XhCaKwoVEN+vD7ocbPNZx4i3eOZ4v/hZ1bBIM
         J8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692366923; x=1692971723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcVynaghOLRwf6wamOBYsp7RCU5zMFSYjXG6h0xZn7U=;
        b=N+m/hFBelySoqigRdebLg5cKXqX0MhJFNDZU9uNrZVeY4EOSOlJ5B9cgNvKUfw09bL
         BJFPPxD3PTlpIXeGbMZeUAYBMEhfNS8qAMW1KJuU5UY40CieHH+X9UTxus2ICr/ez7VK
         6XeI71T6OOBsFUgetsJxTDrvIGCRWQeODBZlk5IQabrrR/d8Yd4xCVDEIJuRY3lIL/bP
         /Aq0szS6jp3BjqTEZgnJ2NgOKxpPRWb1BUyWHwdw7utQssgNT8wcKmoZDTUlGWweNuax
         xaH9DId1YVyTy4hD1QOxhvjFSqZkM98pxE3447GxbGJ0zQW03Uave1u3eMQLPiBN0O79
         XmSg==
X-Gm-Message-State: AOJu0YySUqMI002YE6mcHiMcueg1zNSea9Rlw0FNvevzelGYEss8Pqsq
	1oMq5igmAtcijR55bfOv+sBFdsabf8pu5B5HZyZNqQ==
X-Google-Smtp-Source: AGHT+IHQafc8T4Gp6XwA8TbZicJ84+oi6cirQ2Sbg0tviU+IiHXOQy/u9XB9GgStnP4O6/cTyyowTLv9wg2vqyGRkE0=
X-Received: by 2002:a25:317:0:b0:ceb:8b27:b7fe with SMTP id
 23-20020a250317000000b00ceb8b27b7femr3204092ybd.27.1692366923585; Fri, 18 Aug
 2023 06:55:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230816180808.GB2919664@perftesting> <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <20230817093914.GE21668@pendragon.ideasonboard.com> <44814ed5-7bab-4e56-9ca6-189870f97f41@lunn.ch>
 <20230817081957.1287b966@kernel.org> <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
In-Reply-To: <CAADnVQ+6=RjVziJG6rXwiC0+dEKGTGFNPUgsa4dyPP66NyTbog@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 18 Aug 2023 15:55:11 +0200
Message-ID: <CACRpkdbfSzNwkwnew-5YN4j4yBjgh=fCiaKdPmiRbViTdOcXkw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev, 
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Alexei, thanks for returning the conversation
to this very important topic.

On Fri, Aug 18, 2023 at 1:55=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:

> BPF has solid CI that helps a lot, but the maintainer burnout is acutely =
felt.
> The main reason for burnout is patch flood.

I agree this is an important cause.
Even worse is any kind of social conflict or bad mood in the community.
Science has studied stress, what we mostly run into is called "microstress"=
.
https://en.wikipedia.org/wiki/Psychological_stress

> The maintainer's day looks like non-stop code review.
> The patch backlog just doesn't end.

I've been there too :(

> We're trying to encourage active developers to be code reviewers as well
> via positive/negative scores:
> https://lore.kernel.org/bpf/ZJx8sBW%2FQPOBswNF@google.com/
>
> It doesn't help much yet. All incoming kernel contributors assume
> that it's a maintainer's job to do code reviews.
> Developers just send patches and wait. It doesn't occur to them that
> reviewing other patches will help them land their own.

The DRI/DRM community has group maintainership that works a little
bit.
Essentially it boils down to ask people to review your stuff and you
will review and also merge their stuff in return.
Sometimes this works.
Especially if you are a circle of acquaintances working full
time on similar things, yay! So much support.
When you are a sporadic contributor it doesn't work as well.
Because you cannot always find some matching contribution to
review and you feel like begging.
So different solutions for different contributors may be needed.

> To address maintainer burnout we need to change the culture of the commun=
ity
> and transform active developers to active code reviewers.
> We're looking for ideas on how to do that.

I agree.

To deal with the symptoms (feeling stressed) when it gets too much
for me personally I have different coping mechanisms.

The basic idea is to do stuff that generate the opposite of stress.
This could be outside of work, but also working on stuff in the
kernel that gives a feeling of immediate accomplishment and
closure is good.

Such as maintaining some drivers and systems that are old,
so nobody is begging you to fix it now now now. Paying of some
old techical debt. That's nice.

Drilling into a specific bug that is not urgent can also be very
de-stressing, it's hard work but nobody is dependent on you
fixing it now. You don't even need to come up with a solution.

Yours,
Linus Walleij

