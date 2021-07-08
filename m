Return-Path: <ksummit+bounces-361-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B45BD3C1B62
	for <lists@lfdr.de>; Fri,  9 Jul 2021 00:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 2450F3E1110
	for <lists@lfdr.de>; Thu,  8 Jul 2021 22:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBD02F80;
	Thu,  8 Jul 2021 22:13:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3276A72
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 22:13:38 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id 11so764941ljv.1
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 15:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nE/bFkgV+CYyOG6TwWxtlr+Mc8KHKQEDxbgNfmmh5t8=;
        b=TCXVRybxOPCWyn5Fcpt7DLS5PzuNFjRAlA7TkwId3TvwZ+6LIkeuq9VrgWlHC8HzM3
         kh/8ybwbp1Ngd2UhM6rjV1eb32H8SHq3dve4eV3JeRS4JOhCoqQi3/u/1Hwsmt9leWtX
         ZvhoC6zrzXDginuLeGBOJ8M/6YMGNt05Pe1QC9WHHFv/mdcA537XTzhi1iqNKLJo3RV5
         zQ2vxdc7tmX1zJFYKBXwEia6o8ObHl86h+1YEoFdcCfnoP/vonNbLJFniNFEMrWZNicl
         r4YyYosYWFeQJIOWV2wA+s2bsg6nOC+7nVZke9aci3i3AZs8iuSlyPUXWc1W6yUn6kE7
         HmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nE/bFkgV+CYyOG6TwWxtlr+Mc8KHKQEDxbgNfmmh5t8=;
        b=n1GryS1TjGO4iZ09/kgLxpsEwk1t5iprdHExeP3xms9snP+GTesxzSx5b8ySH0Cmpr
         Da5kGYfL7ake0c5TgJbZv77t+dUw+awqtEH4h1gDTT2t9ya3f1apnDmNLQFAgI9bzcoX
         g6ecYTFPNO87QFgNJAW5AMCIqsSKT1o8kn1V+i0hOTVFrOiNCn8l0ZhEkQOYUxjFCYXi
         R0NXL1x2HKjSBrIhwvyMaQGOOAnDHbGC4cX3T0pQ8wXGUjAmmj4rXIkyiFTaVsapgutq
         ieBeGyceexBSqcLtj5+wkfQhYq4cFNnR/HVlhTT4VLk0j/5QaJ9TDdajhG1hWOfJD18J
         Phwg==
X-Gm-Message-State: AOAM531FO6dcHF19wqv0ouX0lvj8c/6ZS3Ch8AMcBsi66mTUmT6QQ9Mr
	tDgdWVdfq+PdUdcGet3UBP8FVUhSw9pco4evGG0ENw==
X-Google-Smtp-Source: ABdhPJxUnLADPLUCBGGDFMMNlP/nY+G1e+As370VwzZM7F+jBFlMPnz/9Oo2bKoTY9u5blIbXKaPHOg9OuHAWjqGB4o=
X-Received: by 2002:a2e:9210:: with SMTP id k16mr24850466ljg.438.1625782416167;
 Thu, 08 Jul 2021 15:13:36 -0700 (PDT)
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
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
In-Reply-To: <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Jul 2021 00:13:25 +0200
Message-ID: <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, 
	Kees Cook <keescook@chromium.org>, Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Roland Dreier <roland@kernel.org>, 
	ksummit@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 10:34 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Thu, Jul 8, 2021 at 9:49 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > With my GPIO maintainer hat on I'd say a GPIO driver would be quite
> > interesting to look at. We are two GPIO maintainers and Bartosz is
> > doing the heavy lifting for the moment so I'm connecting Bartosz to this
> > discussion. (Now he has to read through the whole backlog,
> > sorry Bart!)
> >
> > This is not to say I promise we will merge it or so, but I just generically
> > like new approaches to old problems so I like this whole thing
> > overall, despite being critical to some details.
> >
> > I am also trying to learn Rust. Baby steps.
>
> Thanks a lot for this offer Linus.
>
> Do you have a particular one in mind? Ideally, it would be one that
> has QEMU support or a test suite of some kind, or at least one that
> you can easily test for us etc.

I don't use QEMU for GPIO development, we are so close to the
real hardware that it's often not appropriate. We have a testing
module but that is not a real world driver and would not meet the
expectations set here of creating real hardware drivers.

I have seen that QEMU has a piece of code for the Arm PrimeCell
PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
Note that this hardware apart from being used in all Arm reference
designs is used on ARMv4T systems that are not supported by
LLVM but only GCC, which might complicate things.

I am a bit oldschool in that I think real hardware is awesome to test
on. GPIO drivers exist in many shapes and sizes, some are directly
memory-mapped to hardware registers, some are I2C or SPI.
Most Raspberry Pis and Beagle Boards have them, albeit the
on-chip GPIOs are often also pin controllers which complicates
things. Expanders on I2C and SPI will be simpler. Maybe look
for an I2C or SPI expander that has no existing kernel support and
implement it in Rust?

Yours,
Linus Walleij

