Return-Path: <ksummit+bounces-680-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id B3262554501
	for <lists@lfdr.de>; Wed, 22 Jun 2022 11:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 7CDCF2E0A59
	for <lists@lfdr.de>; Wed, 22 Jun 2022 09:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1649C1374;
	Wed, 22 Jun 2022 09:59:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B40110E8
	for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 09:59:15 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id i15so24427011ybp.1
        for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 02:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GW05uyYtAsujO2OLvJImyaOA91Ixa0fSxw+BLWoe2kU=;
        b=LVr7HtaLWo+wKKpgXa3oSQ5tRISdegig8ZvaooQURhakNAqFYQWdZf+bR2rjTQYt+y
         +pQk4oH4AKgj/0pKn2q9PS4X6CFIC844H5qcZNcHVRV0fKgAt+7sqKh0ifnq+HYz6Wwj
         p9vc25XisQvipkKxS9usAOR0sCyvjPqAPGAdJFWD8ruH94z0U3bFHc/UXllSbwpoWCxx
         sQ02/MslD6ksRVb1RhFxv33K+ySHeR8gRtMLbc1vAhmwZXplbR67NhpLaJl2x/KvPgU1
         JJyQVU5URycg6Q5e5joetENZlX5TKn/jlvpurfkqNzw12Q8MOTEPXXG+sgngxxeEoI9x
         bJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GW05uyYtAsujO2OLvJImyaOA91Ixa0fSxw+BLWoe2kU=;
        b=YQ0JXMv7zWE2lRcOwiaqij4eg04udI+yg3qBuFGT/bi/SCHHCuwdMu72UAy2EkvEp6
         aisGTtlxACrz563YqkXcH7YW2i04AwvApBrDKyrlK6qL/JceyDijeS6fbN0v/vfNGFXx
         /PBm5nVnEOuIDEWk4PZd0ksWVepywmh8V5TiBsD0LKbWN43mqAvG9ySOpXypPdt09zcW
         LpEqni+SLcbwjx6zVfxAXWrlws3gkBHETFK9xdsHM2uKLc1mXipKJSuXt8l8Ca4PywEA
         WgyEjab/Z+b6q5DZJbl0b8lshqoqjLfodj40lm1w8HcVQmfjZWM3e4JrjFX3DBQzxa1X
         Atuw==
X-Gm-Message-State: AJIora8Mqx32OzgdLjaCN61v563jRZriSOiSi9lME+/mBqPK1G3FJHrU
	vojoSgTSiOo7DK2FSD0PfbbGSnnJatV0NAa9DLO/RQ==
X-Google-Smtp-Source: AGRyM1uaqvFVM30TKnG97vVA8KCZQk+YEuLveQ9Q7DVf1w1EDJv1IVOmVfVUOxprDSRnR95RqQHaHGDF2c4sGT3a8sU=
X-Received: by 2002:a25:ed03:0:b0:668:b0ed:ac42 with SMTP id
 k3-20020a25ed03000000b00668b0edac42mr2746107ybh.533.1655891954544; Wed, 22
 Jun 2022 02:59:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com> <Yq6+p+aRCjeZ7QsS@infradead.org>
 <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com> <2513dc4528c71d34d400c104e91ada6517869886.camel@HansenPartnership.com>
 <d3ba4011-a31d-05fa-b5de-808a1a5ee56f@kernel.dk> <Yq8qaqr673UFFG6y@pendragon.ideasonboard.com>
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com> <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
In-Reply-To: <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jun 2022 11:59:03 +0200
Message-ID: <CACRpkdZ9GR=nH6QHhRC7xg1jnr1UJ1BDM+P28V2VWa+uPO0DrQ@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [MAINTAINER SUMMIT] Are we becoming too
 fearful? [was Re: [TECH TOPIC] Rust]
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, ksummit <ksummit-discuss@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 19, 2022 at 4:45 PM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:

> I think there's a growing problem in Linux which is exemplified by this
> Rust debate but which goes way beyond it: We're becoming too fearful of
> making big decisions to sustain innovation in some areas.

I agree.

> This really
> is a creeping cancer of inertia that has destroyed many projects before
> us and if we're not careful, we'll go the same way.

Strong words. This phenomenon is known from organization theory.
Organization theory exist in dry and tasteless versions and some more
colorful and spicy versions. Let's revisit the most spicy and colorful of
them all, Cyril Norhcote Parkinson, a true representative of the
atomic space age.

In his famous book "Parkinson's Law" from 1957 (a book passed to
me from my great grandfather, and annoyingly relevant to this day),
in the last chapter titled "Pension point, or the age of retirement" he
touches on the subject. There might be an illicit copy here, page 42:
http://sas2.elte.hu/tg/ptorv/Parkinson-s-Law.pdf

Parkinson is writing satire and it is a clear hyperbole. But it isn't funny
if it isn't relevant. He saw the same thing as you see, and just
state (apparently based on nothing but his own experience) that a
persons "age of wisdom" is followed by the "age of obstruction".
Just constant risk avoidance. Blaeh. Boring.

I don't know about eBPF, but Rust is nice. Let's merge it and see what
happens. As one of my friends working in embedded systems said:
"this is the only new thing I have seen in my career, the rest is just
repetitions of the past", and I agree with that.

My biggest worry is that the kernel community can become irrelevant
for young people as a demographic. Young people like things like
Rust and web-based merge requests on github. They are also very
smart. So I see it as partly an inclusion problem.

Yours,
Linus Walleij

