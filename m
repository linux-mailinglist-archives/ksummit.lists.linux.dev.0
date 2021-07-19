Return-Path: <ksummit+bounces-409-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC263CEE05
	for <lists@lfdr.de>; Mon, 19 Jul 2021 23:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id ACAB81C0E88
	for <lists@lfdr.de>; Mon, 19 Jul 2021 21:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B952A2FB3;
	Mon, 19 Jul 2021 21:09:54 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528ED72
	for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 21:09:53 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id u1so23710560wrs.1
        for <ksummit@lists.linux.dev>; Mon, 19 Jul 2021 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mH69RB9FEPwWbV8XQn8gGIOibKoxP/7OZUaja0tyIzk=;
        b=feQJCrseJzRtR+9lqhk/TXz/pukAciEgoiDK8qoB2OMjbxxHw/t4Lrqj8Pr5rgKMZp
         S/caxJ7pjM2unyTNk09nrIKdz4twPG+W8nub9wr7dDLkqnkVz3gnsnSEht3WxqqSWROm
         U25xcbXhZ7yfdGOVz1Ax8iiwHfpaehECJb3VUwOSpi8FxEh4h5Emx24yLVsJcTkDyXue
         PP6zL9P1uxzlcDX2VvpayzOhsYSi1Dcj8l99o7CvTSdkhrJtxRrp47yGTvXsK5m2cD+D
         saPgFODv2aP18+5aJd7sZunt64Jgh/aNFdrd4yDYoUsTF5wCaTIJe8pzpnfQ1unYWa+G
         5H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mH69RB9FEPwWbV8XQn8gGIOibKoxP/7OZUaja0tyIzk=;
        b=T7fala6DLo4MR+pLfO2PPoJA5J+2iypCp6zYq33zFwEe4wBMmXhseSDFiReogfbxkC
         NbvhybOjeO6nVcWadckxq7vphzrgyHEUSgsML1rBK3WyR41Y+W3q8rZOYZZbxjqW1Dch
         HGHe18NmQanJyYoQWT3S+8jLBVynLu5nLRiSL8AvxFPLKscOwMUnLVRBJaQG5MwZp15s
         LDI8fktLKyNBYzcV3+9m9QRBLiHhASc7QwD7Y+y6JnPRSqIFyG3OVDk3z/40e/axZhWv
         Cz+fLb2f8Z3p8cRWPcf3egc+L+PXf3gTwtFjmKRL6H8TCpZLQGoFJ+qnI8XRVUWQP5NK
         4NRg==
X-Gm-Message-State: AOAM531C/0x4KSrs7zPKYTU6PsCPbrrGCAM8u+YoNnjTTnSQ5F+XfiVH
	JQZ9eO36m9M7KXc4WU2NhLue
X-Google-Smtp-Source: ABdhPJxLskDmLXa/wqg0GDGgcEFL1ydPRTApqv4yeHjDXymid92oGcWWjhmk/7aihLg/SgUK838l2A==
X-Received: by 2002:a05:6000:18ae:: with SMTP id b14mr31045720wri.427.1626728991396;
        Mon, 19 Jul 2021 14:09:51 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:7317:9289:34f3:7374])
        by smtp.gmail.com with ESMTPSA id x18sm20765904wrw.19.2021.07.19.14.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 14:09:50 -0700 (PDT)
Date: Mon, 19 Jul 2021 22:09:46 +0100
From: Wedson Almeida Filho <wedsonaf@google.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vegard Nossum <vegard.nossum@oracle.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Greg KH <greg@kroah.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Kees Cook <keescook@chromium.org>, Jan Kara <jack@suse.cz>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YPXqGoTWprjpslbP@google.com>
References: <YOb/aJC2VuOcz3YY@google.com>
 <YOdJLYmUkoMyszO7@kroah.com>
 <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com>
 <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
 <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>

On Mon, Jul 19, 2021 at 10:37:52PM +0300, Laurent Pinchart wrote:
> On Mon, Jul 19, 2021 at 07:06:36PM +0100, Wedson Almeida Filho wrote:
> > On Mon, Jul 19, 2021 at 06:02:06PM +0200, Vegard Nossum wrote:
> > > On 7/19/21 3:15 PM, Wedson Almeida Filho wrote:
> > > > On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> > > >> On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> > > >>> I have seen that QEMU has a piece of code for the Arm PrimeCell
> > > >>> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> > > >>> Note that this hardware apart from being used in all Arm reference
> > > >>> designs is used on ARMv4T systems that are not supported by
> > > >>> LLVM but only GCC, which might complicate things.
> > > >>
> > > >> Here is a working PL061 driver in Rust (converted form the C one):
> > > >> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> > > > 
> > > > I'm also attaching an html rending of the C and Rust versions side by side where
> > > > I try to line the definitions up to make it easier to contrast the two
> > > > implementations.
> > > 
> > > This is really cool :-) As a Rust noob, I have a few questions:
> > > 
> > > 1. I'm curious about some of the writeb() vs. try_writeb() calls:
> > > 
> > > fn direction_output(data: &Ref<DeviceData>, offset: u32, value: bool) ->
> > > Result {
> > >         let woffset = bit(offset + 2).into();
> > >         let _guard = data.lock();
> > >         let pl061 = data.resources().ok_or(Error::ENXIO)?;
> > >         pl061.base.try_writeb((value as u8) << offset, woffset)?;
> > >         let mut gpiodir = pl061.base.readb(GPIODIR);
> > >         gpiodir |= bit(offset);
> > >         pl061.base.writeb(gpiodir, GPIODIR);
> > > 
> > >         // gpio value is set again, because pl061 doesn't allow to set
> > > value of a gpio pin before
> > >         // configuring it in OUT mode.
> > >         pl061.base.try_writeb((value as u8) << offset, woffset)?;
> > >         Ok(())
> > >     }
> > > 
> > > Here you have try_writeb() (and error return) where there was just a
> > > writeb() without any error handling in the C version. Is this what
> > > Miguel was answering a bit down the thread where the address is computed
> > > ((value as u8) << offset) so it _needs_ to use the try_() version?
> > 
> > The `writeb` variant only works when we know at compile-time that the offset is
> > within bounds (the compiler will reject the code otherwise). When the value is
> > computed at runtime we use a `try` version that checks before performing the
> > write. We need this to guarantee memory safety.
> > 
> > > If offset can be anything but a "correct" value here, should there be a
> > > check for that somewhere else and then the computed value can be
> > > subsequently treated as safe (i.e. there's a second try_writeb() in the
> > > function that now presumably does the runtime check a second time,
> > > redundantly)?
> > 
> > Oh, that's a neat idea. We can certainly implement something like this:
> > 
> > let woffset = pl061.base.vet_offsetb(bit(offset + 2))?;
> > 
> > Then woffset would be passed to writeb variants that are guaranteed to succeed.
> > (Rust helps us ensure that woffset cannot change without checks, which would be
> > harder to do in C.)
> > 
> > > 2. In many places you have the C code:
> > > 
> > > struct pl061 *pl061 = dev_get_drvdata(dev);
> > > 
> > > with the equivalent Rust code as:
> > > 
> > > let pl061 = data.resources().ok_or(Error::ENXIO)?;
> > > 
> > > Why doesn't the C code need to check for errors here? Or put
> > > differently, why can the Rust version fail?
> > 
> > There are two aspecs worth noting here:
> > 1. In C there is cast from void * to struct pl061 * without really knowing if
> > the stored pointer is of the right type. For example, if I simply change the
> > struct type to say `struct mutex` in the code above, it will still compile,
> > though it will be clearly wrong. In Rust we prevent this by not exposing drvdata
> > directly to drivers, and using type-specialised functions to set/get drvdata, so
> > it *knows* that the type is right. So in this sense Rust is better because it
> > offers type guarantees without additional runtime cost. (In Rust, if you change
> > the type of the function to say `&Mutex`, it won't compile.
> > 
> > 2. The extra check we have here is because of a feature that the C code doesn't
> > have: revocable resources. If we didn't want to have this, we could do say
> > `data.base.writeb(...)` directly, but then we could have situations where `base`
> > is used after the device was removed. By having these checks we guarantee that
> > anyone can hold a reference to device state, but they can no longer use hw
> > resources after the device is removed.
> 
> If the driver reached a code path with an I/O write after .remove()
> returns, the game is likely over already. It would be more interesting
> to see how we could prevent that from happening in the first place.
> Checking individual I/O writes at runtime will not only add additional
> CPU costs, but will also produce code paths that are not well tested.

You may be conflating checking offsets in individual writes/reads with accessing
hw resources. Note that these are different things.

> It
> feels that we're inventing a problem just to be able to showcase the
> solution :-)

Thanks for taking a look. I beg to differ though, as this solves (on the Rust
side) a problem you described the other day on this very thread. The solution is
different from what you propose though :)

- The internal data structures of drivers are refcounted. Drivers then share
  this internal representation with other subsystems (e.g., cdev).
- On `remove`, the registrations with other subsystems are removed (so no
  additional sharing of internal data should happen), but existing calls and
  references to internal data structures continue to exist. This part is
  important: we don't "revoke" the references, but we do revoke the hw resources
  part of the internal state.
- Attempts to access hardware resources freed during `remove` *must* be
  prevented, that's where the calls to `resources()` are relevant -- if a
  subsystem calls into the driver with one of the references it held on to, they
  won't be able to access the (already released) hw resources.

We have this problem specifically in gpio: as Linus explained, they created an
indirection via a pointer which is checked in most entry points, but there is no
synchronisation that guarantees that the pointer will remain valid during a
call, and nothing forces uses of the pointer to be checked (so as Linus points
out, they may need more checks).

For Rust drivers, if the registration with other subsystems were done by doing
references to driver data in Rust, this extra "protection" (that has race
conditions that, timed correctly, lead to use-after-free vulnerabilities) would
be obviated; all would be handled safely on the Rust side (e.g., all accesses
must be checked, there is no way to get to resources without a check, and use of
the resources is guarded by a guard that uses RCU read-side lock).

Do you still think we don't have a problem?

