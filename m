Return-Path: <ksummit+bounces-431-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CA3D0683
	for <lists@lfdr.de>; Wed, 21 Jul 2021 03:42:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 75D6E1C0ED1
	for <lists@lfdr.de>; Wed, 21 Jul 2021 01:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931852FB6;
	Wed, 21 Jul 2021 01:42:16 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56B173
	for <ksummit@lists.linux.dev>; Wed, 21 Jul 2021 01:42:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48F6E4FB;
	Wed, 21 Jul 2021 03:42:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1626831732;
	bh=uG6ZMMxN6hG7CW+eIa87YB0dtb08PObIOJDw5rwr/Wk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=snVFLiRV2DqzbIYyza/9Py8R9slblOlxChcdC4OleQDLFl1J3FKf57pWo3Syt2GGI
	 iMqC2zSnaCks5ZwKPTGyVdEDAqHj9oFZBHl9VylnmxFeIWEE3ziUacqZQB+lGp73+l
	 8xcbh0r0ED0lYfqlpiEVpnyskPi1WTClKjwyKPrU=
Date: Wed, 21 Jul 2021 04:42:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Wedson Almeida Filho <wedsonaf@google.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
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
Message-ID: <YPd7byfwcfbOvPyn@pendragon.ideasonboard.com>
References: <CANiq72ntKzqBWFP-dTKAmsmwfshQa3fc+jm6m4mns4TdRgcCiA@mail.gmail.com>
 <CACRpkdZkWQ=dWieyRch7aFuLOJ+WB_he_Bb_A2z_zJw+BZrQJA@mail.gmail.com>
 <YPVvEZgcP1LMGjcy@google.com>
 <YPV7DTFBRN4UFMH1@google.com>
 <26cd8155-a85c-01e9-bfac-af4bbd15f273@oracle.com>
 <YPW/LNwxwEW4h0GM@google.com>
 <YPXUkKVL+/bw/7QD@pendragon.ideasonboard.com>
 <YPXqGoTWprjpslbP@google.com>
 <YPdiMHr/t5K6RJck@pendragon.ideasonboard.com>
 <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CALCETrWH4N17C+uHaDbzGkgS005feaOVQ25yGo9Zy0cb3+eeGA@mail.gmail.com>

Hi Andy,

On Tue, Jul 20, 2021 at 06:33:38PM -0700, Andy Lutomirski wrote:
> On Tue, Jul 20, 2021 at 4:54 PM Laurent Pinchart wrote:
> > On Mon, Jul 19, 2021 at 10:09:46PM +0100, Wedson Almeida Filho wrote:
> > > On Mon, Jul 19, 2021 at 10:37:52PM +0300, Laurent Pinchart wrote:
> > > > On Mon, Jul 19, 2021 at 07:06:36PM +0100, Wedson Almeida Filho wrote:
> > > > > On Mon, Jul 19, 2021 at 06:02:06PM +0200, Vegard Nossum wrote:
> > > > > > On 7/19/21 3:15 PM, Wedson Almeida Filho wrote:
> > > > > > > On Mon, Jul 19, 2021 at 01:24:49PM +0100, Wedson Almeida Filho wrote:
> > > > > > >> On Fri, Jul 09, 2021 at 12:13:25AM +0200, Linus Walleij wrote:
> > > > > > >>> I have seen that QEMU has a piece of code for the Arm PrimeCell
> > > > > > >>> PL061 GPIO block which corresponds to drivers/gpio/gpio-pl061.c
> > > > > > >>> Note that this hardware apart from being used in all Arm reference
> > > > > > >>> designs is used on ARMv4T systems that are not supported by
> > > > > > >>> LLVM but only GCC, which might complicate things.
> > > > > > >>
> > > > > > >> Here is a working PL061 driver in Rust (converted form the C one):
> > > > > > >> https://raw.githubusercontent.com/wedsonaf/linux/pl061/drivers/gpio/gpio_pl061_rust.rs
> > > > > > >
> > > > > > > I'm also attaching an html rending of the C and Rust versions side by side where
> > > > > > > I try to line the definitions up to make it easier to contrast the two
> > > > > > > implementations.
> > > > > >
> > > > > > This is really cool :-) As a Rust noob, I have a few questions:
> > > > > >
> > > > > > 1. I'm curious about some of the writeb() vs. try_writeb() calls:
> > > > > >
> > > > > > fn direction_output(data: &Ref<DeviceData>, offset: u32, value: bool) ->
> > > > > > Result {
> > > > > >         let woffset = bit(offset + 2).into();
> > > > > >         let _guard = data.lock();
> > > > > >         let pl061 = data.resources().ok_or(Error::ENXIO)?;
> > > > > >         pl061.base.try_writeb((value as u8) << offset, woffset)?;
> > > > > >         let mut gpiodir = pl061.base.readb(GPIODIR);
> > > > > >         gpiodir |= bit(offset);
> > > > > >         pl061.base.writeb(gpiodir, GPIODIR);
> > > > > >
> > > > > >         // gpio value is set again, because pl061 doesn't allow to set
> > > > > > value of a gpio pin before
> > > > > >         // configuring it in OUT mode.
> > > > > >         pl061.base.try_writeb((value as u8) << offset, woffset)?;
> > > > > >         Ok(())
> > > > > >     }
> > > > > >
> > > > > > Here you have try_writeb() (and error return) where there was just a
> > > > > > writeb() without any error handling in the C version. Is this what
> > > > > > Miguel was answering a bit down the thread where the address is computed
> > > > > > ((value as u8) << offset) so it _needs_ to use the try_() version?
> > > > >
> > > > > The `writeb` variant only works when we know at compile-time that the offset is
> > > > > within bounds (the compiler will reject the code otherwise). When the value is
> > > > > computed at runtime we use a `try` version that checks before performing the
> > > > > write. We need this to guarantee memory safety.
> > > > >
> > > > > > If offset can be anything but a "correct" value here, should there be a
> > > > > > check for that somewhere else and then the computed value can be
> > > > > > subsequently treated as safe (i.e. there's a second try_writeb() in the
> > > > > > function that now presumably does the runtime check a second time,
> > > > > > redundantly)?
> > > > >
> > > > > Oh, that's a neat idea. We can certainly implement something like this:
> > > > >
> > > > > let woffset = pl061.base.vet_offsetb(bit(offset + 2))?;
> > > > >
> > > > > Then woffset would be passed to writeb variants that are guaranteed to succeed.
> > > > > (Rust helps us ensure that woffset cannot change without checks, which would be
> > > > > harder to do in C.)
> > > > >
> > > > > > 2. In many places you have the C code:
> > > > > >
> > > > > > struct pl061 *pl061 = dev_get_drvdata(dev);
> > > > > >
> > > > > > with the equivalent Rust code as:
> > > > > >
> > > > > > let pl061 = data.resources().ok_or(Error::ENXIO)?;
> > > > > >
> > > > > > Why doesn't the C code need to check for errors here? Or put
> > > > > > differently, why can the Rust version fail?
> > > > >
> > > > > There are two aspecs worth noting here:
> > > > > 1. In C there is cast from void * to struct pl061 * without really knowing if
> > > > > the stored pointer is of the right type. For example, if I simply change the
> > > > > struct type to say `struct mutex` in the code above, it will still compile,
> > > > > though it will be clearly wrong. In Rust we prevent this by not exposing drvdata
> > > > > directly to drivers, and using type-specialised functions to set/get drvdata, so
> > > > > it *knows* that the type is right. So in this sense Rust is better because it
> > > > > offers type guarantees without additional runtime cost. (In Rust, if you change
> > > > > the type of the function to say `&Mutex`, it won't compile.
> > > > >
> > > > > 2. The extra check we have here is because of a feature that the C code doesn't
> > > > > have: revocable resources. If we didn't want to have this, we could do say
> > > > > `data.base.writeb(...)` directly, but then we could have situations where `base`
> > > > > is used after the device was removed. By having these checks we guarantee that
> > > > > anyone can hold a reference to device state, but they can no longer use hw
> > > > > resources after the device is removed.
> > > >
> > > > If the driver reached a code path with an I/O write after .remove()
> > > > returns, the game is likely over already. It would be more interesting
> > > > to see how we could prevent that from happening in the first place.
> > > > Checking individual I/O writes at runtime will not only add additional
> > > > CPU costs, but will also produce code paths that are not well tested.
> > >
> > > You may be conflating checking offsets in individual writes/reads with accessing
> > > hw resources. Note that these are different things.
> >
> > Yes, it's the data.resources().ok_or() that I was talking about, not the
> > I/O writes, sorry.
> >
> > > > It
> > > > feels that we're inventing a problem just to be able to showcase the
> > > > solution :-)
> > >
> > > Thanks for taking a look. I beg to differ though, as this solves (on the Rust
> > > side) a problem you described the other day on this very thread. The solution is
> > > different from what you propose though :)
> > >
> > > - The internal data structures of drivers are refcounted. Drivers then share
> > >   this internal representation with other subsystems (e.g., cdev).
> >
> > Refcounting the driver-specific structure is good, that matches what I
> > proposed (it's of course implemented differently in C and rust, but
> > that's expected).
> >
> > > - On `remove`, the registrations with other subsystems are removed (so no
> > >   additional sharing of internal data should happen), but existing calls and
> > >   references to internal data structures continue to exist. This part is
> > >   important: we don't "revoke" the references, but we do revoke the hw resources
> > >   part of the internal state.
> >
> > No issue here either. The handling of the internal data structure (the
> > "non-revoke" part to be precise) matches my proposal too I believe.
> > Revoking the I/O memory is of course rust-specific.
> >
> > > - Attempts to access hardware resources freed during `remove` *must* be
> > >   prevented, that's where the calls to `resources()` are relevant -- if a
> > >   subsystem calls into the driver with one of the references it held on to, they
> > >   won't be able to access the (already released) hw resources.
> >
> > That's where our opinions differ. Yes, those accesses must be prevented,
> > but I don't think the right way to do so is to check if the I/O memory
> > resource is still valid. We should instead prevent reaching driver code
> > paths that make those I/O accesses, by waiting for all calls in progress
> > to return, and preventing new calls from being made. This is a more
> > generic solution in the sense that it doesn't prevent accessing I/O
> > memory only, but avoids any operation that is not supposed to take
> > place. My reasoning is that drivers will be written with the assumption
> > that, for instance, nobody will try to set the GPIO direction once
> > .remove() returns. Even if the direction_output() function correctly
> > checks if the I/O memory is available and returns an error if it isn't,
> > it may also contain other logic that will not work correctly after
> > .remove() as the developer will not have considered that case. This
> > uncorrect logic may or may not lead to bugs, and some categories of bugs
> > may be prevented by rust (such as accessing I/O memory after .remove()),
> > but I don't think that's relevant. The subsystem, with minimal help from
> > the driver's implementation of the .remove() function if necessary,
> > should prevent operations from being called when they shouldn't, and
> > especially when the driver's author will not expect them to be called.
> > That way we'll address whole classes of issues in one go. And if we do
> > so, checking if I/O memory access has been revoked isn't required
> > anymore, as we guarantee if isn't.
> >
> > True, this won't prevent I/O memory from being accessed after .remove()
> > in other contexts, for instance in a timer handler that the driver would
> > have registered and forgotten to cancel in .remove(). And maybe the I/O
> > memory revoking mechanism runtime overhead may be a reasonable price to
> > pay for avoiding this, I don't know. I however believe that regardless
> > of whether I/O memory is revoked or not, implementing a mechanism in the
> > subsytem to avoid erroneous conditions from happening in the first place
> > is where we'll get the largest benefit with a (hopefully) reasonable
> > effort.
> 
> Preventing functions from being called, when those functions are
> scattered all over the place (sysfs, etc) may be hard.  Preventing
> access to a resource seems much more tractable.  That being said,
> preventing access to the I/O resource in particular seems a bit odd to
> me.  It's really the whole device that's gone after it has been
> removed.  So maybe the whole device (for some reasonable definition of
> "whole device") could get revoked?

I agree that we should view this from a resource point of view, or
perhaps an object point of view, instead of looking at individual
functions. A GPIO driver creates GPIO controllers, which are objects
that expose an API to consumers. In most cases, it's the whole API that
shouldn't be called after .remove(), not individual functions (there are
a few exceptions, for instead the .release() file operation for objects
exposed through userspace as a cdev may need to reach the object). What
I'd like to see is the subsystem blocking this, instead of having
individual drivers tasked with correctly handling API calls from
consumers after .remove(). The correctness of the latter may be less
difficult to achieve and even guarantee with rust, but that's solving a
problem that shouldn't exist in the first place.

-- 
Regards,

Laurent Pinchart

