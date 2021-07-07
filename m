Return-Path: <ksummit+bounces-304-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E283BECEF
	for <lists@lfdr.de>; Wed,  7 Jul 2021 19:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id EC2971C0ECB
	for <lists@lfdr.de>; Wed,  7 Jul 2021 17:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6891C2F80;
	Wed,  7 Jul 2021 17:18:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A0772
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 17:18:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FCEB2E4;
	Wed,  7 Jul 2021 19:17:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1625678272;
	bh=fnl0mIG357VpRWU7964wwX6mmJdk52h9QlriV/XPk2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLvMR8CaoboN0yCV3B8HfKt4WUVFwt5vPHOdviD/PLdWnXBuzlir8rWwF5f/SGHsz
	 IpcwWG5+DvV1wFZnzUnt4Nmf+DVUfkA1OzlkdWPZvuo5Nrsk2Z6mx5cHksu+/KxpP/
	 puqQndN3FEmTFTPJECPoh5mVF4za8iahGSfhc/fM=
Date: Wed, 7 Jul 2021 20:17:08 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Greg KH <greg@kroah.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Roland Dreier <roland@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit@lists.linux.dev, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [TECH TOPIC] Rust for Linux
Message-ID: <YOXhlDsMAZUn1EBg@pendragon.ideasonboard.com>
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
 <20210707105000.GA4394@sirena.org.uk>
 <c24c61f498f43f589eafd423e51f997134d198b7.camel@HansenPartnership.com>
 <YOWcCG9Pm/S+EXFw@kroah.com>
 <11c07bc291b443c2683a2baff5b180ff5b0729a5.camel@HansenPartnership.com>
 <YOWh0Dq+2v+wH3B4@kroah.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YOWh0Dq+2v+wH3B4@kroah.com>

On Wed, Jul 07, 2021 at 02:45:04PM +0200, Greg KH wrote:
> On Wed, Jul 07, 2021 at 01:38:44PM +0100, James Bottomley wrote:
> > On Wed, 2021-07-07 at 14:20 +0200, Greg KH wrote:
> > > On Wed, Jul 07, 2021 at 12:34:31PM +0100, James Bottomley wrote:
> > > > On Wed, 2021-07-07 at 11:50 +0100, Mark Brown wrote:
> > > > > On Tue, Jul 06, 2021 at 10:36:14PM +0200, Linus Walleij wrote:
> > > > > > On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier wrote:
> > > > > > > "devres" / devm_xxx was an attempt to deal with this in C,
> > > > > > > but it only solves some cases of this and has not received a
> > > > > > > lot of adoption (we can argue about the reasons).
> > > > > >  
> > > > > > Really? From my point of view that is adopted all over the map.
> > > > > > I add new users all the time and use it as much as I can when
> > > > > > writing new drivers.
> > > > > 
> > > > > Yes, it's *super* widely used in most of the kernel.  Perhaps
> > > > > there's some subsystems that reject it for some reason.
> > > > > 
> > > > > > I think it's a formidable success, people just need to learn to
> > > > > > do it more.
> > > > > 
> > > > > There *are* issues with people adopting it too enthusiastically -
> > > > > as well as the memory lifetime issues that Laurent mentioned it's
> > > > > easy for it to cause problems with interrupt handlers that are
> > > > > left live longer than they should be and try to use things that
> > > > > were already deallocated.

(CC'ing Daniel Vetter as the author of the DRM devres-based resource
management)

I've given this lots of thoughts lately, in the context of V4L2, but it
should be roughly the same for character devices in general. Here's what
I think should be done for drivers that expose character devices.

- Drivers must stop allocating their internal data structure (the one
  they set as device data with dev_set_drvdata()) with devm_kzalloc().
  The data structure must instead be allocated with a plain kzalloc()
  and reference-counted.

  Most drivers will register a single character device using a
  subsystem-specific API (e.g. video_register_device() in V4L2). The
  subsystem needs to provide a .release() callback, called when the
  last reference to the character device is released. Drivers must
  implement this, and can simply free their internal data structure at
  this point.

  For drivers that register multiple character devices, or in general
  expose multiple interfaces to userspace or other parts of the kernel,
  the internal data structure must be properly reference-counted, with a
  reference released in each .release() callback. There may be ways to
  simplify this.

  This can be seen as going back to the pre-devm_kzalloc() era, but it's
  only about undoing a mistake that was done way too often (to be fair,
  many drivers used to just kfree() the data in the driver's .remove()
  operation, so it wasn't always a regression, only enshrining a
  preexisting bad practice).

  This is only part of the puzzle though. There's a remove/use race that
  still needs to be solved.

- In .remove(), drivers must inform the character device that new access
  from userspace are not allowed anymore. This would set a flag in
  struct cdev that would result in all new calls from userspace through
  file operations to be rejected (with -ENXIO for instance). This should
  be wrapped in subsystem-specific functions (e.g.
  video_device_disconnect() wrapping cdev_disconnect()). From now on, no
  new calls are possible, but existing calls may be in progress.

- Drivers then need to cancel all pending I/O and wait for completion.
  I/O (either direct memory-mapped I/O or through bus APIs, such as I2C
  or USB transactions) are not allowed anymore after .remove() returns.
  This will have the side effect of waking up userspace contexts that
  are waiting for I/O completion (through a blocking file I/O operation
  for instance). Existing calls from userspace will start completing.

  This is also a good place to start shutting down the device, for
  instance disabling interrupts.

- The next step is for drivers to wait until all calls from userspace
  complete. This should be done with a call count in struct cdev that is
  updated upon entry and exit of calls from userspace, and a wait queue
  to wait for that count to go to 0. This should be wrapped in
  subsystem-specific APIs. As the flag that indicates device removal is
  set, no new calls are allowed so the counter can only decrease, and as
  all pending I/O have terminated or have been cancelled, no pending
  calls should be blocked.

- Finally, drivers should unregister the character device, through the
  appropriate subsystem API.

  At this point, memory mappings and file handles referencing the device
  may still exist, but no file operation is in progress. The device is
  quiescent.

  Care needs to be taken in drivers and subsystems to not start any I/O
  operation when handling the file .release() operation or the
  destruction of memory mappings. Overall I don't expect much issues,
  but I'm sure some drivers do strange things in those code paths.

- When the least memory mapping is gone and the last file handle is
  closed, the subsystem will call the driver's .release() callback. At
  this point, the driver will perform the operations listed in the first
  item of this list.


The challenge here will be to make this as easy as possible for drivers,
to avoid risk of drivers getting it wrong. The DRM/KMS subsystem has
created a devres-based system to handle this, with the devres associated
with the drm_device (the abstraction of the cdevs exposed by DRM to
userspace), *not* the physical device. It has a drawback though, it
assumes that a DRM driver will only ever want to register a drm_device
and nothing else, and hardcodes that assumption in the way it releases
resources. That's fine for most DRM drivers, but if a driver was to
register a drm_device and something else (such as a V4L2 video_device,
an input device, ...), the DRM subsystem will get in the way.

I have two questions:

- Does the above make sense ?
- Assuming it does, how do we get from the current mess to a situation
  where writing a driver will be a pleasure, not a punishment ? :-)

> > > > Fixing this should not be beyond the wit of humankind, though.  If
> > > > we delayed deallocation to module release, that would fix the
> > > > interrupt issue, wouldn't it?  Perhaps all devres memory for
> > > > devices should live until then anyway and thus be automatically
> > > > deallocated instead of needing an explicit free ... the problem
> > > > with that being compiled in devices currently optimize away the
> > > > module refcounting, but that should be fixable.
> > > 
> > > module code lifespans are different than device structure lifespans,
> > > it's when people get them confused, as here, that we have problems.
> > 
> > I'm not claiming they are.  What I am claiming is that module lifetime
> > must always encompass the device lifetimes.  Therefore, you can never
> > be incorrect by using a module lifetime for anything attached to a
> > device, just inefficient for using memory longer than potentially
> > needed.  However, in a lot of use cases, the device is created on
> > module init and destroyed on module exit, so the inefficiency is barely
> > noticeable.
> 
> In almost no use case is the device created on module init of a driver.
> devices are created by busses, look at the USB code as an example.  The
> usb bus creates the devices and then individual modules bind to that
> device as needed.  If the device is removed from the system, wonderful,
> the device is unbound, but the module is still loaded.  So if you really
> wanted to, with your change, just do a insert/remove of a USB device a
> few zillion times and then memory is all gone :(
> 
> > The question I'm asking is shouldn't we optimize for this?
> 
> No.
> 
> > so let people allocate devm memory safe in the knowledge it will be
> > freed on module release?
> 
> No, see above.  Modules are never removed in a normal system.  devices
> are.
> 
> And the drm developers have done great work in unwinding some of these
> types of mistakes in their drivers, let's not go backwards please.

-- 
Regards,

Laurent Pinchart

