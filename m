Return-Path: <ksummit+bounces-388-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AFB3C9C37
	for <lists@lfdr.de>; Thu, 15 Jul 2021 11:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id CF6203E1093
	for <lists@lfdr.de>; Thu, 15 Jul 2021 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73DEF2F80;
	Thu, 15 Jul 2021 09:54:38 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C0670
	for <ksummit@lists.linux.dev>; Thu, 15 Jul 2021 09:54:36 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id s23so5963683oij.0
        for <ksummit@lists.linux.dev>; Thu, 15 Jul 2021 02:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GrTCppHlbei+a/VW0bHtaACp0ht2/RmYjyXWNlkBXL8=;
        b=dzCGJQWGZKU22rGYHPQ8B7OxRfO3QrVZRCiG06PBhlQQ3Vw5+5c5lhmS1lDnV1gdfh
         lxawLzhkTdQof6zXGoOgAVPqx1o1NJqa7gaqXzOi/p8n0yyuD1I4mwGpw/TTxU1k0TEt
         6pko+1VVq1Lo/3kMPttKsdCw7wcKPUKu6AXk8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GrTCppHlbei+a/VW0bHtaACp0ht2/RmYjyXWNlkBXL8=;
        b=Q3a0hsGUkyIiPztBT541Tk4qyxASc7iHl/UQac52GfhonIXsDdT+zb7efG4OImHxFO
         vFXE2+PRWRdqc3rrioPxSjD++RTCV+r/tR+g78t+WHw5s3abTRvgq4IapTPyke56aA5k
         nMUJftGplgi3qDhkEX52TN8If81m9C5eusF0VrbdEWunWYbU0kzn3Lpey4CbUwikkQzV
         C8p9tVnCb3hnx8AiHMl8t7PWYKByKK7l7yL7rMmivytXg4ZE+z6ILTY4atIU0EezNBes
         VZ9UL3T/eaxfYMWQPIbQYikUD7rlrW9Hco6ydSfuE20JsuHZ0PcSArLYxL/Z42AS33X8
         3sEQ==
X-Gm-Message-State: AOAM530vrJRHerDgzMxuj/Apvc0mdswh6aTjJCMP3hhmP/0j0jqrO9Uk
	hQDa/yb5jQAkw/u331H/J+UtTUJl6y9wyZEBTSWmOw==
X-Google-Smtp-Source: ABdhPJwZ5fJnrNc5myIFA/LF30lDyu4Jj2A+wnh2gcUYlTWRy0RILcvAXQ698duQHG0hgJTnEEGH8YBvcl07X9PsqsM=
X-Received: by 2002:aca:3085:: with SMTP id w127mr7115352oiw.101.1626342873704;
 Thu, 15 Jul 2021 02:54:33 -0700 (PDT)
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
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Jul 2021 11:54:22 +0200
Message-ID: <CAKMK7uHgtGc9ncD3LjHzWxF1eOJ5-M+u=45ZG8-vDtgEAHVJ4Q@mail.gmail.com>
Subject: Re: cdev/devm_* issues (was Re: [TECH TOPIC] Rust for Linux)
To: Greg KH <greg@kroah.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 8:49 AM Greg KH <greg@kroah.com> wrote:
> On Wed, Jul 07, 2021 at 08:17:08PM +0300, Laurent Pinchart wrote:
> > On Wed, Jul 07, 2021 at 02:45:04PM +0200, Greg KH wrote:
> > > On Wed, Jul 07, 2021 at 01:38:44PM +0100, James Bottomley wrote:
> > > > On Wed, 2021-07-07 at 14:20 +0200, Greg KH wrote:
> > > > > On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> > > > > > On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> > > > > > > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > > > > > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:
> > > > > > > > > "devres" / devm_xxx was an attempt to deal with this in C,
> > > > > > > > > but it only solves some cases of this and has not received a
> > > > > > > > > lot of adoption (we can argue about the reasons).
> > > > > > > >
> > > > > > > > Really? From my point of view that is adopted all over the map.
> > > > > > > > I add new users all the time and use it as much as I can when
> > > > > > > > writing new drivers.
> > > > > > >
> > > > > > > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > > > > > > there's some subsystems that reject it for some reason.
> > > > > > >
> > > > > > > > I think it's a formidable success, people just need to learn to
> > > > > > > > do it more.
> > > > > > >
> > > > > > > There *are* issues with people adopting it too enthusiastically -
> > > > > > > as well as the memory lifetime issues that Laurent mentioned it's
> > > > > > > easy for it to cause problems with interrupt handlers that are
> > > > > > > left live longer than they should be and try to use things that
> > > > > > > were already deallocated.
> >
> > (CC'ing Daniel Vetter as the author of the DRM devres-based resource
> > management)
> >
> > I've given this lots of thoughts lately, in the context of V4L2, but it
> > should be roughly the same for character devices in general. Here's what
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
> >
> >   For drivers that register multiple character devices, or in general
> >   expose multiple interfaces to userspace or other parts of the kernel,
> >   the internal data structure must be properly reference-counted, with a
> >   reference released in each .release() callback. There may be ways to
> >   simplify this.
> >
> >   This can be seen as going back to the pre-devm_kzalloc() era, but it's
> >   only about undoing a mistake that was done way too often (to be fair,
> >   many drivers used to just kfree() the data in the driver's .remove()
> >   operation, so it wasn't always a regression, only enshrining a
> >   preexisting bad practice).
> >
> >   This is only part of the puzzle though. There's a remove/use race that
> >   still needs to be solved.
> >
> > - In .remove(), drivers must inform the character device that new access
> >   from userspace are not allowed anymore. This would set a flag in
> >   struct cdev that would result in all new calls from userspace through
> >   file operations to be rejected (with -ENXIO for instance). This should
> >   be wrapped in subsystem-specific functions (e.g.
> >   video_device_disconnect() wrapping cdev_disconnect()). From now on, no
> >   new calls are possible, but existing calls may be in progress.
> >
> > - Drivers then need to cancel all pending I/O and wait for completion.
> >   I/O (either direct memory-mapped I/O or through bus APIs, such as I2C
> >   or USB transactions) are not allowed anymore after .remove() returns.
> >   This will have the side effect of waking up userspace contexts that
> >   are waiting for I/O completion (through a blocking file I/O operation
> >   for instance). Existing calls from userspace will start completing.
> >
> >   This is also a good place to start shutting down the device, for
> >   instance disabling interrupts.
> >
> > - The next step is for drivers to wait until all calls from userspace
> >   complete. This should be done with a call count in struct cdev that is
> >   updated upon entry and exit of calls from userspace, and a wait queue
> >   to wait for that count to go to 0. This should be wrapped in
> >   subsystem-specific APIs. As the flag that indicates device removal is
> >   set, no new calls are allowed so the counter can only decrease, and as
> >   all pending I/O have terminated or have been cancelled, no pending
> >   calls should be blocked.
> >
> > - Finally, drivers should unregister the character device, through the
> >   appropriate subsystem API.
> >
> >   At this point, memory mappings and file handles referencing the device
> >   may still exist, but no file operation is in progress. The device is
> >   quiescent.
> >
> >   Care needs to be taken in drivers and subsystems to not start any I/O
> >   operation when handling the file .release() operation or the
> >   destruction of memory mappings. Overall I don't expect much issues,
> >   but I'm sure some drivers do strange things in those code paths.
> >
> > - When the least memory mapping is gone and the last file handle is
> >   closed, the subsystem will call the driver's .release() callback. At
> >   this point, the driver will perform the operations listed in the first
> >   item of this list.
> >
> >
> > The challenge here will be to make this as easy as possible for drivers,
> > to avoid risk of drivers getting it wrong. The DRM/KMS subsystem has
> > created a devres-based system to handle this, with the devres associated
> > with the drm_device (the abstraction of the cdevs exposed by DRM to
> > userspace), *not* the physical device. It has a drawback though, it
> > assumes that a DRM driver will only ever want to register a drm_device
> > and nothing else, and hardcodes that assumption in the way it releases
> > resources. That's fine for most DRM drivers, but if a driver was to
> > register a drm_device and something else (such as a V4L2 video_device,
> > an input device, ...), the DRM subsystem will get in the way.
> >
> > I have two questions:
> >
> > - Does the above make sense ?
>
> Yes, totally, thank you for taking the time to write this all out.  It's
> been in the back of my mind for over a decade that we need to work on
> these issues, but have not had any time to sit down and write it all
> down like you have.
>
> > - Assuming it does, how do we get from the current mess to a situation
> >   where writing a driver will be a pleasure, not a punishment ? :-)
>
> That's the real question.  Thanks to a lot of cleanups that Christoph
> has recently done to the lower-level cdev code, the lower levels are now
> in a shape where we can work on them better.  I'm going to try to carve
> out some time in the next few months to start to work on these things.
> I think that once we get the ideas of what needs to be done, and a
> working core change, I can unleash some interns on doing tree-wide
> cleanups/changes to help bring everything into alignment.
>
> I'm going to save this email off for reference for later.  But of
> course, if others want to start to attack this earlier, all the better :)

Since we're dropping notes, a few of my thoughts:

- Personally I think an uapi resource cleanup system needs a different
namespace, so that you don't mix these up. Hence drmm_ vs devres_ for
drm, and maybe the generic version could be called uapires or ures or
whatever. It needs to stick out.

- I'm wondering whether we could enlist checkers (maybe a runtime one)
to scream anytime we do an unprotected dereference from ures memory to
devres memory. This would help in subsystem where this problem is
solved by trying to decouple the uapi side from the device side (like
gpio and other subsystem with simpler interfaces). We have undefined
behaviour and data race checkers already, this should be doable. But I
have no idea how :-)

- Core infrastructure like cdev_disconnect sounds really good.
Especially if someone figures out how to punch out mmap without races
in a generic way.

- Many drivers are perfectly ok with their ures on the single cdev
they expose, but like Laurent points out, there's plenty where you
need to group them. We need some way to merge ures groups together so
a driver can say "only release ures for _any_ of these cdev if _all_
of them are released". I'm not sure how to do that, but can also be
done as an additional later on. Maybe an explicit struct ures_group
that complex drivers (or complex subsystems like drm/v4l) can
optionally pass to subordinate uapi interfaces like cdev could make
this work.

- Another good reason for a commont struct to manage uapi resources is
to that we don't need a per-subsystem dupe for everything. Once your
driver is more than a few lines you need more than just drmm_kzalloc,
you might have you own slab, other allocater, a few workqueues,
whatever else there is ....

- Automagic cleanup is great for small drivers, but is hitting a bit a
scaling wall for big drivers. The trouble there is the unwind code to
quiescent the driver with all it's kthread, work queues, workers and
everything else. That needs to happen in a very careful order (if you
flush the work before you disable the interrupt that schedules it,
it's no good) and is an absolute pain to validate. There's a few
reasons why we have barriers here:
* often the same or similar quiescent code is needed for
suspend/resume, so you're not gaining anything if the module unload is
automatic
* unwind as you create/init it not always the right thing to do, or at
least not obviously so, e.g. in i915 we have on interrupt handler, but
it's hiearchical internally, and we arm new subsystems irq sources as
we initialize these parts of the driver
* as soon as you hit something where there's not yet a devres/uapi
wrapper available it gets annoying and giving up is easier :-)

- the real cool stuff starts to happen if you combine devres with
ures, e.g. see devm_drm_dev_alloc(). With that you can achieve drivers
with no ->remove callback that actually get all the lifetime right,
unfortunately we're not there yet, we're missing a
devm_drm_dev_register (to call drm_dev_unplug() outmatically on
remove) and a devm_drm_atomic_reset (which calls drm_atomic_shutdown
on remove) so that for simplest drivers the ->remove hook becomes
empty (e.g. hx8357d_remove()). But you really need the ures side fully
rolled out first or things just go very wrong on hotunplug :-)

Anyway I'm very much interested in this topic and seeing some kind of
solution lifted to core code.

Cheers, Daniel

> thanks,
>
> greg k-h
>
>
>
> >
> > > > > > Fixing this should not be beyond the wit of humankind, though.  If
> > > > > > we delayed deallocation to module release, that would fix the
> > > > > > interrupt issue, wouldn't it?  Perhaps all devres memory for
> > > > > > devices should live until then anyway and thus be automatically
> > > > > > deallocated instead of needing an explicit free ... the problem
> > > > > > with that being compiled in devices currently optimize away the
> > > > > > module refcounting, but that should be fixable.
> > > > >
> > > > > module code lifespans are different than device structure lifespans,
> > > > > it's when people get them confused, as here, that we have problems.
> > > >
> > > > I'm not claiming they are.  What I am claiming is that module lifetime
> > > > must always encompass the device lifetimes.  Therefore, you can never
> > > > be incorrect by using a module lifetime for anything attached to a
> > > > device, just inefficient for using memory longer than potentially
> > > > needed.  However, in a lot of use cases, the device is created on
> > > > module init and destroyed on module exit, so the inefficiency is barely
> > > > noticeable.
> > >
> > > In almost no use case is the device created on module init of a driver.
> > > devices are created by busses, look at the USB code as an example.  The
> > > usb bus creates the devices and then individual modules bind to that
> > > device as needed.  If the device is removed from the system, wonderful,
> > > the device is unbound, but the module is still loaded.  So if you really
> > > wanted to, with your change, just do a insert/remove of a USB device a
> > > few zillion times and then memory is all gone :(
> > >
> > > > The question I'm asking is shouldn't we optimize for this?
> > >
> > > No.
> > >
> > > > so let people allocate devm memory safe in the knowledge it will be
> > > > freed on module release?
> > >
> > > No, see above.  Modules are never removed in a normal system.  devices
> > > are.
> > >
> > > And the drm developers have done great work in unwinding some of these
> > > types of mistakes in their drivers, let's not go backwards please.
> >
> > --
> > Regards,
> >
> > Laurent Pinchart



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

