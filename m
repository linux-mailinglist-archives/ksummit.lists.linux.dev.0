Return-Path: <ksummit+bounces-364-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id A12CD3C1C5A
	for <lists@lfdr.de>; Fri,  9 Jul 2021 02:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7DEB21C0F34
	for <lists@lfdr.de>; Fri,  9 Jul 2021 00:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C51B62F80;
	Fri,  9 Jul 2021 00:03:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82A370
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 00:03:00 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id l11so4770023pji.5
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 17:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zojAB1HuMgyBncAXasfHBj3qM32AfZvl4Is7lNuRMzA=;
        b=CbtP8lD1ACkLnb2p1ySjemCl5pezf6sI4jKK3vJDB7Hy06iCAgOoQ56amjyUVWZNkE
         TntmM6YO589g7KQcDchbllCiNOw2yPvtarMiBMZNrxPaPtK1ojkwT/KCZjd3qVM5bbMu
         KcvMVIz0uUlAqJheJxGmutlr/sf5yYEe/Kv3NWpYJchyCXVqUvdUNperG1IlOfCkyRit
         JsMvR579Ul74+ulHoFvSETA0E/giI+JF3v/9WpC1OvJxJR8J/23rq3mFaph6aC67Mr4J
         DFSZAThwrvmlw506KGVJSCKwQOhHXr0PoMWKNAY99MwkXuRmhzCdxyqJzYrBKUPxQKkO
         SHeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zojAB1HuMgyBncAXasfHBj3qM32AfZvl4Is7lNuRMzA=;
        b=ooHkJUKgE2vM2yuXbqVGTagZHvK8aVgYhl96ihHXrPE3h0Lq79CFTdiegfhunLFfK9
         X3yR0Tdu8vHdP2HBy2GQH9kWT/+2do1l3kRwqyhTUKjfwpuVMRMpgkK86fe1vq026Eiz
         34NcAIUqZ2wuN3cgCtTSJuzj8OpKrEw1RoybnF0MzJGz0pyUidVy+cARE7ujQWITrXsg
         viK94IgUcbcRe5cmmtHB/j2XGdFhAexAI2uJNWr68FsQB86PdsVw9Qm4viLQUEyXmNrY
         j6jT+CgZSPWhJznfdOyX3ucK6OCfZhxyZ2Qo3rWaP9biL78dUufNyT7FEiTgcIw9lyeo
         fAcA==
X-Gm-Message-State: AOAM533RslRSoNcyixdEHVOJ4GQSy/8zNMw+v8Z+E7rRGAfTBn1HLQG+
	hxDGK9pOx9cD31s9KDAocDXV8frxwj4LU9LXNhhOsg==
X-Google-Smtp-Source: ABdhPJwO39RDYxbW26KWBGDqFC6eIKJTZfb+gOEGvlDAftq5SHDS+yRuBP2/C7SDi2TA10/LLadi6KMKko/sJhIDaUk=
X-Received: by 2002:a17:90a:ae0c:: with SMTP id t12mr7217362pjq.149.1625788980152;
 Thu, 08 Jul 2021 17:03:00 -0700 (PDT)
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
 <YOWh0Dq+2v+wH3B4@kroah.com> <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
 <YOagA4bgdGYos5aa@kroah.com> <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
In-Reply-To: <CACRpkdasOaNgBAZVx5qpKJdU7h41jHDG2jWi2+pi9a1JBh7RTQ@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 8 Jul 2021 17:02:49 -0700
Message-ID: <CAPcyv4gy5+9Xcd-G4oAVAs6T5UcE8Z75vZv5Sd+CNBGsbiBJ+w@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Greg KH <greg@kroah.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Roland Dreier <roland@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 4:07 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Thanks Laurent, Greg, this is important.
>
> Replying here to get this in the right thread.
>
> > On Wed, Jul 07, 2021 at 08:17:08PM +0300, Laurent Pinchart wrote:
>
> > >  Here's what
> > > I think should be done for drivers that expose character devices.
> > >
> > > - Drivers must stop allocating their internal data structure (the one
> > >   they set as device data with dev_set_drvdata()) with devm_kzalloc().
> > >   The data structure must instead be allocated with a plain kzalloc()
> > >   and reference-counted.
> > >
> > >   Most drivers will register a single character device using a
> > >   subsystem-specific API (e.g. video_register_device() in V4L2). The
> > >   subsystem needs to provide a .release() callback, called when the
> > >   last reference to the character device is released. Drivers must
> > >   implement this, and can simply free their internal data structure at
> > >   this point.
>
> What we did in GPIO to get around the whole issue is to split
> our device in two abstractions. The device that spawns a GPIO
> driver can be a GPIO on any bus (platform, PCI, SPI, I2C, ...)
> then that populates and registers one (or more) gpio_chips.
> That is a struct that deal with handling the hardware but does
> not contain any struct device.
>
> When registering gpio_chip we create a struct gpio_device which
> contains a struct device and a struct cdev (exposed to userspace)
> and all in-kernel consumer handles (called struct gpio_desc). This
> is reference counted on the struct device and uses
> ->release() to eventually clean itself up.
>
> The crucial part is what happens when a device with GPIOs
> disappears, if e.g. the USB device is unplugged or the driver
> is rmmod:ed by force from the command line. We then unregister
> the struct gpio_chip and drop all devm_*  resources taken by the
> driver (referencing the struct dev in the USB device or so) so these
> go away, but the struct gpio_device stays around
> until the last reference from userspace is dropped.
>
> In order to not crash calls from the character device the device is
> "numbed", so any calls will just return "OK" but nothing happens.
> We then hope userspace will be so nice to terminate once it realizes
> that it is no longer needed, closing the chardev and releasing the
> resources held.
>
> This works for us but I admit it is a bit kludgy. I guess it is not a
> generally useful practice, we just had to come up with something.

We do something similar in the CXL driver. The driver data is
allocated with devm. When ->remove() is triggered the driver data is
disconnected from the cdev (because it's about to be freed by devres)
and all future ioctls attempts fail until userspace finally gives up
and closes the device-file to release the cdev.

I clumsily attempted to solve this problem in a generic way here:

https://lore.kernel.org/r/CAPcyv4hEpdh_aGcs_73w5KmYWdvR29KB2M2-NNXsaXwxf35Hwg@mail.gmail.com

...Christoph rightly pointed out that this is something debugfs
already handles with its file_operations proxy implementation. I'm
thinking that concept can be extended for drivers to deploy their
ioctl implementation behind a proxy that handles the ioctl shutdown
synchronization in the core and not have every driver open code it.
See fs/debugfs/file.c::FULL_PROXY_FUNC().

