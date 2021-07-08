Return-Path: <ksummit+bounces-358-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0143C1A91
	for <lists@lfdr.de>; Thu,  8 Jul 2021 22:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 148E31C0EE9
	for <lists@lfdr.de>; Thu,  8 Jul 2021 20:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A442F80;
	Thu,  8 Jul 2021 20:34:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E3C72
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 20:34:35 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id b1so9868736ioz.8
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QYWR4bYVjlGhcIIT8gqQLiSCDkUG+Iy6B+ef7hGFgp4=;
        b=cXHgapwLVDuJ/mE0Brq5G0OYCYILRkL7MuEXQ4Q6L/FY+G3UCkoODEp6BhWF9TyYg9
         ofJ09CrOvOG/H05hod5YZkmyRAU2AcLO8g7YcapGNh0oBnmo62QNW1OIuHfXbH9TNalC
         nWptBo9A8sgvWKZLClTMSXvxWZZ3n7m+v5XFcr793WhhjaVXh0yNkOVemcIXPebI6opE
         AgKoP2TILqbBT70KKKSjILTcrC9HIXdHj0NHmxYKHdvY8drvepmUlbvYene5+RNGi52D
         +I7tL7LwX4txh0cEUmVP4E3sWqg6+7DDcj1Pb8DtYSe793I9fotUvB/4KNXwnENyc7r7
         q6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QYWR4bYVjlGhcIIT8gqQLiSCDkUG+Iy6B+ef7hGFgp4=;
        b=QLYxs3qSyzQpcSp3HmgFDcfJnbZ1KWjrbVDumr6qPuV7UssI9x6f1+ycPvE4zBltOk
         w+QTv/oePLgQ3jTQ/QvYG6ASODK0H65t5snynwcC7jt8BDMkWHVszLmxF69Q2v22xvTq
         dD0JMPVgkqzANIi+mYM/7bcE9+vCfjZMgT+xMWefkfWw8OX1Q19EIZWRux4eBg6wWX8j
         jbB3QvzQemwapsaeqoQJxocVWs74v7QR6LOSJsvkN2xfkARqqul/bcn2nRkThEhpzM+F
         EaA/itMD3WiYS4dV71kkCKLkpVNnljBzlptDggJ/uqPzteYvdtdcIJmqvq+Sjuv18fB6
         VMYA==
X-Gm-Message-State: AOAM531K3ArjtdmL+LfO/39Kr734w8tgQyjmIUk+dUiGx95QBLdboABI
	hNadxo2duhVGQlul6FD8BGowUpaXm77MJsa0/d0=
X-Google-Smtp-Source: ABdhPJwHh57TLChEi7YnMcysJTYUfjZLnvhYbXSbuupfmCEdjIYb5QZTsPOupyXjsKvbHSx8tI3TALTIuCFeJENIM1I=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr25435605iom.149.1625776474563;
 Thu, 08 Jul 2021 13:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
In-Reply-To: <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jul 2021 22:34:23 +0200
Message-ID: <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 9:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> With my GPIO maintainer hat on I'd say a GPIO driver would be quite
> interesting to look at. We are two GPIO maintainers and Bartosz is
> doing the heavy lifting for the moment so I'm connecting Bartosz to this
> discussion. (Now he has to read through the whole backlog,
> sorry Bart!)
>
> This is not to say I promise we will merge it or so, but I just generically
> like new approaches to old problems so I like this whole thing
> overall, despite being critical to some details.
>
> I am also trying to learn Rust. Baby steps.

Thanks a lot for this offer Linus.

Do you have a particular one in mind? Ideally, it would be one that
has QEMU support or a test suite of some kind, or at least one that
you can easily test for us etc.

Cheers,
Miguel

