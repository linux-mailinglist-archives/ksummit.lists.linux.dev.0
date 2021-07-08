Return-Path: <ksummit+bounces-362-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB583C1BAD
	for <lists@lfdr.de>; Fri,  9 Jul 2021 01:06:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 33F8A1C0EE4
	for <lists@lfdr.de>; Thu,  8 Jul 2021 23:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84CC72F80;
	Thu,  8 Jul 2021 23:06:36 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86D70
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 23:06:35 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id n14so19385698lfu.8
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 16:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xs9vAmnb50i9kjnKF9I3OcY/hblVwtxxGAPUOxmSa+w=;
        b=FLLTtQZhGIBmm3BKBma77DIt0vGVhocDYpTOSZDkgUClRiZjE/dyWXjan5kBcP4OHA
         oykcM+L3pBJravgr1/SDTWRtVAiKonk7ldwtHfDaKucGjvBI0Vh4YWxvxs5PhVIlXIk6
         Z9YTWv3hkGIGTMdxO9gm6IZx0rGuMhYR9gCSB8WLuI17eICTe9zLk+TYaNMLqYnGUeJm
         w4O82Av0Smxx+1XQfbEIDzIOm7yaUBO4Rxk7sW3xydDisxHnBWkXZTKiDqQ6shNYnkoO
         Qi6n5HEwkQHp1FwNXXpx+3Q1uQtOXduyN8Q7p90l1EUmnrNP1AyqtXqQHJXwWW6m36pZ
         iCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xs9vAmnb50i9kjnKF9I3OcY/hblVwtxxGAPUOxmSa+w=;
        b=Pz+7Ty0Zefy9blfBteIj64HWXJ3kL5hPYsBwdH88GVpHHzd+cvW38A6Onot1sYwt9F
         K4uAsU5LoaHa9uW+bVnu+6ZhwwpP5TFoODBxmFWvZUWywhkyblFCoVjboOpSl51rONRd
         G/shpQWocdLKUnnLkudiZhzyWvxZdefL3r4ExlkHvqZ8yHFCH3coQtlz99vfmtTefdvy
         Klvc+TqLhTEFrHoHJ/t08OPfSrIMigdxY6jXl0RtWmsmQhwQiC/kXgsxG4RXuHM6N7ts
         Dpxs3Xw+QNESQ0N9xQeuB+Gm6zH1RqVspqEOKgBpcK+XUYJXIIybUYzYhcJusME6wCRs
         /dRA==
X-Gm-Message-State: AOAM531+j2OZG+4NlDTNjZu9E7eBbx+kGtcrsvMwfl4jmm/eXlRVmwwy
	JXaQd13aJ1EJpb4GHTYY4p/43TOA+8ghlNKdlIlHBA==
X-Google-Smtp-Source: ABdhPJxAos20Eig+bhh7merDpBBaeDCgZyDmwiWGB20GFy0/REGtaFResox/hOMwiLsZTt9gVK5I4vZ8KrK0LhD3PqM=
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr6337480lfp.157.1625785593131;
 Thu, 08 Jul 2021 16:06:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk> <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com> <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com> <YOagA4bgdGYos5aa@kroah.com>
In-Reply-To: <YOagA4bgdGYos5aa@kroah.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 9 Jul 2021 01:06:22 +0200
Message-ID: <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Greg KH <greg@kroah.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Roland Dreier <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Laurent, Greg, this is important.

Replying here to get this in the right thread.

> On Wed, Jul 07, 2021 at 08:17:08PM +0300, Laurent Pinchart wrote:

> >  Here's what
> > I think should be done for drivers that expose character devices.
> >
> > - Drivers must stop allocating their internal data structure (the one
> >   they set as device data with dev_set_drvdata()) with devm_kzalloc().
> >   The data structure must instead be allocated with a plain kzalloc()
> >   and reference-counted.
> >
> >   Most drivers will register a single character device using a
> >   subsystem-specific API (e.g. video_register_device() in V4L2). The
> >   subsystem needs to provide a .release() callback, called when the
> >   last reference to the character device is released. Drivers must
> >   implement this, and can simply free their internal data structure at
> >   this point.

What we did in GPIO to get around the whole issue is to split
our device in two abstractions. The device that spawns a GPIO
driver can be a GPIO on any bus (platform, PCI, SPI, I2C, ...)
then that populates and registers one (or more) gpio_chips.
That is a struct that deal with handling the hardware but does
not contain any struct device.

When registering gpio_chip we create a struct gpio_device which
contains a struct device and a struct cdev (exposed to userspace)
and all in-kernel consumer handles (called struct gpio_desc). This
is reference counted on the struct device and uses
->release() to eventually clean itself up.

The crucial part is what happens when a device with GPIOs
disappears, if e.g. the USB device is unplugged or the driver
is rmmod:ed by force from the command line. We then unregister
the struct gpio_chip and drop all devm_*  resources taken by the
driver (referencing the struct dev in the USB device or so) so these
go away, but the struct gpio_device stays around
until the last reference from userspace is dropped.

In order to not crash calls from the character device the device is
"numbed", so any calls will just return "OK" but nothing happens.
We then hope userspace will be so nice to terminate once it realizes
that it is no longer needed, closing the chardev and releasing the
resources held.

This works for us but I admit it is a bit kludgy. I guess it is not a
generally useful practice, we just had to come up with something.

Yours,
Linus Walleij

