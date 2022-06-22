Return-Path: <ksummit+bounces-682-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBCB5545EA
	for <lists@lfdr.de>; Wed, 22 Jun 2022 14:01:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E43F280A99
	for <lists@lfdr.de>; Wed, 22 Jun 2022 12:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95BC1399;
	Wed, 22 Jun 2022 12:01:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33097137A
	for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 12:01:15 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id n144so25705985ybf.12
        for <ksummit@lists.linux.dev>; Wed, 22 Jun 2022 05:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rR0AI8o8+lWYn/QRBFkHrQfXnlyoZTnnkisHc4nUS8=;
        b=NhMKgLZUXz+PT5iQ8VAMP0LrOCmr32vkOPrybMavFKSpGYzT6KvvpdB/sM4qaXma/L
         DcTrxlRu2SO9HC+kbwohurqFNHDv3jBRr6vZjf5k2Tk05lDNBZeiLtwc0xLU0nu3GbCx
         6/Te+4RDORLM9rIIYzNGf6IV/l7dtHOM79PoiynfUCs/k/vm8ORT7oKElrTGxlj0qbAW
         TQm2tsgsnfQ3PP+iCnKIafoIxD1IPDaC0tYUab0dyiclUyG8SNkDyxTeJNNJ4sBPdLfg
         HLxw+Id7r4ZNKU8F0gsjwdV6ZVQthpUZPavdjX7eHEO+XmjqA5pCPH+ObQnAmGjPfqa3
         GpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rR0AI8o8+lWYn/QRBFkHrQfXnlyoZTnnkisHc4nUS8=;
        b=hqNC6fP6EZ4uibdceng4uW/nL7okVHapoe9XzRxRN5Ugk22/khBfghFhNpTrh7mllX
         KHniATycwzaT1OCU4OFFNqaWDwdlaU33jZUXHQ0No9Mz+K4mx9OAnDh2syrxEk046qEw
         RpT7wkn21+xM1E7EfQqf+XiZ3RAhmr+uBJKJhL6VOTofdCwLY8DCbv7jMLXESEH70/uB
         OvRd8+cdKg3YG2O/POYrj+B5H4LKtX9LF4CQwhBEGSpTJIcXR4qKY+LQPfx6msrDaQeM
         NI99g39ndSB8U2bTad1tvSW5S5xYxbK4qcnuc+oMG0VRzFnn0manJJbmRpeACLKch8qD
         mo1w==
X-Gm-Message-State: AJIora8A/zJwH1pKJHvlDcfKCzK7XOZEkTPqN/wwtf2Z0x3rHRUWMweU
	wp3E6nX+lfjnIE5womeKLKH7V5l0daHD3n4DoXgh8Q==
X-Google-Smtp-Source: AGRyM1uy5Dz1iBkOlgOUqM1HbFBRRlTn464x7wx+H+4JeqbwVYUy+y6lHps9lJXwSG7WI9mlEiUlmjdj+kBnjF8rMkk=
X-Received: by 2002:a25:da44:0:b0:668:c9d7:d921 with SMTP id
 n65-20020a25da44000000b00668c9d7d921mr3466156ybf.514.1655899273935; Wed, 22
 Jun 2022 05:01:13 -0700 (PDT)
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
 <cefa5e41b74c96c81003cfd421cf754a03cc7f52.camel@HansenPartnership.com>
 <ca6243160b36aa42f4d0ad23853b84e57ca366f1.camel@HansenPartnership.com>
 <CACRpkdZ9GR=nH6QHhRC7xg1jnr1UJ1BDM+P28V2VWa+uPO0DrQ@mail.gmail.com> <YrL1tsoKLoVTbDIH@pendragon.ideasonboard.com>
In-Reply-To: <YrL1tsoKLoVTbDIH@pendragon.ideasonboard.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 22 Jun 2022 14:01:02 +0200
Message-ID: <CACRpkdYB62O_OxD+6aFxrzX695dg1wLWcmWsy-TM-V=KF1Ea5Q@mail.gmail.com>
Subject: Re: [Ksummit-discuss] [MAINTAINER SUMMIT] Are we becoming too
 fearful? [was Re: [TECH TOPIC] Rust]
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@infradead.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, ksummit <ksummit-discuss@lists.linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 22, 2022 at 12:58 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> This doesn't mean that all concerns should be ignored, and I read most
> of them more as constructive feedback trying to find solutions than just
> attempts to stall progress here. For instance, I see a widespread
> concern that, as rust spreads in more places through the kernel, it will
> generate extra work for people who are not able or ready yet to handle
> this. This can be handled in two ways: we can ignore that concern, and
> deal later with the potential conflicts it could generate, or we could
> try to address it already.

I agree. My first reactions to Miguel's and Wedsons Rust patches were
not the most enthusiastic either, more along the lines "you think you
can do better than 50 years of C?"

Then I looked closer and saw how Rust is designed to join imperative
and functional programming to get the best of all worlds, to use the
latter to solve some of the problems with the former. So now I am
theoretically convinced that it will add real value.

> Could the second option be extra work to handle an issue that may not
> materialize ? Yes, of course. I see it more as an opportunity myself.
> For instance, we could address that concern by creating and advertising
> a support channel for developers and maintainers who need help dealing
> with rust impacting their work (e.g. when doing tree-wide reworks) could
> get help, and making sure we'll have a few rust-in-linux maintainers
> there who can provide support (it could be a mailing list, an IRC
> channel, ...).

Why not both.
https://lore.kernel.org/rust-for-linux/ <- this exists!
I bet Miguel has an IRC channel as well.

> Not only would it send the message that the rust-in-linux
> community listens to concerns and cares, but it would also result in
> having a useful support resource from day one, as well as showing that
> this project really has the means it requires to move forward.

I agree. What I pointed out to Miguel & Wedson was that I expect commitment
of a personal type, what you once said (at a conference) required to
have kernel development in the open in your DNA. To feel personally
responsible. In clear: I expect the Rust-in-linux people to keep reading
the mailing list and respond to questions even if they no longer have
funding, even if it is not their current dayjob. The task will become too
important on a personal level to be left on the roadside.

The role model for that is Torvalds working at Transmeta a few years
back and not losing focus on Linux. That is a social responsibility that
goes beyond the dayjob. This request is probably more than a little
intimidating, but it is what we are looking for. If one does not find it as fun
and rewarding as to go to such lengths, then one should not go and
change core kernel infrastructure.

So it does not need to be a lot of people, but it needs to be dedicated
people. Such as the people who made Kasan, which we accepted
pretty quickly and we were not too conservative about Kasan despite
it being so intrusive.

> > My biggest worry is that the kernel community can become irrelevant
> > for young people as a demographic. Young people like things like
> > Rust and web-based merge requests on github. They are also very
> > smart. So I see it as partly an inclusion problem.
>
> If you put rust and github in the same bag, you'll drastically increase
> the size of the mob that will chase you with pitchforks :-)

Ha ha I know. But I have seen many beautiful projects on GitHub,
especially PostmarketOS, as a review tool it still lacks compared to email.

Yours,
Linus Walleij

