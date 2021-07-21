Return-Path: <ksummit+bounces-439-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAC73D12D0
	for <lists@lfdr.de>; Wed, 21 Jul 2021 17:50:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 48C463E105E
	for <lists@lfdr.de>; Wed, 21 Jul 2021 15:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6F72FB6;
	Wed, 21 Jul 2021 15:49:58 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9452470
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 15:49:57 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b2so1167373plx.1
        for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=inBYu5ag7c45MW8HDl2wJjLOE4iuBAdb1D4julHQh2I=;
        b=JoYCQOT90yZYg68ABYw09NUwlkvhYWyLIYIuvV9ipOkP0s5IMJzBj6Y4eWj31EP2Pj
         YURwAVn4LFLGmPWOH2vgvHU0VZkz5Hkb1A0c6Aw7gfCGoGDGIrZQWP9fMMSQkAQ42o/4
         QUKM37vhm8hVlZ+CCg3uLAfP96bmynoBUTlPjBHECASSdEB8VZ5rJC4ElQPIlJqMEaU4
         Gd9bIqliavPLOCz5lnQ0tZqQ0Z3P5gREfEUGime2KX1aUctMEb6qdkF7V2Fxe/uO6eIU
         sRgNrCWjgD3ZbHRvHMt81AtI8dNKiummeY/rh6pkE01/c5pW2sChVlYgTN4kwHUbqR25
         l3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=inBYu5ag7c45MW8HDl2wJjLOE4iuBAdb1D4julHQh2I=;
        b=sjdgr6s4SblGgxlywE4VpS6cUJHt3UndQI4Us7bLU52w61eUr3MfSnjqatE0x7TeuU
         ziWsdrer+ZQgQGJyPSauj/+J1uOoVHHrJN6pBjIbnxPH9iww9ijXd6Z7tbF4PCs3oDzw
         1AuvnpzCi5vdBkMKiyJ4d2AT1lJ3BcniyRex47VTWWRHscKwuNikWcbtd8ay8mKqmYTx
         osphK5eeJjCR7x//C9HrQELHMVaTGisP7sD5NXHMSDnVHwSFxQ3WBKrt1v34WD07+y9C
         4pCiwbBNE8zWgMgxka8fCwj2EOgbCtpyNk0vCXqnR/xnock3VqxjumUjwFil1DNbXgNp
         sh8w==
X-Gm-Message-State: AOAM531nEC/HMW/8lSAFIv0slnEa1stAsMv8K2iztPjepWuDmqIvwBJv
	Avo7674kXRIQ5CKt60KTpcONCg9DA4MNxnnQHu4=
X-Google-Smtp-Source: ABdhPJwtxXMeUt1ckwjLUEFJWmO5RZqlQfn6S4KZp6SzUCFHTOMZdyZ2jJ5TYjZwgNfAJEpk2VN3WDR6FtGvKnLyL8E=
X-Received: by 2002:a17:90b:3647:: with SMTP id nh7mr36027626pjb.228.1626882597112;
 Wed, 21 Jul 2021 08:49:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
 <YOh/JC//dotfm5J9@google.com> <CACRpkdb1W=M5EJkGbSS4QxObU-Gd5yZ1qE439k_D4K=jevgcrQ@mail.gmail.com>
 <CAHp75VfW7PxAyU=eYPNWFU_oUY=aStz-4W5gX87KSo402YhMXQ@mail.gmail.com> <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
In-Reply-To: <CACRpkdbzAzwrSJmoiO8w5KPV2dL-qxgaeD+gSzL-Gg+cmajsOQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Jul 2021 18:49:17 +0300
Message-ID: <CAHp75Vc9E3D4+roG6Hpv1TDffpy+7=kP0zwMuwy3FFghL=pTpQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>, Greg KH <greg@kroah.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Roland Dreier <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Daniel Vetter <daniel@ffwll.ch>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 21, 2021 at 4:46 PM Linus Walleij <linus.walleij@linaro.org> wr=
ote:
> On Wed, Jul 14, 2021 at 12:35 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>
> > To me described scenario sounds rather like an object lifetime possible=
 issue.
> > In any case, shouldn=E2=80=99t VFS guarantee by a reference counting th=
at
> > gpiochip_remove() wouldn=E2=80=99t be called while file descriptor is i=
n use?
> > Or am I looking from the wrong end here?
>
> What happens is that the GPIO device disappears (such as unplugging
> a USB GPIO expander) while a multithreaded userspace is hammering
> exotic ioctl() commands to the same device like crazy.
>
> Under these circumstances (which should be rare, but you know,
> developers) it could happen that an ioctl() sneak in before the
> gpio_chip pointer is NULL if I read the code right.

So, gpio_chip is NULL but gpiodev is not NULL, correct?
If so, it means that the above mentioned scenario applies to the
latter one and I understand the checks.

--=20
With Best Regards,
Andy Shevchenko

